<?php
/**
 * Created by PhpStorm.
 * User: sebastian
 * Date: 13/01/17
 * Time: 14:09
 */

namespace AppBundle\ValueObjects;


class LogAction
{
    private $BackendHomepage = [
        'POST' => 'Creación de turno',
        'PUT' => 'Edición de turno',
        'DELETE' => 'Borrado de turno'
    ];

    public function getAction($route, $method)
    {
        return $this->$route[$method];
    }
}