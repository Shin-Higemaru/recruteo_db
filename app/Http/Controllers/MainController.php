<?php


namespace App\Http\Controllers;


use App\Equipe;

class MainController
{
    // Affichage de la page d'accueil
    public function index() {
        $equipe = new Equipe();
        $equipes = $equipe->findAllEquipe();
//        var_dump($equipes);
//        die();

        // Appel de la vue de la page d'accueil
        require 'resources/views/main/index.php';
    }

    // Affichage de la page de contact
    public function contact() {
//        echo "Salut c'est la méthode qui permettra d'afficher la page de contact.";
        require 'resources/views/main/contact.php';

    }



}