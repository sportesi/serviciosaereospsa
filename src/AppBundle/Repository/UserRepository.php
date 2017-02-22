<?php

namespace AppBundle\Repository;

use AppBundle\Entity\User;
use Doctrine\ORM\EntityRepository;

/**
 * UserRepository
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class UserRepository extends EntityRepository
{
    public function findByRole($role)
    {
        $qb = $this->_em->createQueryBuilder();

        $qb->select(['u', 'd'])
            ->from('AppBundle:User', 'u')
            ->innerJoin('u.userData', 'd')
            ->where('u.roles like :role')
            ->setParameter('role', '%' . $role . '%');

        return $qb->getQuery()->getResult();
    }

    public function findAllByUserRole(User $user)
    {
        $qb = $this->_em->createQueryBuilder();
        $qb->select(['u', 'd'])
            ->from('AppBundle:User', 'u')
            ->innerJoin('u.userData', 'd');

        if (!$user->hasRole('ROLE_ADMIN')) {
            $qb->andWhere('u.roles not like :role');
            $qb->setParameter('role', '%ADMIN%');
        }

        return $qb->getQuery()->getResult();
    }

    /**
     * @param User $user
     * @return array
     */
    public function findAllUsers(User $user)
    {
        $qb = $this->_em->createQueryBuilder();
        $qb->select(['u', 'd', 'l'])
            ->from('AppBundle:User', 'u')
            ->innerJoin('u.userData', 'd')
            ->leftJoin('u.log', 'l')
            ->where('u.roles not like :role');

        if (!$user->hasRole('ROLE_ADMIN') && !$user->hasRole('ROLE_INSTR')) {
            $qb->andWhere($qb->expr()->eq('u.id', ':id'));
            $qb->setParameter('id', $user->getId());
        }

        $qb->setParameter('role', '%ADMIN%');

        return $qb->getQuery()->getResult();
    }
}
