<?php

namespace AppBundle\Controller\Backend;

use AppBundle\Entity\User;
use AppBundle\Form\UserType;
use AppBundle\Services\StringService;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Swift_Message;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Form\Form;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\ConstraintViolationList;

/**
 * @Route("/user")
 */
class UserController extends Controller
{
    /**
     * @var ConstraintViolationList
     */
    private $errors;

    /**
     * @Route("/")
     * @Method("GET")
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();
        $users = $em->getRepository('AppBundle:User')->findAll();

        return $this->render('BackendBundle:UserViews:index.html.twig', [
            'users' => $users,
            'roles' => [
                'ROLE_ADMIN' => 'Administrador',
                'ROLE_PILOT' => 'Piloto',
                'ROLE_ALUMN' => 'Alumno'
            ]
        ]);
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
            'admin' => $user->hasRole('ROLE_ADMIN'),
            'super' => $user->hasRole('ROLE_SUPER_ADMIN'),
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
     * @return \Symfony\Component\HttpFoundation\RedirectResponse|\Symfony\Component\HttpFoundation\Response
     */
    public function createAction(Request $request)
    {
        $user = $this->parseUserRequest($request, new User());
        $user->setUsername($user->getEmail());
        $user->setUsernameCanonical($user->getEmail());
        $user->setPlainPassword(StringService::generateRandomString());
        $validator = $this->get('validator');
        $this->errors = $validator->validate($user);
        if ($this->errors->count() > 0) {
            return $this->render("BackendBundle:UserViews:edit.html.twig", array(
                'form' => $this->getUserForm($user)->createView(),
                'errors' => $this->errors
            ));
        }
        $this->persistUser($user);
        return $this->redirectToRoute('backend_user_edit', ['id' => $user->getId()]);
    }

    /**
     * @Route("/delete/{id}")
     * @Method("DELETE")
     * @param User $user
     * @return \Symfony\Component\HttpFoundation\RedirectResponse
     */
    public function deleteAction(User $user)
    {
        $em = $this->getDoctrine()->getManager();
        $em->remove($user);
        $em->flush();
        return $this->redirectToRoute("backend_user_index");
    }

    /**
     * @Route("/reset/{id}", name="pilotoResetPassword")
     * @param User $user
     * @return \Symfony\Component\HttpFoundation\RedirectResponse
     */
    public function resetPasswordAction(User $user)
    {
        $em = $this->getDoctrine()->getManager();
        $password = StringService::generateRandomString();
        $user->setPlainPassword($password);

        $message = Swift_Message::newInstance()
            ->setSubject('Reinicio de Contraseña')
            ->setFrom(["appmailer@serviciosaereospsa.esy.es" => "PSA Escuela de Vuelo"])
            ->setTo([$user->getEmail()])
            ->setBody($this->renderView(
                'Emails/reset.html.twig', array(
                    'nombre' => strtolower($user->getFullName()),
                    'password' => $password,
                )
            ), 'text/html');
        $this->get('mailer')->send($message);

        $em->persist($user);
        $em->flush();

        return $this->redirectToRoute("backend_user_edit", ["id" => $user->getId()]);
    }

    /**
     * @Route("/welcome/{id}")
     * @param User $user
     * @return \Symfony\Component\HttpFoundation\RedirectResponse
     */
    public function welcomeAction(User $user)
    {
        $em = $this->getDoctrine()->getManager();
        $password = StringService::generateRandomString();
        $user->setPlainPassword($password);
        $user->setEnabled(true);
        $em->persist($user);
        $em->flush();

        $message = \Swift_Message::newInstance()
            ->setSubject('Bienvenido al sistema de turnos')
            ->setFrom(["appmailer@serviciosaereospsa.esy.es" => "PSA Escuela de Vuelo"])
            ->setTo([$user->getEmail()])
            ->setBody($this->renderView(
                'Emails/welcome.html.twig', array(
                    'nombre' => strtolower($user->getFullName()),
                    'password' => $password,
                )
            ), 'text/html');
        $this->get('mailer')->send($message);

        return $this->redirectToRoute("backend_user_edit", ["id" => $user->getId()]);
    }

    /**
     * @param Request $request
     * @param User $user
     * @return User
     */
    private function parseUserRequest(Request $request, User $user)
    {
        $this->getUserForm($user)->handleRequest($request);
        return $user;
    }

    /**
     * @param User $user
     * @param null $edit
     * @return \Symfony\Component\Form\Form
     */
    private function getUserForm(User $user, $edit = null)
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
    private function getDeleteForm(User $user)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl("backend_user_delete", ['id' => $user->getId()]))
            ->setMethod("DELETE")
            ->getForm();
    }

    /**
     * @param User $user
     * @return Form
     */
    private function getResetForm(User $user)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl("pilotoResetPassword", ['id' => $user->getId()]))
            ->setMethod("POST")
            ->getForm();
    }

    /**
     * @param User $user
     */
    private function persistUser(User $user)
    {
        $em = $this->getDoctrine()->getManager();
        $user->getUserData()->setUser($user);
        $em->persist($user);
        $em->flush();
    }

}
