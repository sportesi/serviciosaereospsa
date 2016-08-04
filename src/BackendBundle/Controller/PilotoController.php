<?php

namespace BackendBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;

class PilotoController extends Controller
{
	/**
	 * @Route("/piloto", name="BackendPilotoHomepage")
	 * @Method("GET")
	 */
	public function indexAction()
	{
		$em = $this->getDoctrine()->getManager();

		

	    return $this->render('BackendBundle:PilotoViews:index.html.twig');
	}
}
