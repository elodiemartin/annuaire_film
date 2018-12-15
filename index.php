<?php 
	require_once("models/connect_bdd.php");
	require_once("models/film_model.php");

	if (isset($_SERVER["REQUEST_URI"])) {

		$requete = explode("/", trim($_SERVER['REQUEST_URI'], "/"));
		// print_r($requete);
		// echo count($requete);
		$controller = (count($requete) === 1)? "home":$requete[1];
		// $action = (count($requete) < 3)? "liste": $requete[2];
		// $id = (count($requete) < 4)? 0 : intval($requete[3]);

		switch ($controller) {
			case 'home':
				require_once("controllers/home_controller.php");
				break;
			case 'film':
				require_once("controllers/film_controller.php");
				break;
			case 'gender':
				require_once("controllers/gender_controller.php");
				break;	
			case 'owners':
				require_once("controllers/owners_controller.php");
				break;
			case 'years':
				require_once("controllers/years_controller.php");
				break;	
			default:
				require_once("controllers/404.php");
				break;

		}
	}

// BARRE DE NAV
	
	// if (isset($_GET['askArray'])) {
	// 	$films = array("films" => "");
	// 	$films["films"] = getListOfAllFilms();
	// 	echo json_encode($films); // Encode JSON 

	// }

	if (isset($_GET['askImg'])) {
		$res = getPosterUrlByIdMovie($_GET['askImg']);
		echo json_encode($res[0]);
		
	}
?>