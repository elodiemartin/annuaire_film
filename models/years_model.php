<?php 

require_once("models/connect_bdd.php");


function listYearsForNav() {

	global $bdd;

	$sql = "SELECT movie.releaseDate
			FROM movie
			GROUP BY releaseDate
			ORDER BY releaseDate DESC ";

	$response = $bdd->prepare( $sql );
    $response->execute();
    $years = $response->fetchAll(PDO::FETCH_ASSOC);

    return $years;

}

// RETOURNE LES FILMS EN FONCTION DE L'ANNEE
function getYears($years) { 

	global $bdd;

	$sql = "SELECT movie.releaseDate 
			FROM movie 
			WHERE movie.releaseDate = :years";

	$response = $bdd->prepare( $sql );
	$response->bindParam(':years', $years, PDO::PARAM_STR);
    $response->execute();
    $years = $response->fetchAll(PDO::FETCH_ASSOC);

    return $years;
}

// RETOURNE TOUS LES FILMS QUI ONT L'ANNEE PASSER EN PARAMETRE
function getFilmsByYears($years) {
	
	global $bdd;

	// Va chercher tout les films qui ont l'annee suivante...
	
	$sql = "SELECT title,
			movie.title,
			movie.releaseDate,
			movie.description,
			movie.id AS mId,
			director.lastname,
			director.name AS prenom,
			director.id,
			(SELECT GROUP_CONCAT(DISTINCT g.name SEPARATOR ',')
			 FROM genre g JOIN id_movie_genre gf ON g.id = gf.id_genre
			 WHERE gf.id_movie = movie.id) AS genres,
			 
			(SELECT GROUP_CONCAT(DISTINCT g.id SEPARATOR ',')
			 FROM genre g JOIN id_movie_genre gf ON g.id = gf.id_genre
			 WHERE gf.id_movie = movie.id) AS genresId
			  
			FROM movie 

			JOIN id_movie_director ON id_movie_director.id_movie = movie.id
			JOIN director ON  director.id = id_movie_director.id_director
			JOIN id_movie_genre gf ON gf.id_movie = movie.id
			JOIN genre g ON g.id = gf.id_genre WHERE movie.releaseDate = :years GROUP BY movie.id";


	$response = $bdd->prepare( $sql );
	$response->bindParam(':years', $years, PDO::PARAM_STR);
    $response->execute();
    $films = $response->fetchAll(PDO::FETCH_ASSOC);

    return $films;
}

?>