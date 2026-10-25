<?php

namespace App\Form;

use App\Entity\Productos;
use App\Entity\Ventas;
use App\Entity\VentasDetalle;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class VentasDetalleType extends AbstractType
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
            ->add('venta', EntityType::class, [
                'class' => Ventas::class,
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
            'data_class' => VentasDetalle::class,
        ]);
    }
}
