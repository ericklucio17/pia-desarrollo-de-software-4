<?php

  include_once '../../includes/database-pdo.php';

  $idTipoHabitacion = $_GET['id'];

  $query="CALL spTipoHabitacionCRUD(4, ?, null, null, null);";
  $result = $pdo->prepare($query);
  $result->bindParam(1, $idTipoHabitacion);
  $result->setFetchMode(PDO::FETCH_ASSOC);
  $result->execute();

  header("Location:index.php");

?>