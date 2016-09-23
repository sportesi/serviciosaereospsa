<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class DefaultController extends Controller
{
    /**
     * @Route("/", name="RoutingController")
     */
    public function indexAction(Request $request)
    {
        if ($this->isGranted('ROLE_ADMIN')) {
            return $this->redirectToRoute('BackendHomepage');
        }
        if ($this->isGranted('ROLE_PILOT')) {
            return $this->redirectToRoute('FrontendTurnoHomepage');
        }
        if ($this->isGranted('ROLE_ALUMN')) {
            return $this->redirectToRoute('FrontendTurnoHomepage');
        }
    }
}
