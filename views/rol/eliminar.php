<?php

  include_once '../../includes/database-pdo.php';

  session_start();

  $idRol = $_GET['id'];

  $query="CALL spRolCRUD(4, ?, null);";
  $result = $pdo->prepare($query);
  $result->bindParam(1, $idRol);
  $result->setFetchMode(PDO::FETCH_ASSOC);
  $result->execute();

  header("Location:index.php");

?>