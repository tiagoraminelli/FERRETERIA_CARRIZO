<?php

namespace App\Repository;

use App\Entity\Users;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Users>
 */
class UsersRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Users::class);
    }

    public function findByName(string $name): array
    {

        // similar a: User::where('name', $name)->get(); en Laravel 13
        // Esto lo toma Doctrine y lo convierte en SQL para buscar por el campo name en la tabla users
        return $this->createQueryBuilder('u')
            ->andWhere('u.name = :name')
            ->setParameter('name', $name)
            ->getQuery()
            ->getResult()
        ;
    }

    public function findByNameQuery(string $name): array
    {
        //Llama a la base de datos con el EntityManager y ejecuta una consulta DQL (Doctrine Query Language) para buscar por el campo name en la tabla users
        $entityManager = $this->getEntityManager();
        // DQL es un lenguaje de consulta orientado a objetos que se traduce a SQL para interactuar con la base de datos
        $query = $entityManager->createQuery(
            // para hacer la consulta en SQL se referencia a la entidad Users y su alias u, no a la tabla users directamente
            'SELECT u
            FROM App\Entity\Users u
            WHERE u.name = :name'
        )->setParameter('name', $name);

        return $query->getResult();
    }

    public function findByEmail(string $email): array
    {
        return $this->createQueryBuilder('u')
            ->andWhere('u.email = :email')
            ->setParameter('email', $email)
            ->getQuery()
            ->getResult()
        ;
    }

    //    /**
    //     * @return Users[] Returns an array of Users objects
    //     */

    //    public function findByExampleField($value): array
    //    {
    //        return $this->createQueryBuilder('u')
    //            ->andWhere('u.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->orderBy('u.id', 'ASC')
    //            ->setMaxResults(10)
    //            ->getQuery()
    //            ->getResult()
    //        ;
    //    }

    //    public function findOneBySomeField($value): ?Users
    //    {
    //        return $this->createQueryBuilder('u')
    //            ->andWhere('u.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->getQuery()
    //            ->getOneOrNullResult()
    //        ;
    //    }
}
