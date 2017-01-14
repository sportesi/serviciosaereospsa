<?php

namespace BackendBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;

/**
 * Class InstructorController
 * @package BackendBundle\Controller
 * @Route("/instructor")
 */
class InstructorController extends Controller
{
    /**
     * @Route("/")
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();
        $logs = $em->getRepository('AppBundle:Log')->findAll();
        return $this->render(
            'BackendBundle:InstructorViews:index.html.twig',
            [
                'logs' => $logs,
            ]
        );
    }
}
