<?php

namespace BackendBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;

class AvionController extends Controller
{
	/**
	 * @Route("/avion", name="BackendAvionHomepage")
	 */
	public function indexAction()
	{
	    return $this->render('BackendBundle:AvionViews:index.html.twig');
	}
}
