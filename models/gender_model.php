
<?php 

require_once("models/connect_bdd.php");

// RETOURNE TOUT LES GENRES ET LEURS ID CORRESPONDANT DANS LA BDD
function listGendersForNav() {

	global $bdd;

	$sql = "SELECT genre.name, genre.id
			FROM genre
			ORDER BY genre.name ASC";

	$response = $bdd->prepare( $sql );
    $response->execute();
    $genders = $response->fetchAll(PDO::FETCH_ASSOC);

    return $genders;

}

// RETOURNE LE(S) GENRE(S) ET LEURS ID EN FONCTION DE L'ID DU FILM
function getGenderIdOfFilm($filmId) { 

	global $bdd;

	$sql = "SELECT genre.name, genre.id
			FROM movie 
			INNER JOIN id_movie_genre on id_movie_genre.id_movie = movie.id 
			INNER JOIN genre on genre.id = id_movie_genre.id_genre 
			WHERE movie.id = :filmId";


	$response = $bdd->prepare( $sql );
	$response->bindParam(':filmId', $filmId, PDO::PARAM_STR);
    $response->execute();
    $genderForFilm = $response->fetchAll(PDO::FETCH_ASSOC);

    return $genderForFilm;
}

// RETOURNE TOUT LES FILMS QUI ONT LE GENRE ID PASSER EN PARAMETRE
function getFilmsByGender($genderId) {
	
	global $bdd;

	// Va chercher tout les films qui ont le genre ID suivant...
	$sql = "SELECT title,
			movie.title,
			movie.releaseDate,
			movie.description,
			movie.id AS mId,
			director.lastname,
			director.name,
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
			JOIN genre g ON g.id = gf.id_genre
			WHERE gf.id_genre = :genderId GROUP BY movie.id";

	$response = $bdd->prepare( $sql ); 
	$response->bindParam(':genderId', $genderId, PDO::PARAM_STR);
    $response->execute();
    $films = $response->fetchAll(PDO::FETCH_ASSOC);

    return $films;
}

?>


