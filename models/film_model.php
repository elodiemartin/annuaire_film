<?php 

require_once("models/connect_bdd.php");

function getFilmById($idFilm) {

	// Accéder à la variable $bdd du fichier connect_bdd.php
	global $bdd;

	// ICI METTRE LA REQUETE

	$sql = "SELECT 
			movie.title,
			movie.releaseDate,
			movie.description,
			movie.id AS mId,
			director.lastname,
			director.name,
			director.id AS directorId,
		 	GROUP_CONCAT(genre.name) AS gname,
		 	GROUP_CONCAT(genre.id) AS gid
		 	FROM movie
			JOIN id_movie_genre ON id_movie_genre.id_movie = movie.id
			JOIN genre ON genre.id = id_movie_genre.id_genre
			JOIN id_movie_director ON id_movie_director.id_movie = movie.id
			JOIN director ON director.id = id_movie_director.id_director
			WHERE movie.id = :idFilm";

	$response = $bdd->prepare( $sql );
	$response->bindParam(':idFilm', $idFilm, PDO::PARAM_STR);
    $response->execute();
    $film = $response->fetchAll(PDO::FETCH_ASSOC);

    // Retourne le resultat de la requête
	return $film[0];

}


// Donne toute la liste des films (nom, ID) (pour home_controller.php)
function getListOfAllFilms() {

	// Accéder à la variable $bdd du fichier connect_bdd.php
	global $bdd;

	// ICI METTRE LA REQUETE
	$sql = "SELECT movie.id, movie.title
			FROM movie";
			
	$response = $bdd->prepare( $sql );
    $response->execute();
    $list = $response->fetchAll(PDO::FETCH_ASSOC);

    // Retourne le resultat de la requête
    return $list;

} 

function getPosterUrlByIdMovie($idFilm) {

	global $bdd;

	$sql = "SELECT poster.path FROM poster WHERE poster.id = :idFilm";

	$response = $bdd->prepare( $sql );
	$response->bindParam(':idFilm', $idFilm, PDO::PARAM_STR);
    $response->execute();
    $poster = $response->fetchAll(PDO::FETCH_ASSOC);

    return $poster;
}


?>