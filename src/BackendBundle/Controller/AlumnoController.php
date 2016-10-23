<?php

namespace BackendBundle\Controller;

use AppBundle\Entity\Alumno;
use AppBundle\Form\AlumnoType;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

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
     * @Method({"GET"})
     * @param integer $id
     * @return View
     */
    function editAction($id) {
        $em = $this->getDoctrine()->getManager();
        if ($id != 0) {
            $alumnoToEdit = $em->getRepository("AppBundle:Alumno")->find($id);
        } else {
            $alumnoToEdit = new Alumno();
        }

        $alumnoForm = $this->createForm(AlumnoType::class, $alumnoToEdit);
        $pageParameters = array(
            'form' => $alumnoForm->createView(),
        );
        return $this->render("BackendBundle:AlumnoViews:edit.html.twig", $pageParameters);
    }

    /**
     * @Route("/alumno/edit/{id}", defaults = { "id" = 0 }, name = "BackendAlumnoSave")
     * @Method({"POST"})
     * @param Request $request
     * @return type
     */
    function saveAction(Request $request, $id) {
        $em = $this->getDoctrine()->getManager();
        $rp = $em->getRepository("AppBundle:Alumno");
        if ($id != 0) {
            $alumno = $rp->find($id);
        } else {
            $alumno = new Alumno();
        }

        $form = $this->createForm(AlumnoType::class, $alumno);
        $form->handleRequest($request);
        if ($form->isValid()) {
            $em->persist($alumno);
            $em->flush();
            return $this->redirectToRoute("BackendAlumnoEdit", array("id" => $alumno->getId()));
        } else {
            $pageParameters = array(
                'form' => $form->createView(),
            );
            return $this->render("BackendBundle:AlumnoViews:edit.html.twig", $pageParameters);
        }
    }

}
