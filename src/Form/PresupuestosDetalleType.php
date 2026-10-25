<?php

namespace App\Form;

use App\Entity\Presupuestos;
use App\Entity\PresupuestosDetalle;
use App\Entity\Productos;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class PresupuestosDetalleType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('cantidad')
            ->add('precio_unitario')
            ->add('subtotal')
            ->add('created_at', null, [
                'widget' => 'single_text',
            ])
            ->add('updated_at', null, [
                'widget' => 'single_text',
            ])
            ->add('presupuesto', EntityType::class, [
                'class' => Presupuestos::class,
                'choice_label' => 'id',
            ])
            ->add('producto', EntityType::class, [
                'class' => Productos::class,
                'choice_label' => 'id',
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => PresupuestosDetalle::class,
        ]);
    }
}
