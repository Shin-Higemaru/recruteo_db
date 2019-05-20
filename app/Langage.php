<?php


namespace App;


use App\Kernel\DB;

class Langage
{
    private $id;
    private $nom;
    private $db;

    public function __construct()
    {
        $this->db = new DB();
    }

    /**
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param mixed $id
     * @return Langage
     */
    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    /**
     * @return mixed
     */
    public function getNom()
    {
        return $this->nom;
    }

    /**
     * @param mixed $nom
     * @return Langage
     */
    public function setNom($nom)
    {
        $this->nom = $nom;
        return $this;
    }

    public function findAllLangages() {
        $sql = "SELECT * FROM langage";
        $stmt = $this->db->getPdo()->prepare($sql);
        $stmt->execute();
        $stmt->setFetchMode(\PDO::FETCH_CLASS,'App\langage');
        $resultat = $stmt->fetchAll();
        return $resultat;
    }


}