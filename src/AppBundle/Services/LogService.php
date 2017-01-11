<?php
/**
 * Created by PhpStorm.
 * User: sebastian
 * Date: 11/01/17
 * Time: 14:50
 */

namespace AppBundle\Services;


use Doctrine\ORM\EntityManager;
use Symfony\Component\HttpFoundation\Request;

class LogService
{
    /**
     * @var EntityManager
     */
    private $manager;

    /**
     * LogService constructor.
     * @param EntityManager $manager
     */
    public function __construct(EntityManager $manager)
    {
        $this->manager = $manager;
    }

    /**
     * @param Request $request
     */
    public function save(Request $request)
    {
        echo $request->getRequestUri();
        echo $request->getClientIp();
        echo $request->get('_route');
        echo $request->get('_controller');
        echo $request->getMethod();
    }
}