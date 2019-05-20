<?php


namespace App\Http\Controllers;


use App\Developpeur;
use App\Kernel\ToolBox;
use App\Langage;

class DeveloppeurController
{
    // Page pour lister les développeurs d'une équipe
    public function index(){
        // Récupérer les dev de l'équipe
         // 1 -> On récupère l'id de l'équipe dans l'url via $_GET
        $id_equipe = isset($_GET['id']) ? $_GET['id'] : null ;
        $nom_equipe = isset($_GET['nom']) ? $_GET['nom'] : null ;
        if (!empty($id_equipe) && !empty($nom_equipe)) {
            $developpeur = new Developpeur();
            $developpeurs = $developpeur->findDeveloppeurEquipe($id_equipe);

//            var_dump($developpeur).
//            die();
            require 'resources/views/developpeur/index.php';
        }
    }

    // Afficher un profil de dev en particulier
    public function profil() {
        // Récupérer l'id du développeur
        $id_developpeur = isset($_GET['id']) ? $_GET['id'] : null ;
        $dev = new Developpeur();
        $developpeur = $dev->findOneDeveloppeur($id_developpeur);

//        var_dump($developpeur);
////        die();

        // Require de la vue page profile
        require 'resources/views/developpeur/profile.php';
    }

    // Ajouter un développeur
    public function add(){
        $langage = new Langage();
        $langages = $langage->findAllLangages();

        // Require de la vue pour afficher un formulaire
        require 'resources/views/developpeur/add.php';
    }

    // Créer un dev dans la table developpeur et associer ses langages connus dans la table de liaison langage_developpeur
    public function store() {
        // Vérifier qu eles champs du form sont remplis
        print_r($_POST);
        $datas_clean = ToolBox::extractDatasForm($_POST,['nom','bio','langages']);
        if (in_array(null,$datas_clean)) {
            session_start();
            $_SESSION['messages'] = ['Tous les champs sont obligatoires'];
            header('Location: index.php?uri=developpeur/add');
            exit();
        } else {
            //Créer un objet dev
            $developpeur = new Developpeur();
            // "hydrater" l'objet
            $developpeur->setNom($datas_clean['nom']);
            $developpeur->setBio($datas_clean['bio']);
            $developpeur->setCreatedAt(new \DateTime());
            // l'insérer dans la db
            $developpeur->addDeveloppeur();
            $developpeur->addLangages($datas_clean['langages']);
            header('Location: ?uri=developpeur/profil&id='.$developpeur->getId());
            exit();
        }

        // Puis insérer dans les tables
    }

}