<?php

  include_once '../../includes/database-pdo.php';

  session_start();

  $idVista = $_GET['id'];

  $query="CALL spVistaCRUD(4, ?, null);";
  $result = $pdo->prepare($query);
  $result->bindParam(1, $idVista);
  $result->setFetchMode(PDO::FETCH_ASSOC);
  $result->execute();

  header("Location:index.php");

?>