<?php

namespace BackendBundle\Controller;

use AppBundle\Entity\Turno;
use AppBundle\Form\TurnoType;
use AppBundle\ValueObjects\Dia;
use AppBundle\ValueObjects\Horario;
use DateTime;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\DBAL\DBALException;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
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
class TurnoController extends Controller {

    /**
     * @var ArrayCollection
     */
    private $aviones;

    /**
     * @Route("/")
     * @Method("GET")
     */
    public function indexAction(Request $request) {
        $em = $this->getDoctrine()->getManager();

        $this->aviones = $em->getRepository('AppBundle:Avion')->findBy([], ['avionOrder' => 'ASC']);
        $users = $em->getRepository('AppBundle:User')->findAll();

        $week = intval($request->query->get('week'));
        $day = date('w');
        $day = intval($day) - 1;
        $week_start = date('d-m-Y', strtotime('-' . $day . ' days'));

        $pageData = array(
            'aviones' => $this->aviones,
            'week' => $week,
            'weekStart' => $week_start,
            'users' => $users,
            'horarios' => Horario::getHorarios(),
            'dias' => Dia::getDias(),
        );

        return $this->render('BackendBundle:TurnoViews:index.html.twig', $pageData);
    }

    /**
     * @Route("/create")
     * @Method("POST")
     * @param Request $request
     * @return Response
     */
    public function createAction(Request $request)
    {
        $turno = new Turno();
        $turnoForm = $this->createForm(TurnoType::class, $turno);
        $turnoForm->handleRequest($request);
        $fecha = $request->request->get('turno')['fecha'];
        $horario = $request->request->get('turno')['horario'];
        $datetime = DateTime::createFromFormat('Y-m-d', $fecha);
        /* Le sumo tres por la zona horaria */
        $datetime->setTime((intval($horario) / 100) + 3, 00);
        $turno->setFecha($datetime);
        $turno->setUpdatedAt(new DateTime());

        $em = $this->getDoctrine()->getManager();
        $em->persist($turno);
        $em->flush();

        return new Response('');
    }

    /**
     * @Route("/json")
     * @Method("GET")
     */
    public function getJsonAction(Request $request) {
        $encoders = array(new XmlEncoder(), new JsonEncoder());
        $normalizer = new ObjectNormalizer();

        $normalizer->setCircularReferenceHandler(function ($object) {
            return $object->getId();
        });

        $serializer = new Serializer([$normalizer], $encoders);

        $em = $this->getDoctrine()->getManager();
        $qb = $em->createQueryBuilder();

        $qb->select(['t'])
                ->from('AppBundle:Turno', 't');

        $qb->where('t.fecha BETWEEN :start AND :end')
                ->setParameter('start', $request->query->get('start'))
                ->setParameter('end', $request->query->get('end'));

        $turnos = $qb->getQuery()->getResult();

        $jsonContent = $serializer->serialize($turnos, 'json');
        return new Response($jsonContent);
    }

    /**
     * @Route("/turnos/listado/delete/turnos", name="BackendTurnosDelete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request) {
        $deleteIds = $request->request->get('ids');
        $em = $this->getDoctrine()->getManager();

        foreach ($deleteIds as $id) {
            $turno = $em->getRepository('AppBundle:Turno')->find($id);
            if (is_object($turno)) {
                $em->remove($turno);
                $em->flush();
            }
        }

        return new Response('');
    }

    private function notifyChange($alumno, $piloto, $turno, $fecha) {
        $emailArray = array();
        $nombre = '';
        if (is_object($alumno)) {
            array_push($emailArray, $alumno->getEmail());
            $nombre = $alumno->getNombre();
        }
        if (is_object($piloto)) {
            array_push($emailArray, $piloto->getEmail());
            $nombre = $piloto->getNombre();
        }
        $nuevaFecha = new DateTime($fecha);

        $message = \Swift_Message::newInstance()
                ->setSubject('Aviso de cambio de turno')
                ->setFrom(array("appmailer@serviciosaereospsa.esy.es" => "PSA Escuela de Vuelo"))
                ->setTo($emailArray)
                ->setBody($this->renderView(
                            'Emails/change.html.twig', array(
                                'nombre' => strtolower($nombre),
                                'fechaVieja' => $turno->getFecha()->format('d-m-Y H:i'),
                                'horaNueva' => $nuevaFecha->format('H:i'),
                                'fechaNueva' => $nuevaFecha->format('d-m-Y'),
                            )
                    ), 'text/html');
        $this->get('mailer')->send($message);
    }
}
