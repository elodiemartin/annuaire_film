<?php 

    // Fichier pour se connecter à la base de donnée.d
    $baseurl = "http://elodie-martin.com/annuaire_film/";
	$username = 'username';
	$password = 'password';
	$database ='database';
  
	$host = 'host';

    try{

        $bdd = new PDO('mysql:host='.$host.';dbname='.$database.';charset=utf8',$username , $password);

    }catch (Exception $e){

        die('Erreur : ' . $e->getMessage());

    }

    

?>
