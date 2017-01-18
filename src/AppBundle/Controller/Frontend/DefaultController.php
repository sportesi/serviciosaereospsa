<?php

namespace AppBundle\Controller\Frontend;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class DefaultController extends Controller
{
    /**
     * @Route("/lg_check")
     * @return \Symfony\Component\HttpFoundation\RedirectResponse
     */
    public function lgCheckAction()
    {
        if ($this->isGranted('ROLE_ADMIN')) {
            return $this->redirectToRoute('app_backend_turno_index');
        }
        if ($this->isGranted('ROLE_PILOT')) {
            return $this->redirectToRoute('FrontendTurnoHomepage');
        }
        if ($this->isGranted('ROLE_ALUMN')) {
            return $this->redirectToRoute('FrontendTurnoHomepage');
        }
    }

    /**
     * @Route("/")
     */
    public function indexAction()
    {
        return $this->render('FrontendBundle:Default:index.html.twig');
    }
}
