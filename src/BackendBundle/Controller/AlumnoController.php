<?php

namespace BackendBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;

class AlumnoController extends Controller
{
	/**
	 * @Route("/alumno/listado", name="BackendAlumnoHomepage")
	 * @Method("GET")
	 */
	public function indexAction()
	{
		$em = $this->getDoctrine()->getManager();

		$alumnos = $em->getRepository('AppBundle:Alumno')->findAllWithUser();

	    return $this->render('BackendBundle:AlumnoViews:index.html.twig', array('alumnos' => $alumnos));
	}
}
