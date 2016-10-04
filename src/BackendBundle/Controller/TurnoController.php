<?php

namespace BackendBundle\Controller;

use AppBundle\Entity\Turno;
use DateTime;
use Doctrine\DBAL\DBALException;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Serializer\Encoder\JsonEncoder;
use Symfony\Component\Serializer\Encoder\XmlEncoder;
use Symfony\Component\Serializer\Normalizer\ObjectNormalizer;
use Symfony\Component\Serializer\Serializer;

class TurnoController extends Controller {

    /**
     * @Route("/turnos/listado/{week}", defaults={"week" = 0}, name="BackendHomepage")
     */
    public function indexAction(Request $request, $week) {
        $em = $this->getDoctrine()->getManager();

        $aviones = $em->getRepository('AppBundle:Avion')->findBy(array(), array('avionOrder' => 'ASC'));
        $horarios = $em->getRepository('AppBundle:Horario')->findAll();
        $dias = $em->getRepository('AppBundle:Dia')->findBy(array(), array('id' => 'ASC'));
        $alumnos = $em->getRepository('AppBundle:Alumno')->findBy(array(), array('apellido' => 'ASC'));
        $pilotos = $em->getRepository('AppBundle:Piloto')->findBy(array(), array('apellido' => 'ASC'));

        $day = date('w');
        $day = intval($day) - 1;
        $week_start = date('d-m-Y', strtotime('-'.$day.' days'));

        $pageData = array(
            'aviones' => $aviones,
            'dias' => $dias,
            'horarios' => $horarios,
            'week' => $week,
            'alumnos' => $alumnos,
            'pilotos' => $pilotos,
            'weekStart' => $week_start,
        );

        if ($request->isMethod('POST')) {
            $postTurno = $request->request->get('turno');

            if ($postTurno['id']) {
                $turno = $em->getRepository('AppBundle:Turno')->find($postTurno['id']);
            } else {
                $turno = new Turno();
            }

            try {
                if ($postTurno['multiple'] == 'true') {
                    $selectedDates = json_decode($postTurno['selected-dates']);
                    foreach ($selectedDates as $date) {
                        foreach ($aviones as $item) {
                            if ($item->getId() == $date->avion) {
                                $turno->setAvion($item);
                            }
                        }
                        foreach ($horarios as $item) {
                            if ($item->getId() == $date->horario) {
                                $turno->setHorario($item);
                            }
                        }
                        foreach ($dias as $item) {
                            if ($item->getId() == $date->dia) {
                                $turno->setDia($item);
                            }
                        }
                        foreach ($alumnos as $item) {
                            if ($item->getId() == $postTurno['alumno']) {
                                $turno->setAlumno($item);
                            }
                        }
                        foreach ($pilotos as $item) {
                            if ($item->getId() == $postTurno['piloto']) {
                                $turno->setPiloto($item);
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
                } else {
                    foreach ($aviones as $item) {
                        if ($item->getId() == $postTurno['avion']) {
                            $turno->setAvion($item);
                        }
                    }
                    foreach ($horarios as $item) {
                        if ($item->getId() == $postTurno['horario']) {
                            $turno->setHorario($item);
                        }
                    }
                    foreach ($dias as $item) {
                        if ($item->getId() == $postTurno['dia']) {
                            $turno->setDia($item);
                        }
                    }
                    foreach ($alumnos as $item) {
                        if ($item->getId() == $postTurno['alumno']) {
                            $turno->setAlumno($item);
                        }
                    }
                    foreach ($pilotos as $item) {
                        if ($item->getId() == $postTurno['piloto']) {
                            $turno->setPiloto($item);
                        }
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
        $normalizers = array(new ObjectNormalizer());

        $serializer = new Serializer($normalizers, $encoders);

        $em = $this->getDoctrine()->getManager();
        $qb = $em->createQueryBuilder();

        $qb->select(array('t'))
                ->from('AppBundle:Turno', 't');

        $qb->where('t.fecha BETWEEN :start AND :end')
                ->setParameter('start', $request->query->get('start'))
                ->setParameter('end', $request->query->get('end'));

        $turnos = $qb->getQuery()->getResult();

        $jsonContent = $serializer->serialize($turnos, 'json');
        return new Response($jsonContent);
    }

    /**
     * @Route("/turnos/listado/delete", name="BackendTurnosDelete")
     * @Method("POST")
     */
    public function deleteAction(Request $request) {
        $deleteIds = $request->request->get('ids');
        var_dump($deleteIds);
        $em = $this->getDoctrine()->getManager();
        foreach ($deleteIds as $id) {
            if ($id) {
                $turno = $em->getRepository('AppBundle:Turno')->find($id);
                if (is_object($turno)) {
                    $em->remove($turno);
                    $em->flush();   
                }
            }
        }
        return new Response('');
    }

    /**
     * @Route("/prepare", name="prepare")
     */
    public function prepareAction() {
        $em = $this->getDoctrine()->getManager();

        // $alumnos = $em->getRepository('AppBundle:Alumno')->findAll();

        $user = $this->get('fos_user.user_manager')->findUserByEmail('sebastian.portesi@outlook.com');
        $tokenGenerator = $this->get('fos_user.util.token_generator');
        $user->setConfirmationToken($tokenGenerator->generateToken());
        $this->get('fos_user.mailer')->sendResettingEmailMessage($user);
        $this->get('fos_user.user_manager')->updateUser($user);
        // foreach ($alumnos as $item) {
        // }

        return new Response('<html><body></body></html>');
    }

}
