<?php

  require_once './includes/database-pdo.php';

  session_start();

  $mensaje = false;
  $numeroRegistro = 0;

  if (isset($_POST['iniciarsesion'])) { 
    $usuario = trim($_POST['usuario']);
    $contra = $_POST['contra'];

    $query="CALL spLogin(?, ?);";
    $result = $pdo->prepare($query);
    $result->bindParam(1, $usuario);
    $result->bindParam(2, $contra);
    $result->setFetchMode(PDO::FETCH_ASSOC);
    $result->execute();

    while($row = $result->fetch()) {
      $idUsuario = $row['IdUsuario'];
      $rol = $row['IdRol'];

      $_SESSION['idUsuario']= $idUsuario;
      $_SESSION['rol']= $rol;

      $numeroRegistro = 1;
    }

    if($numeroRegistro == 1) {
      header('location: inicio.php');
    }
    else {
      $mensaje = true;
    }
  }

?>

<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Iniciar Sesión | Hoteles</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous" />
    <link href="./css/floating-labels.css" rel="stylesheet" />
  </head>
  <body>   
    <form class="form-signin" action="index.php" method="post">
      <?php
        if ($mensaje) {
          echo '<div class="alert alert-danger alert-dismissible fade show" role="alert">
                  <strong>Usuario y/o Contraseña</strong> incorrecta, favor de verificar los datos introducidos.
                  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>';
        }     
      ?>
      <h1 class="h3 mb-3 font-weight-normal text-center">BIENVENIDO AL SISTEMA</h1>   
      <div class="form-label-group">
        <input type="text" id="inputUser" class="form-control" placeholder="Usuario" name="usuario" maxlength="45" required autofocus>
        <label for="inputUser">Usuario</label>
      </div>
      <div class="form-label-group">
        <input type="password" id="inputPassword" class="form-control" placeholder="Contraseña" name="contra" maxlength="45" required>
        <label for="inputPassword">Contraseña</label>
      </div>
      <button class="btn btn-lg btn-primary btn-block" type="submit" name="iniciarsesion">Iniciar Sesión</button>
      <p class="mt-5 mb-3 text-muted text-center">&copy; Hoteles-2021</p>
    </form>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
  </body>
</html>
