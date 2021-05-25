<?php

  include_once '../../../includes/database-pdo.php';

  session_start();

  $idCorreo = $_GET['id'];

  $query="CALL spCorreoCRUD(4, ?, null, null, null);";
  $result = $pdo->prepare($query);
  $result->bindParam(1, $idCorreo);
  $result->setFetchMode(PDO::FETCH_ASSOC);
  $result->execute();

  header("Location:index.php");

?>