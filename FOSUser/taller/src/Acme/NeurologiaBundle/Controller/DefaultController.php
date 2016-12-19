<?php

namespace Acme\NeurologiaBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function indexAction($name)
    {
        return $this->render('AcmeNeurologiaBundle:Default:index.html.twig', array('name' => $name));
    }
    
    public function index2Action()
    {
        return $this->render('AcmeNeurologiaBundle:Default:index2.html.twig');
    }
}
