<?php

namespace BackendBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use AppBundle\Entity\Turno;

class TurnoController extends Controller
{
    /**
     * @Route("/turnos/listado/{week}", defaults={"week" = 0}, name="BackendHomepage")
     */
    public function indexAction($week)
    {
    	$em = $this->getDoctrine()->getManager();

    	$aviones = $em->getRepository('AppBundle:Avion')->findAll();
    	$horarios = $em->getRepository('AppBundle:Horario')->findAll();
    	$dias = $em->getRepository('AppBundle:Dia')->findBy(array(), array('id' => 'ASC'));
        $alumnos = $em->getRepository('AppBundle:Alumno')->findBy(array(), array('apellido' => 'ASC'));
        $pilotos = $em->getRepository('AppBundle:Piloto')->findBy(array(), array('apellido' => 'ASC'));

    	$pageData = array(
    			'aviones' => $aviones,
    			'dias' => $dias,
    			'horarios' => $horarios,
    			'week' => $week,
                'alumnos' => $alumnos,
                'pilotos' => $pilotos,
    		);


        return $this->render('BackendBundle:TurnoViews:index.html.twig', $pageData);
    }

    /**
     * @Route("/", name="DefaultBackend")
     */
    public function defaultAction()
    {
        return $this->redirectToRoute('BackendHomepage');
    }

}
