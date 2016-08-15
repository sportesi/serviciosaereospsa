<?php

namespace BackendBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use AppBundle\Entity\Turno;
use Symfony\Component\Form\Extension\Core\Type\CollectionType;
use Symfony\Component\Serializer\Serializer;
use Symfony\Component\Serializer\Encoder\XmlEncoder;
use Symfony\Component\Serializer\Encoder\JsonEncoder;
use Symfony\Component\Serializer\Normalizer\ObjectNormalizer;

class TurnoController extends Controller
{
    /**
     * @Route("/turnos/listado/{week}", defaults={"week" = 0}, name="BackendHomepage")
     */
    public function indexAction(Request $request, $week)
    {
    	$em = $this->getDoctrine()->getManager();

    	$aviones = $em->getRepository('AppBundle:Avion')->findAll();
    	$horarios = $em->getRepository('AppBundle:Horario')->findAll();
    	$dias = $em->getRepository('AppBundle:Dia')->findBy(array(), array('id' => 'ASC'));
        $alumnos = $em->getRepository('AppBundle:Alumno')->findBy(array(), array('apellido' => 'ASC'));
        $pilotos = $em->getRepository('AppBundle:Piloto')->findBy(array(), array('apellido' => 'ASC'));

        $day = date('w');
        $week_start = strtotime('-'.(1-$day).' days');

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

            foreach ($aviones as $item) {
                if ($item->getId() == $postTurno['avion']) {$turno->setAvion($item); }
            }
            foreach ($horarios as $item) {
                if ($item->getId() == $postTurno['horario']) {$turno->setHorario($item); }
            }
            foreach ($dias as $item) {
                if ($item->getId() == $postTurno['dia']) {$turno->setDia($item); }
            }
            foreach ($alumnos as $item) {
                if ($item->getId() == $postTurno['alumno']) {$turno->setAlumno($item); }
            }
            foreach ($pilotos as $item) {
                if ($item->getId() == $postTurno['piloto']) {$turno->setPiloto($item); }
            }

            $turno->setUpdatedAt(new \DateTime());
            $turno->setFecha(new \DateTime($postTurno['fecha']));
            $turno->setConfirmado(true);
            $turno->setComentario($postTurno['comentario']);

            try {
                $em->persist($turno);
                $em->flush();
                $creado = true;
            } catch (\Doctrine\DBAL\DBALException $e) {
                $creado = false;        
            }

            $pageData['creado'] = $creado;
        }

        return $this->render('BackendBundle:TurnoViews:index.html.twig', $pageData);
    }

    /**
     * @Route("/", name="DefaultBackend")
     */
    public function defaultAction()
    {
        return $this->redirectToRoute('BackendHomepage');
    }

    /**
     * @Route("/turnos/listado/get/json", name="BackendTurnosGetJson")
     */
    public function getJsonAction(Request $request)
    {
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
     * @Route("/turnos/listado/delete/{id}", name="BackendTurnosDelete")
     */
    public function deleteAction($id)
    {
    	if ($id) {
			$em = $this->getDoctrine()->getManager();
    		$turno = $em->getRepository('AppBundle:Turno')->find($id);
    		if (is_object($turno)) {
    			$em->remove($turno);
				$em->flush();
    		}
    	}
        return $this->redirectToRoute('BackendHomepage');
    }

}
