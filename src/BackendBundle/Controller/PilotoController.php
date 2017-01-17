<?php

namespace BackendBundle\Controller;

use AppBundle\Entity\User;
use AppBundle\Form\PilotoType;
use AppBundle\Form\UserType;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Swift_Message;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

/**
 * @Route("/piloto")
 */
class PilotoController extends Controller
{

    /**
     * @Route("/")
     * @Method("GET")
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $pilotos = $em->getRepository('AppBundle:User')->findByRole('ROLE_PILOT');

        return $this->render('BackendBundle:PilotoViews:index.html.twig', array('pilotos' => $pilotos));
    }

    /**
     * @Route("/edit/{id}")
     * @Method({"GET"})
     * @param User $user
     * @return \Symfony\Component\HttpFoundation\Response
     */
    function editAction(User $user)
    {
        $resetPasswordForm = $this->createFormBuilder()
            ->setAction($this->generateUrl("pilotoResetPassword", ['id' => $user->getId()]))
            ->setMethod("POST")
            ->getForm();
        $deleteForm = $this->createFormBuilder()
            ->setAction($this->generateUrl("pilotoDelete", ['id' => $user->getId()]))
            ->setMethod("DELETE")
            ->getForm();
        $pilotoForm = $this->createForm(UserType::class, $user);
        $pageParameters = [
            'form' => $pilotoForm->createView(),
            'resetForm' => $resetPasswordForm->createView(),
            'deleteForm' => $deleteForm->createView(),
        ];
        return $this->render("BackendBundle:PilotoViews:edit.html.twig", $pageParameters);
    }

    /**
     * @Route("/new")
     * @Method({"GET", "POST"})
     */
    function newAction(Request $request)
    {
        $piloto = new Piloto();
        $form = $this->createForm(PilotoType::class, $piloto);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $um = $this->get('fos_user.user_manager');

            $password = $this->generateRandomString();
            $user = $um->createUser();
            $user->setUsername($piloto->getEmail());
            $user->setEmail($piloto->getEmail());
            $user->setPlainPassword($password);
            $user->addRole("ROLE_PILOT");
            $user->setEnabled(true);
            $um->updateUser($user);

            $message = Swift_Message::newInstance()
                ->setSubject('Bienvenido al sistema de turnos')
                ->setFrom(array("appmailer@serviciosaereospsa.esy.es" => "PSA Escuela de Vuelo"))
                ->setTo(array($piloto->getEmail()))
                ->setBody($this->renderView(
                    'Emails/welcome.html.twig', array(
                        'nombre' => strtolower($piloto->getNombre()),
                        'password' => $password,
                    )
                ), 'text/html');
            $this->get('mailer')->send($message);

            $piloto->setUsuario($user);

            $em->persist($piloto);
            $em->flush();
            return $this->redirectToRoute("BackendPilotoEdit", array("id" => $piloto->getId()));
        }

        return $this->render("BackendBundle:PilotoViews:edit.html.twig", array(
            'form' => $form->createView(),
        ));
    }

    /**
     * @Route("/edit/{id}", name = "BackendPilotoSave")
     * @Method({"POST"})
     */
    function saveAction(Request $request, Piloto $piloto)
    {
        $em = $this->getDoctrine()->getManager();
        $um = $this->get('fos_user.user_manager');

        $previousEmail = $piloto->getEmail();

        $form = $this->createForm(PilotoType::class, $piloto);
        $form->handleRequest($request);

        if ($form->isValid()) {

            if (!empty($previousEmail)) {
                $user = $um->findUserByEmail($previousEmail);
                $user->setEmail($piloto->getEmail());
                $um->updateUser($user);
            }

            $em->persist($piloto);
            $em->flush();
            return $this->redirectToRoute("BackendPilotoEdit", array("id" => $piloto->getId()));
        } else {
            $pageParameters = array(
                'form' => $form->createView(),
            );
            return $this->render("BackendBundle:PilotoViews:edit.html.twig", $pageParameters);
        }
    }

    /**
     * @Route("/reset/{id}", name="pilotoResetPassword")
     */
    public function resetPasswordAction(Request $request, Piloto $piloto)
    {
        $password = $this->generateRandomString();
        $em = $this->getDoctrine()->getManager();

        $user = $this->get('fos_user.user_manager')->findUserByEmail($piloto->getEmail());
        $user->setPlainPassword($password);
        $this->get('fos_user.user_manager')->updateUser($user);

        $message = Swift_Message::newInstance()
            ->setSubject('Reinicio de Contraseña')
            ->setFrom(array("appmailer@serviciosaereospsa.esy.es" => "PSA Escuela de Vuelo"))
            ->setTo(array($piloto->getEmail()))
            ->setBody($this->renderView(
                'Emails/reset.html.twig', array(
                    'nombre' => strtolower($piloto->getNombre()),
                    'password' => $password,
                )
            ), 'text/html');
        $this->get('mailer')->send($message);

        $em->flush();

        return $this->redirectToRoute("BackendPilotoEdit", array("id" => $piloto->getId()));
    }

    function generateRandomString($length = 10)
    {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }

    /**
     * @Route("/delete/{id}", name="pilotoDelete")
     * @param Piloto $piloto
     * @Method({"DELETE"})
     */
    public function deleteAction(Piloto $piloto)
    {
        $em = $this->getDoctrine()->getManager();
        $user = $em->getRepository('AppBundle:User')->find($piloto->getUsuario()->getId());
        $em->remove($user);
        $em->flush();
        return $this->redirectToRoute("BackendPilotoHomepage");
    }

    /**
     * @Route("/welcome/send/{id}")
     */
    public function sendWelcomeAction(Piloto $piloto)
    {
        $password = $this->generateRandomString();
        $user = $this->get('fos_user.user_manager')->findUserByEmail($piloto->getEmail());
        $user->setPlainPassword($password);
        $user->setEnabled(true);
        $this->get('fos_user.user_manager')->updateUser($user);

        $message = \Swift_Message::newInstance()
            ->setSubject('Bienvenido al sistema de turnos')
            ->setFrom(array("appmailer@serviciosaereospsa.esy.es" => "PSA Escuela de Vuelo"))
            ->setTo(array($piloto->getEmail()))
            ->setBody($this->renderView(
                'Emails/welcome.html.twig', array(
                    'nombre' => strtolower($piloto->getNombre()),
                    'password' => $password,
                )
            ), 'text/html');
        $this->get('mailer')->send($message);

        return $this->redirectToRoute(
            "BackendPilotoEdit", array("id" => $piloto->getId())
        );
    }

}
