<?php
/**
 * Created by PhpStorm.
 * User: sebastian
 * Date: 11/01/17
 * Time: 14:45
 */

namespace AppBundle\EventListener;

use AppBundle\Entity\Log;
use AppBundle\Services\LogService;
use Symfony\Component\HttpKernel\Event\GetResponseEvent;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorage;

class RequestListener
{
    /**
     * @var LogService
     */
    private $logService;
    /**
     * @var TokenStorage
     */
    private $tokenStorage;

    /**
     * RequestListener constructor.
     * @param LogService $logService
     * @param TokenStorage $tokenStorage
     */
    public function __construct(LogService $logService, TokenStorage $tokenStorage)
    {
        $this->logService = $logService;
        $this->tokenStorage = $tokenStorage;
    }

    /**
     * @param GetResponseEvent $event
     */
    public function onKernelRequest(GetResponseEvent $event)
    {
        $request = $event->getRequest();

        $log = new Log(
            $request->getRequestUri(),
            $request->getClientIp(),
            $request->get('_route'),
            $request->get('_controller'),
            $request->getMethod(),
            $this->tokenStorage->getToken()->getUsername()
        );
        $this->logService->save($log);
    }
}