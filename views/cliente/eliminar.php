<?php

  include_once '../../includes/database-pdo.php';

  session_start();

  $idCliente = $_GET['id'];

  $query="CALL spClienteCRUD(4, ?, null, null, null, null, null);";
  $result = $pdo->prepare($query);
  $result->bindParam(1, $idCliente);
  $result->setFetchMode(PDO::FETCH_ASSOC);
  $result->execute();

  header("Location:index.php");

?>