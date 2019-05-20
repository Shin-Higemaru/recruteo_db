<?php
// Chargement du fichier autoloader généré par Composer
require 'vendor/autoload.php';

//print_r($_GET);
$uri = $_GET['uri'];
//echo $uri;
//die();

if ($uri == "main/index") {
    $controller = new \App\Http\Controllers\MainController();
    $controller->index();
}else if ($uri == "main/contact") {
    $controller = new \App\Http\Controllers\MainController();
    $controller->contact();
} else if ($uri == "developpeur/index") {
    $controller = new \App\Http\Controllers\DeveloppeurController();
    $controller->index();
} else if ($uri == "developpeur/profil") {
    $controller = new \App\Http\Controllers\DeveloppeurController();
    $controller->profil();
} else if ($uri == "developpeur/add") {
    $controller = new \App\Http\Controllers\DeveloppeurController();
    $controller->add();
} else if($uri =="developpeur/store") {
    $controller = new \App\Http\Controllers\DeveloppeurController();
    $controller->store();
}



