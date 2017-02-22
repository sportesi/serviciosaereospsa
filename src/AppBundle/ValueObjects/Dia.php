<?php
/**
 * Created by PhpStorm.
 * User: sebastian
 * Date: 14/01/17
 * Time: 19:34
 */

namespace AppBundle\ValueObjects;


class Dia
{
    public static function getDias()
    {
        return [
            'Lunes',
            'Martes',
            'Miércoles',
            'Jueves',
            'Viernes',
            'Sábado',
            'Domingo',
        ];
    }
}