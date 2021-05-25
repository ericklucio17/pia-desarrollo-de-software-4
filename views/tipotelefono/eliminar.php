<?php

  include_once '../../includes/database-pdo.php';

  session_start();

  $idTipoTelefono = $_GET['id'];

  $query="CALL spTipoTelefonoCRUD(4, ?, null);";
  $result = $pdo->prepare($query);
  $result->bindParam(1, $idTipoTelefono);
  $result->setFetchMode(PDO::FETCH_ASSOC);
  $result->execute();

  header("Location:index.php");

?>