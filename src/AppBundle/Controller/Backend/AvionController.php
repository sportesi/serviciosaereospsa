<?php

namespace AppBundle\Controller\Backend;

use AppBundle\Entity\Avion;
use AppBundle\Form\AvionType;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;

/**
 * Class AvionController
 * @package BackendBundle\Controller
 * @Route("/avion")
 */
class AvionController extends Controller
{
	/**
	 * @Route("/")
	 * @Method("GET")
     * @return Response
     */
	public function indexAction()
	{
		$em = $this->getDoctrine()->getManager();
		$aviones = $em->getRepository('AppBundle:Avion')->findBy([], ['avionOrder' => 'ASC']);

		$pageData = [
            'aviones' => $aviones,
            'form' => $this->getAvionForm(new Avion())->createView(),
            'editar' => false,
        ];

	    return $this->render('Backend/AvionViews/index.html.twig', $pageData);
	}

    /**
     * @Route("/create")
     * @Method("POST")
     * @param Request $request
     * @return \Symfony\Component\HttpFoundation\RedirectResponse
     */
	public function postAction(Request $request)
	{
	    $avion = $this->parseAvionRequest($request, new Avion());
	    $this->persistAvion($avion);

	    return $this->redirect(
	        $this->generateUrl(
	            'app_backend_avion_edit',
                [
                    'id' => $avion->getId(),
                ]
            )
        );
	}

    /**
     * @Route("/edit/{id}")
     * @Method("GET")
     * @param Avion $avion
     * @return Response
     */
	public function editAction(Avion $avion)
	{
	    $em = $this->getDoctrine()->getManager();
		$aviones = $em->getRepository('AppBundle:Avion')->findAll();

		$pageData = [
            'aviones' => $aviones,
            'form' => $this->getAvionForm($avion, true)->createView(),
            'editar' => true,
        ];

		return $this->render('Backend/AvionViews/index.html.twig', $pageData);
	}

    /**
     * @Route("/update/{id}")
     * @param Request $request
     * @param Avion $avion
     * @return \Symfony\Component\HttpFoundation\RedirectResponse
     */
    public function updateAction(Request $request, Avion $avion)
    {
        $avion = $this->parseAvionRequest($request, $avion);
        $this->persistAvion($avion);
        return $this->redirectToRoute('app_backend_avion_edit', ['id' => $avion->getId()]);
	}

    /**
     * @Route("/delete/{id}")
     * @Method("DELETE")
     * @param Avion $avion
     * @return Response
     */
	public function deleteAction(Avion $avion)
	{
        $em = $this->getDoctrine()->getManager();
        $em->remove($avion);
        $em->flush();

    	return new Response('');
	}

    /**
     * @Route("/order")
     * @Method("POST")
     * @param Request $request
     * @return Response
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

    /**
     * @param Request $request
     * @param Avion $avion
     * @return Avion
     */
    private function parseAvionRequest(Request $request, Avion $avion)
    {
        $this->getAvionForm($avion)->handleRequest($request);
        return $avion;
    }

    /**
     * @param Avion $avion
     * @param null $edit
     * @return \Symfony\Component\Form\Form
     */
    private function getAvionForm(Avion $avion, $edit = null)
    {
        $formAction = $edit ?
            $this->generateUrl('app_backend_avion_update', ['id' => $avion->getId()]) :
            $this->generateUrl('app_backend_avion_post');
        return $this->createForm(
            AvionType::class,
            $avion,
            [
                'action' => $formAction,
            ]
        );
    }

    /**
     * @param Avion $avion
     */
    private function persistAvion(Avion $avion)
    {
        $em = $this->getDoctrine()->getManager();
        $em->persist($avion);
        $em->flush();
    }
}
