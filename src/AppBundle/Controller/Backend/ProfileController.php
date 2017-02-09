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
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Security;

/**
 * @Route("/profile")
 * @Security("has_role('ROLE_ADMIN')")
 */
class ProfileController extends Controller
{
    /**
     * @var ConstraintViolationList
     */
    private $errors;

    /**
     * @Route("/")
     * @Method("GET")
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function indexAction()
    {
        return $this->render('Backend/ProfileViews/index.html.twig', [
            'user' => $this->getUser()
        ]);
    }

    /**
     * @Route("/reset/{id}")
     * @param User $user
     * @return \Symfony\Component\HttpFoundation\RedirectResponse
     */
    public function resetAction(User $user)
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

        return $this->redirectToRoute("app_backend_user_edit", ["id" => $user->getId()]);
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
            $this->generateUrl('app_backend_user_update', ['id' => $user->getId()]) :
            $this->generateUrl('app_backend_user_create');
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
            ->setAction($this->generateUrl("app_backend_user_delete", ['id' => $user->getId()]))
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
            ->setAction($this->generateUrl("app_backend_user_reset", ['id' => $user->getId()]))
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
