<?php


namespace App;


use App\Kernel\DB;

class Developpeur
{
    private $id;
    private $nom;
    private $bio;
    private $created_at;


    private $db;

    public function __construct()
    {
        $this->db = new DB();
    }



    // Raccourcis pour nos getters setters: cliquer sur code en haut de cette fenêtre ensuite sur generate puis getters setters et ca nous autocomplète tout les getters setters qu'il y a en dessous
    /**
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param mixed $id
     * @return Developpeur
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
     * @return Developpeur
     */
    public function setNom($nom)
    {
        $this->nom = strtoupper($nom);
        return $this;
    }

    /**
     * @return mixed
     */
    public function getBio()
    {
        return $this->bio;
    }

    /**
     * @param mixed $bio
     * @return Developpeur
     */
    public function setBio($bio)
    {
        $this->bio = $bio;
        return $this;
    }

    /**
     * @return mixed
     */
    public function getCreatedAt()
    {
        return $this->created_at;
    }

    /**
     * @param mixed $created_at
     * @return Developpeur
     */
    public function setCreatedAt(\DateTime $created_at)
    {
        $this->created_at = $created_at->format('Y-m-d H:i:s');
        return $this;
    }






    // Récupérer dans la DB les dev appartenant à une équipe
    public function findDeveloppeurEquipe($id_equipe) {
        $sql = "SELECT d.* FROM developpeur d ";
        $sql.="LEFT JOIN equipe_developpeur ed ON d.id=ed.id_developpeur ";
        $sql.="LEFT JOIN equipe e ON e.id=ed.id_equipe ";
        $sql.= "WHERE e.id=:id";

        // Préparer la requête avec PDO
        $stmt = $this->db->getPdo()->prepare($sql);
        // Sécuriser les paramètres variables;
        $stmt->bindParam(':id',$id_equipe,\PDO::PARAM_INT);
        $stmt->execute();
        // Déclaration du mode de résultat > les lignes de la table sont converties en objet de type App\Developpeur
        $stmt->setFetchMode(\PDO::FETCH_CLASS,"App\Developpeur");
        $resultat = $stmt->fetchAll();
        return $resultat;
    }

    public function findOneDeveloppeur($id_developpeur) {
        $sql = "SELECT * FROM developpeur d ";
        $sql.= "WHERE d.id=:id";
        $stmt = $this->db->getPdo()->prepare($sql);
        $stmt->bindParam(':id',$id_developpeur,\PDO::PARAM_INT);
        $stmt->execute();
        $stmt->setFetchMode(\PDO::FETCH_CLASS,"App\Developpeur");
        $resultat = $stmt->fetch();
        return $resultat;
    }


    public function getLangages() {
        $sql = "SELECT * FROM langage l ";
        $sql.= "LEFT JOIN langage_developpeur ld on l.id = ld.id_langage ";
        $sql.= "WHERE ld.id_developpeur = :id";
        $stmt = $this->db->getPdo()->prepare($sql);
        $stmt->bindValue(":id",$this->getId(),\PDO::PARAM_INT);
        $stmt->execute();
        $stmt->setFetchMode(\PDO::FETCH_CLASS,"App\Langage");
        $resultat = $stmt->fetchAll();
        return $resultat;
    }

    public function addDeveloppeur() {
        $sql = "INSERT INTO developpeur (nom,bio,created_at) VALUES(:nom,:bio,:created_at)";
        $stmt = $this->db->getPdo()->prepare($sql);
        $stmt->bindValue("nom",$this->getNom(),\PDO::PARAM_STR);
        $stmt->bindValue("bio",$this->getBio(),\PDO::PARAM_STR);
        $stmt->bindValue("created_at",$this->getCreatedAt(),\PDO::PARAM_STR);
        $stmt->execute();

        //Récupération de l'id du dev qui vient d'être créer
        $id_dev = $this->db->getPdo()->lastInsertId();
        $this->setId($id_dev);
    }


    public function addLangages($langages) {
        $sql = "INSERT INTO langage_developpeur(id_developpeur,id_langage) VALUES (:id_developpeur,:id_langage)";
        $stmt = $this->db->getPdo()->prepare($sql);
        foreach ($langages as $langage) {
//            echo $this->getId()." - ".$langage."<br>";
            if ($langage !=0) {
                $stmt->bindValue(":id_developpeur",$this->getId(),\PDO::PARAM_INT);
                $stmt->bindValue(":id_langage",$langage,\PDO::PARAM_INT);
                $stmt->execute();
            }
        }
    }


}

