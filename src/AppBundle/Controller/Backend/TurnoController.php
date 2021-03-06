<?php

namespace AppBundle\Controller\Backend;

use AppBundle\Controller\BaseController;
use AppBundle\Entity\Turno;
use AppBundle\Form\TurnoType;
use AppBundle\Repository\TurnoRepository;
use AppBundle\ValueObjects\Dia;
use AppBundle\ValueObjects\Horario;
use DateTime;
use Doctrine\DBAL\Exception\UniqueConstraintViolationException;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Config\Definition\Exception\Exception;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Serializer\Encoder\JsonEncoder;
use Symfony\Component\Serializer\Encoder\XmlEncoder;
use Symfony\Component\Serializer\Normalizer\ObjectNormalizer;
use Symfony\Component\Serializer\Serializer;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Symfony\Component\Validator\Constraints\Date;

/**
 * Class TurnoController
 * @package BackendBundle\Controller
 * @Route("/turno")
 */
class TurnoController extends BaseController
{

    /**
     * @Route("/")
     * @Method("GET")
     * @param Request $request
     * @return Response
     */
    public function indexAction(Request $request)
    {
        $em = $this->getDoctrine()->getManager();

        $aviones = $em->getRepository('AppBundle:Avion')->findBy([], ['avionOrder' => 'ASC']);
        $users = $em->getRepository('AppBundle:User')->findAllUsers($this->getUser());

        $week = intval($request->query->get('week'));
        $day = date('w');
        $day = intval($day) - 1;
        $week_start = date('d-m-Y', strtotime('-' . $day . ' days'));

        $pageData = [
            'aviones' => $aviones,
            'week' => $week,
            'weekStart' => $week_start,
            'users' => $users,
            'horarios' => Horario::getHorarios(),
            'dias' => Dia::getDias(),
        ];

        return $this->render('Backend/TurnoViews/index.html.twig', $pageData);
    }

    /**
     * @Route("/create")
     * @Method("POST")
     * @param Request $request
     * @return Response
     */
    public function createAction(Request $request)
    {
        try {
            $created = [];
            $turnoRequest = $request->request->get('turno');
            if ($turnoRequest['multiple']) {
                $multiple = json_decode($turnoRequest['selected-dates']);
                foreach ($multiple as $item) {
                    $turno = $this->parseTurnoRequest($request, new Turno());
                    $turno->setCreatedAt(new DateTime());
                    $turno->setCreatedBy($this->getUser());
                    $this->persistTurno($turno, $item->fecha, $item->horario, $item->avion);
                    $created[] = $turno->getId();
                }
            } else {
                $turno = $this->parseTurnoRequest($request, new Turno());
                $turno->setCreatedAt(new DateTime());
                $turno->setCreatedBy($this->getUser());
                $this->persistTurno($turno, $turnoRequest['fecha'], $turnoRequest['horario']);
                $created[] = $turno->getId();
            }
            $this->log('Crear Turno', 'Turnos');
        } catch (\Exception $ex) {
            return new Response($ex->getMessage(), 500);
        }

        return new JsonResponse($created);
    }

    /**
     * @Route("/delete")
     * @Method("DELETE")
     * @param Request $request
     * @return Response
     */
    public function deleteAction(Request $request)
    {
        $deleteIds = $request->request->get('ids');
        $em = $this->getDoctrine()->getManager();

        try {
            foreach ($deleteIds as $id) {
                $turno = $em->getRepository('AppBundle:Turno')->find($id);
                if (is_object($turno)) {
                    $this->checkUserAbleToDelete($turno);
                    $em->remove($turno);
                    $em->flush();
                }
            }
            $this->log('Eliminar Turno', 'Turnos');
        } catch (\Exception $ex) {
            return new Response($ex->getMessage(), 500);
        }

        return new Response('');
    }

    /**
     * @Route("/update/{id}")
     * @Method("POST")
     * @param Request $request
     * @param Turno $turno
     * @return Response
     */
    public function updateAction(Request $request, Turno $turno)
    {
        try {
            $fechaVieja = $turno->getFecha();
            $turnoRequest = $request->request->get('turno');
            $turnoUpdate = $this->parseTurnoRequest($request, $turno);
            $this->persistTurno($turnoUpdate, $turnoRequest['fecha'], $turnoRequest['horario']);
            $this->notifyChange($turno, $fechaVieja);
            $this->log('Editar/Mover Turno', 'Turnos');
        } catch (\Exception $ex) {
            return new Response($ex->getMessage(), 500);
        }

        return new Response('');
    }

    /**
     * @param Turno $turno
     * @param $fecha
     * @param $horario
     * @param null $avion
     * @throws \Exception
     */
    private function persistTurno(Turno $turno, $fecha, $horario, $avion = null)
    {
        $em = $this->getDoctrine()->getManager();

        $datetime = DateTime::createFromFormat('Y-m-d', $fecha);
        $datetime->setTime((intval($horario) / 100) + 3, 00);

        $turno->setFecha($datetime);
        $turno->setUpdatedAt(new DateTime());

        if ($avion) {
            $turno->setAvion($em->getRepository('AppBundle:Avion')->find($avion));
        }

        if ($turno->getFecha() >= $turno->getAvion()->getDesdeFueraServicio() && $turno->getFecha() <= $turno->getAvion()->getHastaFueraServicio()) {
            throw new \Exception('No se puede cargar un turno sobre un avion fuera de servicio');
        }

        if (!$this->isGranted('ROLE_ADMIN') && !$this->isGranted('ROLE_INSTR') && $this->getUser() != $turno->getUser()) {
            throw new \Exception('No tenés permiso para realizar esta acción');
        }

        $this->checkUserLimit($turno);
        $this->checkDay($turno);

        try {
            $em->persist($turno);
            $em->flush();
        } catch (UniqueConstraintViolationException $ex) {
            throw new \Exception('No se puede cargar dos turnos en el mismo horario');
        }
    }

    /**
     * @param Request $request
     * @param Turno $turno
     * @return Turno
     */
    private function parseTurnoRequest(Request $request, Turno $turno)
    {
        $turnoForm = $this->createForm(TurnoType::class, $turno);
        $turnoForm->handleRequest($request);
        return $turno;
    }

    /**
     * @Route("/json")
     * @Method("GET")
     * @param Request $request
     * @return Response
     */
    public function getJsonAction(Request $request)
    {
        $encoders = array(new XmlEncoder(), new JsonEncoder());
        $normalizer = new ObjectNormalizer();

        $normalizer->setCircularReferenceHandler(function ($object) {
            return $object->getId();
        });

        $ignored = [
            'turno',
            'password',
            'salt',
            'plainPassword',
            'username',
            'usernameCanonical',
            'emailCanonical',
            'lastLogin',
            'confirmationToken',
            'accountNonExpired',
            'accountNonLocked',
            'credentialsNonExpired',
            'enabled',
            'superAdmin',
            'passwordRequestedAt',
            'timezone',
            'offset',
            'groups',
            'groupNames',
            '__initializer__',
            '__cloner__',
            '__isInitialized__',
            'avionOrder',
            'log'
        ];

        if (!$this->isGranted('ROLE_ADMIN') && !$this->isGranted('ROLE_INSTR')) {
            $ignored[] = 'user';
        }

        $normalizer->setIgnoredAttributes($ignored);
        $serializer = new Serializer([$normalizer], $encoders);
        /**
         * @var TurnoRepository $repo
         */
        $repo = $this->getDoctrine()->getManager()->getRepository('AppBundle:Turno');

        if (!$this->isGranted('ROLE_ADMIN') && !$this->isGranted('ROLE_INSTR')) {
            $serializedContent = json_decode($serializer->serialize(
                $repo->findByNotUser(
                    $this->getUser(),
                    new \DateTime($request->query->get('start')),
                    new \DateTime($request->query->get('end'))
                ), 'json'));
            $response = json_encode(array_merge($serializedContent, $this->getTurnosByUser()));
        } else {
            $serializedContent = json_decode($serializer->serialize($repo->findByDateRange(
                new \DateTime($request->query->get('start')),
                new \DateTime($request->query->get('end'))
            ), 'json'));
            $response = json_encode($serializedContent);
        }

        return new Response($response);
    }

    /**
     * @return mixed
     */
    private function getTurnosByUser()
    {
        $ignored = [
            'turno',
            'password',
            'salt',
            'plainPassword',
            'username',
            'usernameCanonical',
            'emailCanonical',
            'lastLogin',
            'confirmationToken',
            'accountNonExpired',
            'accountNonLocked',
            'credentialsNonExpired',
            'enabled',
            'superAdmin',
            'passwordRequestedAt',
            'timezone',
            'offset',
            'groups',
            'groupNames',
            '__initializer__',
            '__cloner__',
            '__isInitialized__',
            'avionOrder'
        ];
        $encoders = array(new XmlEncoder(), new JsonEncoder());
        $normalizer = new ObjectNormalizer();
        $normalizer->setCircularReferenceHandler(function ($object) {
            return $object->getId();
        });
        $normalizer->setIgnoredAttributes($ignored);
        $serializer = new Serializer([$normalizer], $encoders);
        $repo = $this->getDoctrine()->getManager()->getRepository('AppBundle:Turno');
        return json_decode($serializer->serialize($repo->findByUser($this->getUser()), 'json'));
    }

    /**
     * @param Turno $turno
     * @param DateTime $fechaVieja
     */
    private function notifyChange(Turno $turno, DateTime $fechaVieja)
    {
        $nombre = $turno->getUser()->getUserData()->getName() . " " . $turno->getUser()->getUserData()->getLastName();

        $message = \Swift_Message::newInstance()
            ->setSubject('Aviso de cambio de turno')
            ->setFrom([
                "appmailer@serviciosaereospsa.esy.es" => "PSA Escuela de Vuelo"
            ])
            ->setTo([$turno->getUser()->getEmail()])
            ->setBody($this->renderView(
                'Emails/change.html.twig',
                [
                    'nombre' => strtolower($nombre),
                    'horaNueva' => $turno->getFecha()->sub(new \DateInterval('PT3H'))->format('H:i'),
                    'fechaVieja' => $fechaVieja->sub(new \DateInterval('PT3H'))->format('d-m-Y H:i'),
                    'fechaNueva' => $turno->getFecha()->format('d-m-Y'),
                ]
            ), 'text/html');
        $this->get('mailer')->send($message);
    }

    /**
     * @param Turno $turno
     * @throws \Exception
     */
    private function checkUserLimit(Turno $turno)
    {
        $turnos = $this->getDoctrine()
            ->getManager()
            ->getRepository(Turno::class)
            ->findByUserAndDate($turno, $this->getUser());
        if (!$this->isGranted('ROLE_ADMIN') && !$this->isGranted('ROLE_PILOT') && !$this->isGranted('ROLE_INSTR') && sizeof($turnos) > 0) {
            throw new \Exception("Solo puede reservar un turno por dia. \nPara mas informacion comuniquese con PSA. \nGracias");
        }
    }

    /**
     * @param Turno $turno
     * @throws \Exception
     */
    private function checkUserAbleToDelete(Turno $turno)
    {
        if (!$this->isGranted('ROLE_ADMIN') && !$this->isGranted('ROLE_INSTR')) {
            $limit = $turno->getFecha();
            $limit->add(new \DateInterval('P1D'));
            $now = new DateTime();
            if (intval($now->diff($turno->getFecha())->format('%d')) < 1) {
                throw new \Exception("Los turnos pueden cancelarse con un dia de anticipacion. \nPara mas informacion comuniquese con PSA. \nGracias");
            }
        }
    }

    private function checkDay(Turno $turno)
    {
        if (!$this->isGranted('ROLE_ADMIN') && !$this->isGranted('ROLE_INSTR')) {
            $now = new DateTime();
            if ($now > $turno->getFecha()) {
                throw new \Exception('No se puede cargar un turno en el pasado');
            }
        }
    }
}
