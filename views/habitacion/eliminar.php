<?php

  include_once '../../includes/database-pdo.php';

  session_start();

  $idHabitacion = $_GET['id'];

  $query= "CALL spHabitacionCRUD(4, ?, null, null, null, null, null, null);";
  $result = $pdo->prepare($query);
  $result->bindParam(1, $idHabitacion);
  $result->setFetchMode(PDO::FETCH_ASSOC);
  $result->execute();

  header("Location:index.php");

?>