<?php

namespace BackendBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;

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

    	$pageData = array(
    			'aviones' => $aviones,
    			'dias' => $dias,
    			'horarios' => $horarios,
    			'week' => $week,
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
