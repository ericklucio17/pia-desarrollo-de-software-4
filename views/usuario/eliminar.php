<?php

  include_once '../../includes/database-pdo.php';

  session_start();

  $idUsuario = $_GET['id'];

  $query="CALL spUsuarioCRUD(4, ?, null, null, null, null, null, null);";
  $result = $pdo->prepare($query);
  $result->bindParam(1, $idUsuario);
  $result->setFetchMode(PDO::FETCH_ASSOC);
  $result->execute();

  header("Location:index.php");

?>