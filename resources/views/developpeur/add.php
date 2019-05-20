<!doctype html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>
</head>
<body>
<?= \App\Kernel\ToolBox::getFlash() ?>
<h1>Ajouter un développeur</h1>
<form action="?uri=developpeur/store" method="POST">
    <div>
        <label for="nom">Nom : </label> <br/>
        <input type="text" id="nom" name="nom">
    </div>
    <div>
        <label for="bio">Bio : </label> <br/>
        <textarea name="bio" id="bio" cols="30" rows="10"></textarea>
    </div>
    <div>
<!--        <input type="hidden" name="langages[]" value="">-->
        <?php foreach($langages as $langage) : ?>

        <label>
            <input type="checkbox" name="langages[]" value="<?= $langage->getId() ?>">
            <?= $langage->getNom() ?>
        </label>
        <br/>
        <?php endforeach; ?>

        <br/>
    </div>
    <div>
        <input type="submit">
    </div>
</form>
<script src="js/jquery-3.3.1.slim.min.js"></script>
</script><script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>