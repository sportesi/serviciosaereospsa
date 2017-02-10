<?php

namespace AppBundle\Form;

use AppBundle\Entity\User;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\CollectionType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class UserType extends AbstractType
{
    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $permissions = array(
            'Administrador' => 'ROLE_ADMIN',
            'Piloto' => 'ROLE_PILOT',
            'Alumno' => 'ROLE_ALUMN',
            'Instructor' => 'ROLE_INSTR',
        );
        $builder
            ->add('email')
            ->add('userData', UserDataType::class)
            ->add('enabled', null, [
                'label' => 'Activo (Si el usuario no esta activo, no podra iniciar sesión)'
            ])
            ->add('roles', ChoiceType::class, [
                'choices' => $permissions,
                'multiple' => true,
                'expanded' => true,
            ])
        ;
    }

    /**
     * @param OptionsResolver $resolver
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => User::class
        ));
    }
}
