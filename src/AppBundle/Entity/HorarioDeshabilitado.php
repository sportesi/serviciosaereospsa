<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * HorarioDeshabilitado
 *
 * @ORM\Table(name="horario_deshabilitado")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\HorarioDeshabilitadoRepository")
 */
class HorarioDeshabilitado
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
     * @var \DateTime
     *
     * @ORM\Column(name="horario", type="time")
     */
    private $horario;

    /**
     * @ORM\ManyToOne(targetEntity="Dia")
     * @ORM\JoinColumn(name="id_dia", referencedColumnName="id")
     */
    private $dia;


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
     * @return HorarioDeshabilitado
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
     * Set dia
     *
     * @param \AppBundle\Entity\Dia $dia
     *
     * @return HorarioDeshabilitado
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
}
