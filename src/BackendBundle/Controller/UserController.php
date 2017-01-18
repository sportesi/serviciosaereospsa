<?php

namespace BackendBundle\Controller;

use AppBundle\Entity\User;
use AppBundle\Form\UserType;
use AppBundle\Services\StringService;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Swift_Message;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\BrowserKit\Response;
use Symfony\Component\Form\Form;
use Symfony\Component\HttpFoundation\Request;

/**
 * @Route("/user")
 */
class UserController extends Controller
{

    /**
     * @Route("/")
     * @Method("GET")
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $pilotos = $em->getRepository('AppBundle:User')->findAll();

        return $this->render('BackendBundle:UserViews:index.html.twig', array('pilotos' => $pilotos));
    }

    /**
     * @Route("/edit/{id}")
     * @Method("GET")
     * @param User $user
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function editAction(User $user)
    {
        $pageParameters = [
            'form' => $this->getUserForm($user, true)->createView(),
            'resetForm' => $this->getResetForm($user)->createView(),
            'deleteForm' => $this->getDeleteForm($user)->createView(),
        ];
        return $this->render("BackendBundle:UserViews:edit.html.twig", $pageParameters);
    }

    /**
     * @Route("/update/{id}")
     * @Method("POST")
     * @param Request $request
     * @param User $user
     * @return \Symfony\Component\HttpFoundation\RedirectResponse
     */
    public function updateAction(Request $request, User $user)
    {
        $updateUser = $this->parseUserRequest($request, $user);
        $this->persistUser($updateUser);
        return $this->redirectToRoute('backend_user_edit', ['id' => $user->getId()]);
    }

    /**
     * @Route("/new")
     * @Method("GET")
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function newAction()
    {
        return $this->render("BackendBundle:UserViews:edit.html.twig", array(
            'form' => $this->getUserForm(new User())->createView(),
        ));
    }

    /**
     * @Route("/create")
     * @Method("POST")
     * @param Request $request
     * @return \Symfony\Component\HttpFoundation\RedirectResponse
     */
    public function createAction(Request $request)
    {
        $user = $this->parseUserRequest($request, new User());
        $user->setUsername(StringService::generateUsername($user));
        $user->setUsernameCanonical($user->getUsername());
        $user->setPlainPassword(StringService::generateRandomString());
        $this->persistUser($user);
        return $this->redirectToRoute('backend_user_edit', ['id' => $user->getId()]);
    }

    /**
     * @Route("/reset/{id}", name="pilotoResetPassword")
     */
    public function resetPasswordAction(Request $request, Piloto $piloto)
    {
        $password = StringService::generateRandomString();
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

    /**
     * @param Request $request
     * @param User $user
     * @return User
     */
    public function parseUserRequest(Request $request, User $user)
    {
        $this->getUserForm($user)->handleRequest($request);
        return $user;
    }

    /**
     * @param User $user
     * @param null $edit
     * @return \Symfony\Component\Form\Form
     */
    public function getUserForm(User $user, $edit = null)
    {
        $action = $edit ?
            $this->generateUrl('backend_user_update', ['id' => $user->getId()]) :
            $this->generateUrl('backend_user_create');
        return $this->createForm(
            UserType::class,
            $user,
            [
                'action' => $action,
            ]
        );
    }

    /**
     * @param User $user
     * @return Form
     */
    public function getDeleteForm(User $user)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl("pilotoDelete", ['id' => $user->getId()]))
            ->setMethod("DELETE")
            ->getForm();
    }

    /**
     * @param User $user
     * @return Form
     */
    public function getResetForm(User $user)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl("pilotoResetPassword", ['id' => $user->getId()]))
            ->setMethod("POST")
            ->getForm();
    }

    /**
     * @param User $user
     */
    public function persistUser(User $user)
    {
        $em = $this->getDoctrine()->getManager();
        $user->getUserData()->setUser($user);
        $em->persist($user);
        $em->flush();
    }

}
