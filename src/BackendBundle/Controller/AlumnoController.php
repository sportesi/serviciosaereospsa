<?php

namespace BackendBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;

class AlumnoController extends Controller {

    /**
     * @Route("/alumno/listado", name="BackendAlumnoHomepage")
     * @Method("GET")
     */
    public function indexAction() {
        $em = $this->getDoctrine()->getManager();

        $alumnos = $em->getRepository('AppBundle:Alumno')->findAllWithUser();

        return $this->render('BackendBundle:AlumnoViews:index.html.twig', array('alumnos' => $alumnos));
    }

    /**
     * @Route("/alumno/edit/{id}", defaults = { "id" = 0 }, name = "BackendAlumnoEdit")
     * @param integer $id
     * @return View
     */
    function editAction($id) {
        $em = $this->getDoctrine()->getManager();
        if ($id != 0) {
            $alumnoToEdit = $em->getRepository("AppBundle:Alumno")->find($id);
        } else {
            $alumnoToEdit = new \AppBundle\Entity\Alumno();
        }
        
        $alumnoForm = $this->createForm(\AppBundle\Form\AlumnoType::class, $alumnoToEdit);
        $pageParameters = array(
            'form' => $alumnoForm->createView(),
        );
        return $this->render("BackendBundle:AlumnoViews:edit.html.twig", $pageParameters);
    }

}
