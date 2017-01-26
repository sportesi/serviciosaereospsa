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
        return $this->redirectToRoute('app_backend_turno_index');
    }

    /**
     * @Route("/")
     */
    public function indexAction()
    {
        return $this->render('Frontend/Default/index.html.twig');
    }
}
