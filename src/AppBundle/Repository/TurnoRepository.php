<?php

namespace AppBundle\Repository;

use AppBundle\Entity\User;
use Doctrine\Common\Collections\ArrayCollection;
use Symfony\Component\HttpFoundation\Request;

/**
 * TurnoRepository
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class TurnoRepository extends \Doctrine\ORM\EntityRepository
{
    /**
     * @param User $user
     * @param Request $request
     * @return array
     */
    public function findByRole(User $user, Request $request)
    {
        $qb = $this->_em->createQueryBuilder();
        $qb->select(['t'])
            ->from('AppBundle:Turno', 't')
            ->innerJoin('t.avion', 'a')
            ->where('t.fecha BETWEEN :start AND :end')
            ->setParameter('start', $request->query->get('start'))
            ->setParameter('end', $request->query->get('end'));

        return $qb->getQuery()->getResult();
    }
}
