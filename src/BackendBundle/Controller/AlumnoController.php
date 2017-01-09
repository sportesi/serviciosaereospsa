<?php

namespace BackendBundle\Controller;

use AppBundle\Entity\Alumno;
use AppBundle\Form\AlumnoType;
use Doctrine\ORM\EntityManager;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use AppBundle\Entity\Piloto;

/**
 * @Route("/alumno")
 */
class AlumnoController extends Controller {

    /**
     * @var EntityManager
     */
    protected $doctrine;

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
        $deleteForm = $this->createFormBuilder()
                ->setAction($this->generateUrl("alumnoDelete", array("id" => $alumno->getId())))
                ->setMethod("DELETE")
                ->getForm();
        $alumnoForm = $this->createForm(AlumnoType::class, $alumno);
        $pageParameters = array(
            'form' => $alumnoForm->createView(),
            'resetForm' => $resetPasswordForm->createView(),
            'deleteForm' => $deleteForm->createView(),
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
            $user->addRole("ROLE_ALUMN");
            $user->setEnabled(true);
            $um->updateUser($user);

            $message = \Swift_Message::newInstance()
                    ->setSubject('Bienvenido al sistema de turnos')
                    ->setFrom(array("appmailer@serviciosaereospsa.esy.es" => "PSA Escuela de Vuelo"))
                    ->setTo(array($alumno->getEmail()))
                    ->setBody($this->renderView(
                            'Emails/welcome.html.twig', array(
                        'nombre' => strtolower($alumno->getNombre()),
                        'password' => $password,
                            )
                    ), 'text/html');
            $this->get('mailer')->send($message);

            $alumno->setUsuario($user);

            $em->persist($alumno);
            $em->flush();
            return $this->redirectToRoute("BackendAlumnoEdit", array("id" => $alumno->getId()));
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
        $em = $this->getDoctrine()->getManager();

        $user = $this->get('fos_user.user_manager')->findUserByEmail($alumno->getEmail());
        $user->setPlainPassword($password);
        $this->get('fos_user.user_manager')->updateUser($user);

        $message = \Swift_Message::newInstance()
                ->setSubject('Reinicio de Contraseña')
                ->setFrom(array("appmailer@serviciosaereospsa.esy.es" => "PSA Escuela de Vuelo"))
                ->setTo(array($alumno->getEmail()))
                ->setBody($this->renderView(
                        'Emails/reset.html.twig', array(
                    'nombre' => strtolower($alumno->getNombre()),
                    'password' => $password,
                        )
                ), 'text/html');
        $this->get('mailer')->send($message);

        $em->flush();

        return $this->redirectToRoute("BackendAlumnoEdit", array("id" => $alumno->getId()));
    }

    public function generateRandomString($length = 10) {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }

    /**
     * @Route("/delete/{id}", name="alumnoDelete")
     * @Method({"DELETE"})
     */
    public function deleteAction(Alumno $alumno) {
        $em = $this->getDoctrine()->getManager();
        $user = $em->getRepository('AppBundle:User')->find($alumno->getUsuario()->getId());
        $em->remove($user);
        $em->flush();
        return $this->redirectToRoute("BackendAlumnoHomepage");
    }

    /**
     * @Route("/welcome/send/{id}/{return}")
     */
    public function sendWelcomeAction(Alumno $alumno, $return) {
        $password = $this->generateRandomString();
        $user = $this->get('fos_user.user_manager')->findUserByEmail($alumno->getEmail());
        $user->setPlainPassword($password);
        $user->setEnabled(true);
        $this->get('fos_user.user_manager')->updateUser($user);

        $message = \Swift_Message::newInstance()
                ->setSubject('Bienvenido al sistema de turnos')
                ->setFrom(array("appmailer@serviciosaereospsa.esy.es" => "PSA Escuela de Vuelo"))
                ->setTo(array($alumno->getEmail()))
                ->setBody($this->renderView(
                        'Emails/welcome.html.twig', array(
                    'nombre' => strtolower($alumno->getNombre()),
                    'password' => $password,
                        )
                ), 'text/html');
        $this->get('mailer')->send($message);

        if ($return == "true") {
            return $this->redirectToRoute("BackendAlumnoEdit", array("id" => $alumno->getId()));
        } else {
            return $this->redirectToRoute("BackendAlumnoHomepage");
        }

    }

    /**
     * @Route("/transfer/{id}")
     */
    public function transferAction(Alumno $alumno)
    {
        $this->doctrine = $this->getDoctrine()->getManager();

        $piloto = new Piloto();
        $piloto->setApellido($alumno->getApellido());
        $piloto->setDireccion($alumno->getDireccion());
        $piloto->setEmail($alumno->getEmail());
        $piloto->setNombre($alumno->getNombre());
        $piloto->setTelefono($alumno->getTelefono());
        $piloto->setUsuario($alumno->getUsuario());
        
        $this->doctrine->persist($piloto);

        $turnoRepo = $this->doctrine->getRepository('AppBundle:Turno');
        
        $turnosAlumno = $turnoRepo->findBy(['alumno' => $alumno->getId()]);

        foreach ($turnosAlumno as $turno)
        {
            $turno->setPiloto($piloto);
            $turno->setAlumno(null);
            $this->doctrine->persist($turno);
        }

        $this->doctrine->remove($alumno);
        $this->doctrine->flush();

        return $this->redirectToRoute(
            "BackendPilotoEdit", array("id" => $piloto->getId())
        );
    }

}
