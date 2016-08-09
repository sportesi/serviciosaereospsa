<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Turno
 *
 * @ORM\Table(name="turno")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\TurnoRepository")
 */
class Turno
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
     * @ORM\ManyToOne(targetEntity="Horario")
     * @ORM\JoinColumn(name="horario", referencedColumnName="id")
     */
    private $horario;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="fecha", type="datetime")
     */
    private $fecha;

    /**
     * @var bool
     *
     * @ORM\Column(name="confirmado", type="boolean", nullable=true)
     */
    private $confirmado;

    /**
     * @ORM\ManyToOne(targetEntity="Piloto")
     * @ORM\JoinColumn(name="piloto", referencedColumnName="id", nullable=true)
     */
    private $piloto;

    /**
     * @ORM\ManyToOne(targetEntity="Alumno")
     * @ORM\JoinColumn(name="alumno", referencedColumnName="id", nullable=true)
     */
    private $alumno;

    /**
     * @ORM\ManyToOne(targetEntity="Avion")
     * @ORM\JoinColumn(name="id_avion", referencedColumnName="id")
     */
    private $avion;

    /**
     * @ORM\ManyToOne(targetEntity="Dia")
     * @ORM\JoinColumn(name="dia", referencedColumnName="id")
     */
    private $dia;

    /**
     * @ORM\Column(name="updated_at", type="datetime")
     */
    private $updatedAt;


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
     * Set horario
     *
     * @param \DateTime $horario
     *
     * @return Turno
     */
    public function setHorario($horario)
    {
        $this->horario = $horario;

        return $this;
    }

    /**
     * Get horario
     *
     * @return \DateTime
     */
    public function getHorario()
    {
        return $this->horario;
    }

    /**
     * Set fecha
     *
     * @param \DateTime $fecha
     *
     * @return Turno
     */
    public function setFecha($fecha)
    {
        $this->fecha = $fecha;

        return $this;
    }

    /**
     * Get fecha
     *
     * @return \DateTime
     */
    public function getFecha()
    {
        return $this->fecha;
    }

    /**
     * Set confirmado
     *
     * @param boolean $confirmado
     *
     * @return Turno
     */
    public function setConfirmado($confirmado)
    {
        $this->confirmado = $confirmado;

        return $this;
    }

    /**
     * Get confirmado
     *
     * @return bool
     */
    public function getConfirmado()
    {
        return $this->confirmado;
    }

    /**
     * Set user
     *
     * @param \AppBundle\Entity\User $user
     *
     * @return Turno
     */
    public function setUser(\AppBundle\Entity\User $user = null)
    {
        $this->user = $user;

        return $this;
    }

    /**
     * Get user
     *
     * @return \AppBundle\Entity\User
     */
    public function getUser()
    {
        return $this->user;
    }

    /**
     * Set avion
     *
     * @param \AppBundle\Entity\Avion $avion
     *
     * @return Turno
     */
    public function setAvion(\AppBundle\Entity\Avion $avion = null)
    {
        $this->avion = $avion;

        return $this;
    }

    /**
     * Get avion
     *
     * @return \AppBundle\Entity\Avion
     */
    public function getAvion()
    {
        return $this->avion;
    }

    /**
     * Set dia
     *
     * @param \AppBundle\Entity\Dia $dia
     *
     * @return Turno
     */
    public function setDia(\AppBundle\Entity\Dia $dia = null)
    {
        $this->dia = $dia;

        return $this;
    }

    /**
     * Get dia
     *
     * @return \AppBundle\Entity\Dia
     */
    public function getDia()
    {
        return $this->dia;
    }

    /**
     * Set piloto
     *
     * @param \AppBundle\Entity\Piloto $piloto
     *
     * @return Turno
     */
    public function setPiloto(\AppBundle\Entity\Piloto $piloto = null)
    {
        $this->piloto = $piloto;

        return $this;
    }

    /**
     * Get piloto
     *
     * @return \AppBundle\Entity\Piloto
     */
    public function getPiloto()
    {
        return $this->piloto;
    }

    /**
     * Set alumno
     *
     * @param \AppBundle\Entity\Alumno $alumno
     *
     * @return Turno
     */
    public function setAlumno(\AppBundle\Entity\Alumno $alumno = null)
    {
        $this->alumno = $alumno;

        return $this;
    }

    /**
     * Get alumno
     *
     * @return \AppBundle\Entity\Alumno
     */
    public function getAlumno()
    {
        return $this->alumno;
    }

    /**
     * Set updatedAt
     *
     * @param \DateTime $updatedAt
     *
     * @return Turno
     */
    public function setUpdatedAt($updatedAt)
    {
        $this->updatedAt = $updatedAt;

        return $this;
    }

    /**
     * Get updatedAt
     *
     * @return \DateTime
     */
    public function getUpdatedAt()
    {
        return $this->updatedAt;
    }
}
