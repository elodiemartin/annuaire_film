<?php 

require_once("models/connect_bdd.php");


function listOwnersForNav() {

	global $bdd;

	$sql = "SELECT director.name, director.lastname, director.id
			FROM director
			ORDER BY director.lastname ASC";

	$response = $bdd->prepare( $sql );
    $response->execute();
    $owners = $response->fetchAll(PDO::FETCH_ASSOC);

    return $owners;

}

function getFilmsByOwners($ownersId) {

	// Accéder à la variable $bdd du fichier connect_bdd.php
	global $bdd;

	$sql = "SELECT movie.title, movie.id AS mId, movie.releaseDate, director.name AS prenom, director.lastname, director.id,

	(SELECT GROUP_CONCAT(DISTINCT g.name SEPARATOR ',')
	FROM genre g JOIN id_movie_genre gf ON g.id = gf.id_genre
	WHERE gf.id_movie = movie.id) AS genres,
			 
	(SELECT GROUP_CONCAT(DISTINCT g.id SEPARATOR ',')
	FROM genre g JOIN id_movie_genre gf ON g.id = gf.id_genre
	WHERE gf.id_movie = movie.id) AS genresId

	FROM movie 
	INNER JOIN id_movie_director ON id_movie_director.id_movie = movie.id 
	INNER JOIN director ON director.id = id_movie_director.id_director
	WHERE director.id = :ownersId";


	$response = $bdd->prepare( $sql );
	$response->bindParam(':ownersId', $ownersId, PDO::PARAM_STR);
    $response->execute();
    $owners = $response->fetchAll(PDO::FETCH_ASSOC);

    // Retourne le resultat de la requête
    return $owners;
}
 
?>