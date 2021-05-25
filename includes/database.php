<?php 

$servidor = 'localhost';
$baseDeDatos = 'hoteles';
$usuario = 'root';
$contrasena = '';

$db = mysqli_connect($servidor, $usuario, $contrasena, $baseDeDatos);

// if (mysqli_connect_errno()) {
//   echo "La conexion a la base de datos ha fallado:" . mysqli_connect_error();
// } else {
//   echo "Conexion realziada correctamente";
// }

mysqli_query($db, "SET NAMES 'utf8'");