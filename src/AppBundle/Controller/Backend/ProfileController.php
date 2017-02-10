<?php

namespace AppBundle\Controller\Backend;

use AppBundle\Entity\User;
use AppBundle\Form\ChangePasswordType;
use AppBundle\Form\ProfileType;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Form\Exception\InvalidArgumentException;
use Symfony\Component\Form\Form;
use Symfony\Component\HttpFoundation\Request;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;

/**
 * @Route("/profile")
 */
class ProfileController extends Controller
{
    /**
     * @Route("/")
     * @Method("GET")
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function indexAction()
    {
        return $this->render('Backend/ProfileViews/index.html.twig', [
            'user' => $this->getUser(),
            'form' => $this->getUserForm($this->getUser())->createView(),
            'changePassword' => $this->getChangePasswordForm()->createView()
        ]);
    }

    /**
     * @Route("/update")
     * @Method("POST")
     * @param Request $request
     * @return \Symfony\Component\HttpFoundation\RedirectResponse
     */
    public function updateAction(Request $request)
    {
        $updateUser = $this->parseUserRequest($request, $this->getUser());
        $this->persistUser($updateUser);
        return $this->redirectToRoute('app_backend_profile_index');
    }

    /**
     * @Route("/password")
     * @Method("POST")
     * @param Request $request
     * @return \Symfony\Component\HttpFoundation\RedirectResponse
     */
    public function passwordAction(Request $request)
    {
        try {
            $user = $this->parsePasswordRequest($request, $this->getUser());
            $userManager = $this->get('fos_user.user_manager');
            $userManager->updateUser($user);
        } catch (InvalidArgumentException $exception) {
            $this->addFlash('error', $exception->getMessage());
            $this->addFlash('tab', 'change-password');
        }
        return $this->redirectToRoute('app_backend_profile_index');
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
     * @param Request $request
     * @param User $user
     * @return User
     */
    private function parsePasswordRequest(Request $request, User $user)
    {
        $form = $this->getChangePasswordForm();
        $form->handleRequest($request);
        if ($form->isValid() && $form->isSubmitted()) {
            $user->setPlainPassword($form->getData()['password']);
        } else {
            throw new InvalidArgumentException("Las contraseñas no coinciden entre ellas");
        }
        return $user;
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

    /**
     * @param User $user
     * @return Form
     */
    private function getUserForm(User $user)
    {
        $action = $this->generateUrl('app_backend_profile_update');
        return $this->createForm(
            ProfileType::class,
            $user,
            [
                'action' => $action,
            ]
        );
    }

    public function getChangePasswordForm()
    {
        $action = $this->generateUrl('app_backend_profile_password');
        return $this->createForm(ChangePasswordType::class, null, [
            'action' => $action
        ]);
    }

}
