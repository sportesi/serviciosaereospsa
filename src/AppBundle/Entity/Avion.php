<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Avion
 *
 * @ORM\Table(name="avion")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\AvionRepository")
 */
class Avion
{
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="matricula", type="string", length=255, unique=true)
     */
    private $matricula;

    /**
     * @var bool
     *
     * @ORM\Column(name="servicio", type="boolean", nullable=true)
     */
    private $servicio;

    /**
     * @ORM\Column(name="razon_fuera_servicio", type="string", length=255, nullable=true)
     */
    private $razonFueraServicio;


    /**
     * Get id
     *
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set matricula
     *
     * @param string $matricula
     *
     * @return Avion
     */
    public function setMatricula($matricula)
    {
        $this->matricula = $matricula;

        return $this;
    }

    /**
     * Get matricula
     *
     * @return string
     */
    public function getMatricula()
    {
        return $this->matricula;
    }

    /**
     * Set servicio
     *
     * @param boolean $servicio
     *
     * @return Avion
     */
    public function setServicio($servicio)
    {
        $this->servicio = $servicio;

        return $this;
    }

    /**
     * Get servicio
     *
     * @return bool
     */
    public function getServicio()
    {
        return $this->servicio;
    }

    /**
     * Set razonFueraServicio
     *
     * @param string $razonFueraServicio
     *
     * @return Avion
     */
    public function setRazonFueraServicio($razonFueraServicio)
    {
        $this->razonFueraServicio = $razonFueraServicio;

        return $this;
    }

    /**
     * Get razonFueraServicio
     *
     * @return string
     */
    public function getRazonFueraServicio()
    {
        return $this->razonFueraServicio;
    }
}
