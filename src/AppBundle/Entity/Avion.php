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
     * @ORM\Column(name="tipo_fuera_servicio", type="string", length=255, nullable=true)
     */
    private $tipoFueraServicio;

    /**
     * @ORM\Column(name="razon_fuera_servicio", type="string", length=255, nullable=true)
     */
    private $razonFueraServicio;

    /**
     * @ORM\Column(name="desde_fuera_servicio", type="time", nullable=true)
     */
    private $desdeFueraServicio;

    /**
     * @ORM\Column(name="hasta_fuera_servicio", type="time", nullable=true)
     */
    private $hastaFueraServicio;

    /**
     * @ORM\Column(name="fecha_fuera_servicio", type="date", nullable=true)
     */
    private $fechaFueraServicio;

    /**
     * @ORM\Column(name="avion_order", type="integer", nullable=true)
     */
    private $avionOrder;


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

    /**
     * Set tipoFueraServicio
     *
     * @param string $tipoFueraServicio
     *
     * @return Avion
     */
    public function setTipoFueraServicio($tipoFueraServicio)
    {
        $this->tipoFueraServicio = $tipoFueraServicio;

        return $this;
    }

    /**
     * Get tipoFueraServicio
     *
     * @return string
     */
    public function getTipoFueraServicio()
    {
        return $this->tipoFueraServicio;
    }

    /**
     * Set desdeFueraServicio
     *
     * @param \DateTime $desdeFueraServicio
     *
     * @return Avion
     */
    public function setDesdeFueraServicio($desdeFueraServicio)
    {
        $this->desdeFueraServicio = $desdeFueraServicio;

        return $this;
    }

    /**
     * Get desdeFueraServicio
     *
     * @return \DateTime
     */
    public function getDesdeFueraServicio()
    {
        return $this->desdeFueraServicio;
    }

    /**
     * Set hastaFueraServicio
     *
     * @param \DateTime $hastaFueraServicio
     *
     * @return Avion
     */
    public function setHastaFueraServicio($hastaFueraServicio)
    {
        $this->hastaFueraServicio = $hastaFueraServicio;

        return $this;
    }

    /**
     * Get hastaFueraServicio
     *
     * @return \DateTime
     */
    public function getHastaFueraServicio()
    {
        return $this->hastaFueraServicio;
    }

    /**
     * Set fechaFueraServicio
     *
     * @param \DateTime $fechaFueraServicio
     *
     * @return Avion
     */
    public function setFechaFueraServicio($fechaFueraServicio)
    {
        $this->fechaFueraServicio = $fechaFueraServicio;

        return $this;
    }

    /**
     * Get fechaFueraServicio
     *
     * @return \DateTime
     */
    public function getFechaFueraServicio()
    {
        return $this->fechaFueraServicio;
    }

    /**
     * Set avionOrder
     *
     * @param integer $avionOrder
     *
     * @return Avion
     */
    public function setAvionOrder($avionOrder)
    {
        $this->avionOrder = $avionOrder;

        return $this;
    }

    /**
     * Get avionOrder
     *
     * @return integer
     */
    public function getAvionOrder()
    {
        return $this->avionOrder;
    }
}
