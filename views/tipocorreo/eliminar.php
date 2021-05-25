<?php

  include_once '../../includes/database-pdo.php';

  session_start();

  $idTipoCorreo = $_GET['id'];

  $query="CALL spTipoCorreoCRUD(4, ?, null);";
  $result = $pdo->prepare($query);
  $result->bindParam(1, $idTipoCorreo);
  $result->setFetchMode(PDO::FETCH_ASSOC);
  $result->execute();

  header("Location:index.php");

?>