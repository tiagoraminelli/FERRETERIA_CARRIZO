<?php

namespace App\Form;

use App\Entity\Productos;
use App\Entity\Categoria;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ProductosType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('nombre', TextType::class, [
                'label' => 'Nombre',
            ])
            ->add('descripcion', TextareaType::class, [
                'label' => 'Descripción',
                'required' => false,
            ])

            ->add('precio_costo', NumberType::class, [
                'label' => 'Precio Costo',
                'required' => false,
                'attr' => [
                    'step' => '0.01',
                    'placeholder' => '0.00',
                ],
            ])


            ->add('precio', NumberType::class, [
                'label' => 'Precio',
            ])
            ->add('stock', NumberType::class, [
                'label' => 'Stock',
            ])
            ->add('categoria', EntityType::class, [
                'class' => Categoria::class,
                'choice_label' => 'nombre',
                'label' => 'Categoría',
                'placeholder' => 'Seleccione una categoría',
            ])
            ->add('imagen', FileType::class, [
                'label' => 'Imagen',
                'required' => false,
                'mapped' => false,
                'attr' => ['accept' => 'image/*', 'class' => 'form-control']
            ])
            ->add('eliminar_imagen', CheckboxType::class, [
                'label' => 'Eliminar imagen actual',
                'required' => false,
                'mapped' => false,
                'attr' => ['class' => 'form-check-input rounded-0']
            ])
            ->add('activo', CheckboxType::class, [
                'label' => 'Activo',
                'required' => false,
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Productos::class,
        ]);
    }
}
