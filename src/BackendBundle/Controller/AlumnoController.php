<?php

namespace BackendBundle\Controller;

use AppBundle\Entity\Alumno;
use AppBundle\Form\AlumnoType;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

/**
 * @Route("/alumno")
 */
class AlumnoController extends Controller {

    /**
     * @Route("/listado", name="BackendAlumnoHomepage")
     * @Method("GET")
     */
    public function indexAction() {
        $em = $this->getDoctrine()->getManager();

        $alumnos = $em->getRepository('AppBundle:Alumno')->findAllWithUser();

        return $this->render('BackendBundle:AlumnoViews:index.html.twig', array('alumnos' => $alumnos));
    }

    /**
     * @Route("/edit/{id}", name = "BackendAlumnoEdit")
     * @Method({"GET"})
     */
    function editAction(Alumno $alumno) {
        $resetPasswordForm = $this->createFormBuilder()
                ->setAction($this->generateUrl("alumnoResetPassword", array("id" => $alumno->getId())))
                ->setMethod("POST")
                ->getForm();
        $alumnoForm = $this->createForm(AlumnoType::class, $alumno);
        $pageParameters = array(
            'form' => $alumnoForm->createView(),
            'resetForm' => $resetPasswordForm->createView(),
        );
        return $this->render("BackendBundle:AlumnoViews:edit.html.twig", $pageParameters);
    }

    /**
     * @Route("/new", name = "BackendAlumnoNew")
     * @Method({"GET", "POST"})
     */
    function newAction(Request $request) {
        $alumno = new Alumno();
        $form = $this->createForm(AlumnoType::class, $alumno);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $um = $this->get('fos_user.user_manager');
            
            $password = $this->generateRandomString();
            $user = $um->createUser();
            $user->setUsername($alumno->getEmail());
            $user->setEmail($alumno->getEmail());
            $user->setPlainPassword($password);
            $um->updateUser($user);

            $message = \Swift_Message::newInstance()
                    ->setSubject('Bienvenido al sistema de turnos')
                    ->setFrom(array("appmailer@serviciosaereospsa.esy.es" => "PSA Escuela de Vuelo"))
                    ->setTo(array($alumno->getEmail()))
                    ->setBody("Su Contraseña: " . $password);
            $this->get('mailer')->send($message);

            $em->persist($alumno);
            $em->flush();
        }

        return $this->render("BackendBundle:AlumnoViews:edit.html.twig", array(
                    'form' => $form->createView(),
        ));
    }

    /**
     * @Route("/edit/{id}", name = "BackendAlumnoSave")
     * @Method({"POST"})
     */
    function saveAction(Request $request, Alumno $alumno) {
        $em = $this->getDoctrine()->getManager();
        $um = $this->get('fos_user.user_manager');

        $previousEmail = $alumno->getEmail();

        $form = $this->createForm(AlumnoType::class, $alumno);
        $form->handleRequest($request);

        if ($form->isValid()) {

            if (!empty($previousEmail)) {
                $user = $um->findUserByEmail($previousEmail);
                $user->setEmail($alumno->getEmail());
                $um->updateUser($user);
            }

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

    /**
     * @Route("/reset/{id}", name="alumnoResetPassword")
     */
    public function resetPasswordAction(Request $request, Alumno $alumno) {
        $password = $this->generateRandomString();

        $user = $this->get('fos_user.user_manager')->findUserByEmail('sebastian.portesi@outlook.com');
        $user->setPlainPassword($password);
        $this->get('fos_user.user_manager')->updateUser($user);

        $message = \Swift_Message::newInstance()
                ->setSubject('Reinicio de Contraseña')
                ->setFrom(array("appmailer@serviciosaereospsa.esy.es" => "PSA Escuela de Vuelo"))
                ->setTo(array("sebastian.portesi@outlook.com"))
                ->setBody("Password: " . $password);
        $this->get('mailer')->send($message);

        return new Response('<html><body></body></html>');
    }

    function generateRandomString($length = 10) {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }

}
