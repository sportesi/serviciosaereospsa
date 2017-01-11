<?php
/**
 * Created by PhpStorm.
 * User: sebastian
 * Date: 11/01/17
 * Time: 14:45
 */

namespace AppBundle\EventListener;

use AppBundle\Services\LogService;
use Symfony\Component\HttpKernel\Event\GetResponseEvent;

class RequestListener
{
    /**
     * @var LogService
     */
    private $logService;

    /**
     * RequestListener constructor.
     * @param LogService $logService
     */
    public function __construct(LogService $logService)
    {
        $this->logService = $logService;
    }

    /**
     * @param GetResponseEvent $event
     */
    public function onKernelRequest(GetResponseEvent $event)
    {
        $this->logService->save($event->getRequest());
    }
}