<?php

namespace AppBundle\Controller\Frontend;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
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
	 * @Route("/turno/calendario/{week}", defaults={"week" = 0}, name="FrontendTurnoHomepage")
	 */
	public function indexAction(Request $request, $week)
	{
    	$em = $this->getDoctrine()->getManager();

    	if ($week > 2) {
    		$week = 2;
    	}

    	$usuario = $this->container->get('security.token_storage')->getToken()->getUser();
    	$alumno = $em->getRepository('AppBundle:Alumno')->findBy(array('usuario' => $usuario));
    	$piloto = $em->getRepository('AppBundle:Piloto')->findBy(array('usuario' => $usuario));

    	$aviones = $em->getRepository('AppBundle:Avion')->findAll();
    	$horarios = $em->getRepository('AppBundle:Horario')->findAll();
    	$dias = $em->getRepository('AppBundle:Dia')->findBy(array(), array('id' => 'ASC'));
        $alumnos = $em->getRepository('AppBundle:Alumno')->findBy(array(), array('apellido' => 'ASC'));
        $pilotos = $em->getRepository('AppBundle:Piloto')->findBy(array(), array('apellido' => 'ASC'));

        $day = date('w', strtotime('+'. $week. ' weeks'));
        $week_start = strtotime('-'.(1-$day).' days');

        $pageData = array(
                'aviones' => $aviones,
                'dias' => $dias,
                'horarios' => $horarios,
                'week' => $week,
                'alumnos' => $alumnos,
                'pilotos' => $pilotos,
                'weekStart' => $week_start,
                'loggedAs' => (sizeof($alumno) > 0) ? 'alumno' : 'piloto',
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

            if (sizeof($alumno) > 0) {
            	$turno->setAlumno($alumno[0]);
            }
            if (sizeof($piloto) > 0) {
            	$turno->setPiloto($piloto[0]);
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
            return $this->redirectToRoute('FrontendTurnoHomepage');
        }

        return $this->render('FrontendBundle:TurnoViews:index.html.twig', $pageData);
	}

	/**
     * @Route("/turno/calendario/get/json", name="FrontendTurnosGetJson")
     */
    public function getJsonAction(Request $request)
    {
        $encoders = array(new XmlEncoder(), new JsonEncoder());
        $normalizer = new ObjectNormalizer();
        $normalizer->setIgnoredAttributes(array('alumno', 'piloto', 'confirmado', 'comentario', 'updatedAt'));
        $serializer = new Serializer(array($normalizer), $encoders);
	
		$em = $this->getDoctrine()->getManager();
		$qb = $em->createQueryBuilder();

		$qb->select(array('t'))
		   ->from('AppBundle:Turno', 't')
		   ->join('AppBundle:Avion', 'a', 'WITH', 'a.id = t.avion')
		   ->join('AppBundle:Dia', 'd', 'WITH', 'd.id = t.dia')
		   ->join('AppBundle:Horario', 'h', 'WITH', 'h.id = t.horario');

		$qb->where('t.fecha BETWEEN :start AND :end')
		   ->setParameter('start', $request->query->get('start'))
		   ->setParameter('end', $request->query->get('end'));

		$turnos = $qb->getQuery()->getResult();

        $jsonContent = $serializer->serialize($turnos, 'json');
        return new Response($jsonContent);
    }

    /**
     * @Route("/turno/calendario/get/by/{id}", name="FrontendTurnosGetBy")
     */
    public function getJsonActionById(Request $request, $id)
    {
        $encoders = array(new XmlEncoder(), new JsonEncoder());
        $normalizer = new ObjectNormalizer();
        $serializer = new Serializer(array($normalizer), $encoders);
	
		$em = $this->getDoctrine()->getManager();
		$qb = $em->createQueryBuilder();

		$usuario = $em->getRepository('AppBundle:User')->find($id);
		$alumno = $em->getRepository('AppBundle:Alumno')->findBy(array('usuario' => $usuario));
		$piloto = $em->getRepository('AppBundle:Piloto')->findBy(array('usuario' => $usuario));

		if (sizeof($alumno) > 0) {
			$qb->select(array('t'))
			   ->from('AppBundle:Turno', 't')
			   ->join('AppBundle:Avion', 'a', 'WITH', 'a.id = t.avion')
			   ->join('AppBundle:Dia', 'd', 'WITH', 'd.id = t.dia')
			   ->join('AppBundle:Horario', 'h', 'WITH', 'h.id = t.horario');

			$qb->where('t.fecha BETWEEN :start AND :end')
			   ->andWhere('t.alumno = :alumno')
			   ->setParameter('start', $request->query->get('start'))
			   ->setParameter('end', $request->query->get('end'))
			   ->setParameter('alumno', $alumno[0]->getId());
		}

		if (sizeof($piloto) > 0) {
		   	$qb->select(array('t'))
			   ->from('AppBundle:Turno', 't')
			   ->join('AppBundle:Avion', 'a', 'WITH', 'a.id = t.avion')
			   ->join('AppBundle:Dia', 'd', 'WITH', 'd.id = t.dia')
			   ->join('AppBundle:Horario', 'h', 'WITH', 'h.id = t.horario');

			$qb->where('t.fecha BETWEEN :start AND :end')
			   ->andWhere('t.piloto = :piloto')
			   ->setParameter('start', $request->query->get('start'))
			   ->setParameter('end', $request->query->get('end'))
			   ->setParameter('piloto', $piloto[0]->getId());
		}

		$turnos = $qb->getQuery()->getResult();

        $jsonContent = $serializer->serialize($turnos, 'json');
        return new Response($jsonContent);
    }

    /**
     * @Route("/turno/listado/delete/{id}", name="FrontendTurnosDelete")
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
        return $this->redirectToRoute('FrontendTurnoHomepage');
    }

}
