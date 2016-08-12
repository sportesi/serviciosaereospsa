<?php

namespace AppBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\TimeType;
use Symfony\Component\Form\Extension\Core\Type\DateType;

class AvionType extends AbstractType
{
    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('matricula')
            ->add('razonFueraServicio', null, array('required' => false))
            ->add('desdeFueraServicio', TimeType::class, array('widget' => 'single_text','required' => false))
            ->add('hastaFueraServicio', TimeType::class, array('widget' => 'single_text','required' => false))
            ->add('fechaFueraServicio', DateType::class, array('widget' => 'single_text','required' => false))
            ->add('tipoFueraServicio', ChoiceType::class, array(
                'choices'  => array(
                        'Fuera de Servicio' => 'Fuera de Servicio',
                        'Mantenimiento' => 'Mantenimiento',
                        'Examen' => 'Examen',
                    ),
                'required' => false
                ))
            ->add('servicio', CheckboxType::class, array('required' => false))
        ;
    }
    
    /**
     * @param OptionsResolver $resolver
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\Avion'
        ));
    }
}
