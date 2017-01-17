<?php

namespace AppBundle\Entity;

use FOS\UserBundle\Model\User as BaseUser;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity
 * @ORM\Table(name="user")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\UserRepository")
 */
class User extends BaseUser
{
    /**
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    protected $id;

    /**
     * @ORM\OneToOne(targetEntity="UserData", mappedBy="user")
     * @var UserData
     */
    private $userData;

    /**
     * @ORM\OneToMany(targetEntity="Turno", mappedBy="user")
     * @var Turno
     */
    private $turno;

    public function __construct()
    {
        parent::__construct();
    }

    /**
     * @return UserData
     */
    public function getUserData()
    {
        return $this->userData;
    }

    /**
     * @param UserData $userData
     */
    public function setUserData(UserData $userData)
    {
        $this->userData = $userData;
    }


    /**
     * Add turno
     *
     * @param \AppBundle\Entity\Turno $turno
     *
     * @return User
     */
    public function addTurno(\AppBundle\Entity\Turno $turno)
    {
        $this->turno[] = $turno;

        return $this;
    }

    /**
     * Remove turno
     *
     * @param \AppBundle\Entity\Turno $turno
     */
    public function removeTurno(\AppBundle\Entity\Turno $turno)
    {
        $this->turno->removeElement($turno);
    }

    /**
     * Get turno
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getTurno()
    {
        return $this->turno;
    }
}
