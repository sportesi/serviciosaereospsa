<?php

namespace BackendBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;

class DefaultController extends Controller
{
    /**
     * @Route("/", name="BackendHomepage")
     */
    public function indexAction()
    {
    	$em = $this->getDoctrine()->getManager();

    	$aviones = $em->getRepository('AppBundle:Avion')->findAll();
    	$horarios = $em->getRepository('AppBundle:Horario')->findAll();
    	$dias = $em->getRepository('AppBundle:Dia')->findBy(array(), array('id' => 'ASC'));

    	$pageData = array(
    			'aviones' => $aviones,
    			'dias' => $dias,
    			'horarios' => $horarios,
    		);

        return $this->render('BackendBundle:Default:index.html.twig', $pageData);
    }

}
