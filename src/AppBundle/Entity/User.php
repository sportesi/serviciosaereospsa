<?php

namespace AppBundle\Entity;

use FOS\UserBundle\Model\User as BaseUser;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Symfony\Component\Serializer\Annotation\MaxDepth;

/**
 * @ORM\Entity
 * @ORM\Table(name="user")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\UserRepository")
 * @UniqueEntity("email", message="Ya existe un usuario con este email:")
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
     * @ORM\OneToOne(targetEntity="UserData", mappedBy="user", fetch="EAGER", cascade={"persist", "remove"})
     * @var UserData
     */
    private $userData;

    /**
     * @ORM\OneToMany(targetEntity="Turno", mappedBy="user")
     * @var Turno
     * @MaxDepth(1)
     */
    private $turno;

    /**
     * @ORM\OneToMany(targetEntity="Log", mappedBy="user", fetch="EAGER")
     * @var Log
     * @MaxDepth(1)
     */
    private $log;

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

    public function getFullName()
    {
        return $this->getUserData()->getName() . " " . $this->getUserData()->getLastName();
    }

    /**
     * @return Turno
     */
    public function getLog()
    {
        return $this->log;
    }

    /**
     * Add log
     *
     * @param \AppBundle\Entity\Log $log
     *
     * @return User
     */
    public function addLog(\AppBundle\Entity\Log $log)
    {
        $this->log[] = $log;

        return $this;
    }

    /**
     * Remove log
     *
     * @param \AppBundle\Entity\Log $log
     */
    public function removeLog(\AppBundle\Entity\Log $log)
    {
        $this->log->removeElement($log);
    }
}
