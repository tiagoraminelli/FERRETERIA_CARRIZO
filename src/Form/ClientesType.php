<?php

namespace App\Form;

use App\Entity\Clientes;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ClientesType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('nombre', TextType::class, [
                'label' => 'Nombre / Razón Social',
                'attr' => ['placeholder' => 'Nombre completo o razón social']
            ])
            ->add('dni_cuit', TextType::class, [
                'label' => 'DNI / CUIT',
                'required' => false,
                'attr' => ['placeholder' => 'DNI o CUIT']
            ])
            ->add('telefono', TextType::class, [
                'label' => 'Teléfono',
                'required' => false,
                'attr' => ['placeholder' => 'Teléfono de contacto']
            ])
            ->add('email', EmailType::class, [
                'label' => 'Email',
                'required' => false,
                'attr' => ['placeholder' => 'Email de contacto']
            ])
            ->add('direccion', TextareaType::class, [
                'label' => 'Dirección',
                'required' => false,
                'attr' => ['rows' => 3, 'placeholder' => 'Calle, número, piso, etc.']
            ])
            ->add('localidad', TextType::class, [
                'label' => 'Localidad',
                'required' => false,
                'attr' => ['placeholder' => 'Ciudad o localidad']
            ])
            ->add('provincia', TextType::class, [
                'label' => 'Provincia',
                'required' => false,
                'attr' => ['placeholder' => 'Provincia']
            ])
            ->add('codigo_postal', TextType::class, [
                'label' => 'Código Postal',
                'required' => false,
                'attr' => ['placeholder' => 'Código postal']
            ])
            ->add('condicion_iva', ChoiceType::class, [
                'label' => 'Condición frente al IVA',
                'choices' => [
                    'Consumidor Final' => 'Consumidor Final',
                    'Responsable Inscripto' => 'Responsable Inscripto',
                    'Monotributista' => 'Monotributista',
                    'Exento' => 'Exento',
                ],
                'attr' => ['class' => 'form-select rounded-0']
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Clientes::class,
        ]);
    }
}
