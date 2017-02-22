<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Log;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class BaseController extends Controller
{
    public function log($action, $section)
    {
        $request = $this->container->get('request_stack')->getCurrentRequest();

        $log = new Log(
            $action,
            $section,
            $request->getClientIp(),
            $this->getUser()
        );

        $this->get('app.log')->save($log);
    }
}
