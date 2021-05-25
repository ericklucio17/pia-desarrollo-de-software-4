<?php

  include_once '../../includes/database-pdo.php';

  session_start();

  $idEstatus = $_GET['id'];

  $query="CALL spEstatusCRUD(4, ?, null);";
  $result = $pdo->prepare($query);
  $result->bindParam(1, $idEstatus);
  $result->setFetchMode(PDO::FETCH_ASSOC);
  $result->execute();

  header("Location:index.php");

?>