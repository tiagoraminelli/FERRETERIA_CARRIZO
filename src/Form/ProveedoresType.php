<?php

namespace App\Form;

use App\Entity\Proveedores;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ProveedoresType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('nombre', TextType::class, [
                'label' => 'Nombre',
                'attr' => ['placeholder' => 'Nombre del proveedor']
            ])
            ->add('razon_social', TextType::class, [
                'label' => 'Razón Social',
                'required' => false,
                'attr' => ['placeholder' => 'Razón social']
            ])
            ->add('cuit', TextType::class, [
                'label' => 'CUIT',
                'required' => false,
                'attr' => ['placeholder' => 'XX-XXXXXXXX-X']
            ])
            ->add('telefono', TextType::class, [
                'label' => 'Teléfono',
                'required' => false,
                'attr' => ['placeholder' => '+54 XXX XXX-XXXX']
            ])
            ->add('email', EmailType::class, [
                'label' => 'Email',
                'required' => false,
                'attr' => ['placeholder' => 'proveedor@email.com']
            ])
            ->add('direccion', TextareaType::class, [
                'label' => 'Dirección',
                'required' => false,
                'attr' => ['rows' => 3, 'placeholder' => 'Calle, número, piso, etc.']
            ])
            ->add('ciudad', TextType::class, [
                'label' => 'Ciudad',
                'required' => false,
                'attr' => ['placeholder' => 'Ciudad']
            ])
            ->add('provincia', TextType::class, [
                'label' => 'Provincia',
                'required' => false,
                'attr' => ['placeholder' => 'Provincia']
            ])
            ->add('codigo_postal', TextType::class, [
                'label' => 'Código Postal',
                'required' => false,
                'attr' => ['placeholder' => 'XXXX']
            ])
            ->add('contacto', TextType::class, [
                'label' => 'Persona de Contacto',
                'required' => false,
                'attr' => ['placeholder' => 'Nombre del contacto']
            ])
            ->add('notas', TextareaType::class, [
                'label' => 'Notas',
                'required' => false,
                'attr' => ['rows' => 3, 'placeholder' => 'Información adicional']
            ])
            ->add('activo', CheckboxType::class, [
                'label' => 'Activo',
                'required' => false,
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Proveedores::class,
        ]);
    }
}
