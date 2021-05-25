<?php

  $dbHost = 'localhost';
  $dbName = 'hoteles';
  $dbUser = 'root';
  $dbPass = '';

  try {
    $pdo = new PDO("mysql:host=$dbHost;dbname=$dbName", $dbUser, $dbPass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); 
    $pdo->exec("set names utf8");
  } catch(Exception $e) { 
    echo $e->getMessage(); 
  }

?>  