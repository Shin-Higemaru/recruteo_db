<?php


namespace App\Kernel;


class DB
{

    private $pdo;

    public function __construct()
    {
        try{
            $dsn = "mysql:host=localhost;dbname=recruteo_db";
            $options = [\PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'];
            $this->pdo = new \PDO($dsn,"root","",$options);
            $this->pdo->setAttribute(\PDO::ATTR_ERRMODE,\PDO::ERRMODE_EXCEPTION);
        }
        catch (\PDOException $e) {
            echo "Problème de connexion à la DB".$e->getMessage();
        }
    }

    // Récupéré la connection à la DB
    public function getPdo() {
        return $this->pdo;
    }

}