<?php

namespace App\Form;

use App\Entity\Presupuestos;
use App\Entity\Users;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class PresupuestosType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('cliente_nombre', TextType::class, [
                'label' => 'Cliente',
                'attr' => ['placeholder' => 'Nombre del cliente']
            ])
            ->add('cliente_telefono', TextType::class, [
                'label' => 'Teléfono',
                'required' => false,
                'attr' => ['placeholder' => 'Teléfono de contacto']
            ])
            ->add('estado', ChoiceType::class, [
                'label' => 'Estado',
                'choices' => [
                    'Borrador' => 'borrador',
                    'Enviado' => 'enviado',
                    'Aprobado' => 'aprobado',
                    'Rechazado' => 'rechazado',
                ],
                'attr' => ['class' => 'form-select']
            ])
            ->add('usuario', EntityType::class, [
                'class' => Users::class,
                'choice_label' => 'name',
                'label' => 'Usuario',
                'attr' => ['class' => 'form-select form-select-lg rounded-0 border-secondary shadow-none']
            ])
            ->add('notas', TextareaType::class, [
                'label' => 'Notas',
                'required' => false,
                'attr' => ['rows' => 4, 'placeholder' => 'Observaciones del presupuesto']
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Presupuestos::class,
        ]);
    }
}
