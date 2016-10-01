<?php

namespace BackendBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use AppBundle\Entity\Avion;
use AppBundle\Form\AvionType;

class AvionController extends Controller
{
	/**
	 * @Route("/avion/listado", name="BackendAvionHomepage")
	 * @Method("GET")
	 */
	public function indexAction()
	{
		$em = $this->getDoctrine()->getManager();
		$aviones = $em->getRepository('AppBundle:Avion')->findBy(array(), array('avionOrder' => 'ASC'));
		$avion = new Avion();
		
		$form = $this->createForm(AvionType::class, $avion, array('action' => $this->generateUrl('BackendAvionPost')));

		$pageData = array(
			'aviones' => $aviones, 
			'form' => $form->createView(),
			'editar' => false,
		);

	    return $this->render('BackendBundle:AvionViews:index.html.twig', $pageData);
	}

	/**
	 * @Route("/avion/post/{id}", defaults={"id" = 0}, name="BackendAvionPost")
	 * @Method("POST")
	 */
	public function postAction(Request $request, $id)
	{
	    $em = $this->getDoctrine()->getManager();
		if ($id) {
			$avion = $em->getRepository('AppBundle:Avion')->find($id);
		} else {
			$avion = new Avion();
		}
		
		$form = $this->createForm(AvionType::class, $avion, array('action' => $this->generateUrl('BackendAvionPost', array('id' => $id))));

		$form->handleRequest($request);

		if ($form->isValid()) {
			if (!$id) {
				$em->persist($avion);
			}
			$em->flush();
		}
		
		$aviones = $em->getRepository('AppBundle:Avion')->findAll();

		$pageData = array(
			'aviones' => $aviones, 
			'form' => $form->createView(),
			'editar' => false,
		);

	    // return $this->render('BackendBundle:AvionViews:index.html.twig', $pageData);
	    return $this->redirect($this->generateUrl('BackendAvionEdit', array('id' => $id)));
	}

	/**
	 * @Route("/avion/edit/{id}", name="BackendAvionEdit")
	 * @Method("GET")
	 */
	public function editAction($id)
	{
	    $em = $this->getDoctrine()->getManager();
		$aviones = $em->getRepository('AppBundle:Avion')->findAll();
		$avion = $em->getRepository('AppBundle:Avion')->find($id);
		
		$form = $this->createForm(AvionType::class, $avion, array('action' => $this->generateUrl('BackendAvionPost', array('id' => $id))));

		$pageData = array(
			'aviones' => $aviones, 
			'form' => $form->createView(),
			'editar' => true,
			'avionId' => $id,
		);

		return $this->render('BackendBundle:AvionViews:index.html.twig', $pageData);
	}

	/**
	 * @Route("/avion/delete/{id}", name="BackendAvionDelete")
	 * @Method("GET")
	 */
	public function deleteAction($id)
	{
	    $em = $this->getDoctrine()->getManager();
	    $avion = $em->getRepository('AppBundle:Avion')->find($id);

	    if (is_object($avion)) {
	    	$em->remove($avion);
	    	$em->flush();
	    }

    	return $this->redirectToRoute('BackendAvionHomepage');
	}

	/**
	 * @Route("/avion/order/set", name="BackendAvionOrderSet")
	 * @Method("POST")
	 */
	public function setOrderAction(Request $request)
	{
		$avionOrder = $request->request->get('order');
	    $em = $this->getDoctrine()->getManager();
	    $qb = $em->createQueryBuilder();
	    $qb->select('a')
	    ->from('AppBundle:Avion', 'a')
	    ->where($qb->expr()->in('a.id', $avionOrder));

	    $aviones = $qb->getQuery()->getResult();

	    foreach ($aviones as $avion) {
	    	$avion->setAvionOrder(array_search($avion->getId(), $avionOrder));
	    }

	    $em->flush();

	    return new Response();
	}


}
