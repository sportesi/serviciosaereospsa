<?php

namespace BackendBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Response;

/**
 * @Route("/mailing")
 */
class MailingController extends Controller
{
	/**
	 * @Route("/alumnos")
	 */
	public function indexAction()
	{
		$em = $this->getDoctrine()->getManager();

		$repo = $em->getRepository('AppBundle:Alumno');

		$arrayAlumno = $repo->findAll();

		foreach ($arrayAlumno as $alumno) {
			$email = trim(strtolower($alumno->getEmail()));
			if ($email === "-" ) {
				continue;
			}
			try {
				$password = $this->generateRandomString();
				$user = $this->get('fos_user.user_manager')->findUserByEmail($email);
				$user->setPlainPassword($password);
				$user->setEnabled(true);
				$this->get('fos_user.user_manager')->updateUser($user);

				$message = \Swift_Message::newInstance()
				->setSubject('Bienvenido al sistema de turnos')
				->setFrom(array("appmailer@serviciosaereospsa.esy.es" => "PSA Escuela de Vuelo"))
				->setTo(array($email))
				->setBody($this->renderView(
					'Emails/welcome.html.twig', array(
						'nombre' => strtolower($alumno->getNombre()),
						'password' => $password,
						)
					), 'text/html');
				$this->get('mailer')->send($message);
			} catch (Exception $e) {
				echo $e->getMessage();
				continue;
			}
			echo $email . "<br>";
		}
		return new Response("<!DOCTYPE html> <html> <head> <title></title> </head> <body>Mailing finished</body> </html>");
	}

	/**
	 * @Route("/pilotos")
	 */
	public function indexAction()
	{
		$em = $this->getDoctrine()->getManager();

		$repo = $em->getRepository('AppBundle:Piloto');

		$arrayAlumno = $repo->findAll();

		foreach ($arrayAlumno as $alumno) {
			$email = trim(strtolower($alumno->getEmail()));
			if ($email === "-" ) {
				continue;
			}
			try {
				$password = $this->generateRandomString();
				$user = $this->get('fos_user.user_manager')->findUserByEmail($email);
				$user->setPlainPassword($password);
				$user->setEnabled(true);
				$this->get('fos_user.user_manager')->updateUser($user);

				$message = \Swift_Message::newInstance()
				->setSubject('Bienvenido al sistema de turnos')
				->setFrom(array("appmailer@serviciosaereospsa.esy.es" => "PSA Escuela de Vuelo"))
				->setTo(array($email))
				->setBody($this->renderView(
					'Emails/welcome.html.twig', array(
						'nombre' => strtolower($alumno->getNombre()),
						'password' => $password,
						)
					), 'text/html');
				$this->get('mailer')->send($message);
			} catch (Exception $e) {
				echo $e->getMessage();
				continue;
			}
			echo $email . "<br>";
		}
		return new Response("<!DOCTYPE html> <html> <head> <title></title> </head> <body>Mailing finished</body> </html>");
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
}
