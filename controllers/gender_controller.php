<?php 

require_once('vendor/autoload.php');
require_once('models/film_model.php');
require_once('models/owners_model.php');
require_once('models/gender_model.php');
require_once('models/years_model.php');

if (isset($_SERVER["REQUEST_URI"])) {
	$requete = explode("/", trim($_SERVER['REQUEST_URI'], "/"));
	$action = (count($requete) < 3)? NULL: $requete[2];
	$id = (count($requete) < 4)? 0 : intval($requete[3]);
}

function renderFilmsByGender($genderId) {
	$loader = new Twig_Loader_Filesystem('views');
	$twig = new Twig_Environment($loader);
	$filmsByGender = getFilmsByGender($genderId); // Fonction importé depuis film_model.php
	// print_r($filmsByGender); // DEBUG HERE
	$years = listYearsForNav();
	$genders = listGendersForNav();
	$owners = listOwnersForNav();
	echo $twig->render('gender_view.twig', array('film' => $filmsByGender, 'years' => $years, 'genders' => $genders, 'owners' => $owners));
}
	
switch ($action) {
	case 'list':
		renderFilmsByGender($id);
		break;
	default:
		require_once("controllers/404.php");
		break;
}


?>