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


// Affiche le block twig contenant la liste de tout les films.
function renderHomePage() {
	$loader = new Twig_Loader_Filesystem('views');
	$twig = new Twig_Environment($loader);
	$films = getListOfAllFilms();
	$years = listYearsForNav();
	$genders = listGendersForNav();
	$owners = listOwnersForNav();
	echo $twig->render('home_view.twig', array('films' => $films, 'years' => $years, 'genders' => $genders, 'owners' => $owners));	
}


renderHomePage();




?>