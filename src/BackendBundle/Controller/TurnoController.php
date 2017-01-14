<?php

namespace BackendBundle\Controller;

use AppBundle\Entity\Turno;
use AppBundle\ValueObjects\Dia;
use AppBundle\ValueObjects\Horario;
use DateTime;
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

class TurnoController extends Controller {

    /**
     * @Route("/turnos/listado/{week}", defaults={"week" = 0}, name="BackendHomepage")
     */
    public function indexAction(Request $request, $week) {
        $em = $this->getDoctrine()->getManager();

        $aviones = $em->getRepository('AppBundle:Avion')->findBy(array(), array('avionOrder' => 'ASC'));
        $users = $em->getRepository('AppBundle:User')->findAll();

        $day = date('w');
        $day = intval($day) - 1;
        $week_start = date('d-m-Y', strtotime('-' . $day . ' days'));

        $pageData = array(
            'aviones' => $aviones,
            'week' => $week,
            'weekStart' => $week_start,
            'users' => $users,
            'horarios' => Horario::getHorarios(),
            'dias' => Dia::getDias(),
        );

        if ($request->isMethod('POST')) {
            $postTurno = $request->request->get('turno');

            if ($postTurno['id']) {
                $turno = $em->getRepository('AppBundle:Turno')->find($postTurno['id']);
            } else {
                $turno = new Turno();
            }

            try {
                if ($postTurno['multiple'] == 'true' && true) {
                    $selectedDates = json_decode($postTurno['selected-dates']);
                    foreach ($selectedDates as $date) {
                        foreach ($aviones as $item) {
                            if ($item->getId() == $date->avion) {
                                $turno->setAvion($item);
                            }
                        }

                        $turno->setFecha(new DateTime($date->fecha));
                        $turno->setUpdatedAt(new DateTime());
                        $turno->setConfirmado(true);
                        $turno->setComentario($postTurno['comentario']);

                        $em->persist($turno);
                        $em->flush();
                        $turno = new Turno();
                    }
                    return $this->redirectToRoute('BackendHomepage');
                } else {
                    $notify = false;
                    foreach ($aviones as $item) {
                        if ($item->getId() == $postTurno['avion']) {
                            $turno->setAvion($item);
                        }
                    }

                    if ($notify) {
                        $this->notifyChange($turno->getAlumno(), $turno->getPiloto(), $turno, $postTurno['fecha']);
                    }

                    $turno->setFecha(new DateTime($postTurno['fecha']));
                    $turno->setUpdatedAt(new DateTime());
                    $turno->setConfirmado(true);
                    $turno->setComentario($postTurno['comentario']);

                    $em->persist($turno);
                    $em->flush();
                }
                $creado = true;
            } catch (DBALException $e) {
                $creado = false;
            }

            $pageData['creado'] = $creado;
        }

        return $this->render('BackendBundle:TurnoViews:index.html.twig', $pageData);
    }

    /**
     * @Route("/", name="DefaultBackend")
     */
    public function defaultAction() {
        return $this->redirectToRoute('BackendHomepage');
    }

    /**
     * @Route("/turnos/listado/get/json", name="BackendTurnosGetJson")
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
