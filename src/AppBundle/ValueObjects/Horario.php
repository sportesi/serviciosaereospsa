<?php
/**
 * Created by PhpStorm.
 * User: sebastian
 * Date: 14/01/17
 * Time: 19:30
 */

namespace AppBundle\ValueObjects;


class Horario
{

    public static function getHorarios()
    {
        return [
            '0800',
            '0900',
            '1000',
            '1100',
            '1200',
            '1300',
            '1400',
            '1500',
            '1600',
            '1700',
            '1800',
            '1900',
            '2000',
            '2100',
        ];
    }
}