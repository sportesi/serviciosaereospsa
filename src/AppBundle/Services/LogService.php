<?php
/**
 * Created by PhpStorm.
 * User: sebastian
 * Date: 11/01/17
 * Time: 14:50
 */

namespace AppBundle\Services;


use AppBundle\Entity\Log;
use AppBundle\ValueObjects\LogAction;
use Doctrine\ORM\EntityManager;

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
     * @param Log $log
     */
    public function save(Log $log)
    {
        if ($log->getUser() == "anon." || $log->getMethod() == "GET")
        {
            return;
        }
        $this->manager->persist($log);
        $this->manager->flush();
    }

    /**
     * @param $logAction
     * @param $method
     * @return mixed
     */
    public function getLogAction($route, $method)
    {
        $logAction = new LogAction();
        return $logAction->getAction($route, $method);
    }
}