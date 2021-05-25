<?php

  include_once '../../../includes/database-pdo.php';

  session_start();

  $idTelefono = $_GET['id'];

  $query="CALL spTelefonoCRUD(4, ?, null, null, null);";
  $result = $pdo->prepare($query);
  $result->bindParam(1, $idTelefono);
  $result->setFetchMode(PDO::FETCH_ASSOC);
  $result->execute();

  header("Location:index.php");

?>