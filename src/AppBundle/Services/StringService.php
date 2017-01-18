<?php
/**
 * Created by PhpStorm.
 * User: sebastian
 * Date: 18/01/17
 * Time: 10:08
 */

namespace AppBundle\Services;


use AppBundle\Entity\User;

class StringService
{
    public static function generateRandomString($length = 10)
    {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }

    public static function generateUsername(User $user)
    {
        return substr($user->getUserData()->getName(), 0, 1)
            . explode(" ", $user->getUserData()->getLastName())[0];
    }
}