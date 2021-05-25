<?php

  include_once '../../includes/database-pdo.php';

  session_start();

  $idEdificio = $_GET['id'];

  $query="CALL spEdificioCRUD(4, ?, null, null);";
  $result = $pdo->prepare($query);
  $result->bindParam(1, $idEdificio);
  $result->setFetchMode(PDO::FETCH_ASSOC);
  $result->execute();

  header("Location:index.php");

?>