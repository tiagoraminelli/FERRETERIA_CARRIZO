<?php

namespace App\Form;

use App\Entity\Clientes;
use App\Entity\Users;
use App\Entity\Ventas;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class VentasType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('cliente_nombre')
            ->add('cliente_telefono')
            ->add('cliente_dni')
            ->add('cliente_email')
            ->add('cliente_direccion')
            ->add('cliente_localidad')
            ->add('cliente_provincia')
            ->add('crear_cliente')
            ->add('fecha', null, [
                'widget' => 'single_text',
            ])
            ->add('subtotal')
            ->add('descuento')
            ->add('total')
            ->add('forma_pago')
            ->add('estado')
            ->add('notas')
            ->add('created_at', null, [
                'widget' => 'single_text',
            ])
            ->add('updated_at', null, [
                'widget' => 'single_text',
            ])
            ->add('cliente', EntityType::class, [
                'class' => Clientes::class,
                'choice_label' => 'id',
            ])
            ->add('usuario', EntityType::class, [
                'class' => Users::class,
                'choice_label' => 'id',
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Ventas::class,
        ]);
    }
}
