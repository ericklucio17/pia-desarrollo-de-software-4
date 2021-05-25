<?php

  session_start();

  include_once '../../../includes/database-pdo.php';

  $mensaje = false; 
  $validacionCombos = false;

  if (isset($_POST['editar'])) {
    $idTelefono = $_POST['idtelefono'];
    $nuevoIdCliente = $_POST['idcliente'];
    $nuevoNumero = $_POST['numero'];
    $nuevoIdTipoTelefono= $_POST['idtipotelefono'];

    if ($nuevoIdCliente == "pordefecto" || $nuevoIdTipoTelefono == "pordefecto") {
      $validacionCombos = true;

      $idCliente = $nuevoIdCliente;
      $numero = $nuevoNumero;
      $idTipoCorreo = $nuevoIdTipoTelefono;
    } else {
      $query = "CALL spTelefonoCRUD(3, ?, ?, ?, ?);";
      $result = $pdo->prepare($query);
      $result->bindParam(1, $idTelefono);
      $result->bindParam(2, $nuevoIdCliente);
      $result->bindParam(3, $nuevoNumero);
      $result->bindParam(4, $nuevoIdTipoTelefono);
      $result->setFetchMode(PDO::FETCH_ASSOC);

      if ($result->execute()) {
        $mensaje = true;

        $idCliente = $nuevoIdCliente;
        $numero = $nuevoNumero;
        $idTipoTelefono = $nuevoIdTipoTelefono;
      } 
    }
  } 

  if (isset($_GET['id'])) {
    $idTelefono = $_GET['id'];

    $query = "SELECT * FROM TELEFONO WHERE IdTelefono = ?";

    $result = $pdo->prepare($query);
    $result->bindParam(1, $idTelefono);
    $result->setFetchMode(PDO::FETCH_ASSOC);
    $result->execute();

    while($row = $result->fetch()) {
      $idCliente = $row['IdCliente'];
      $numero = $row['Numero'];
      $idTipoTelefono = $row['IdTipoTelefono'];
    }
  }

?>

<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Editar Teléfono | Hoteles</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous" />
    <link href="../../../css/dashboard.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />

    <style>
      a {
        text-decoration: none;
      }

      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
  </head>
  <body>
    <nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
      <a class="navbar-brand col-md-3 col-lg-2 mr-0 px-3" href="../../../inicio.php">HOTELES</a>
      <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-toggle="collapse" data-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <!-- <input class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search" /> -->
      <ul class="navbar-nav px-3">
        <li class="nav-item text-nowrap">
          <a class="nav-link" href="../../../index.php">Cerrar Sesión</a>
        </li>
      </ul>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
          <div class="sidebar-sticky pt-3">
            <?php 
              if (isset($_SESSION["rol"])) {
                if ($_SESSION["rol"] == 1) {
                  echo '
                  <ul class="nav flex-column">
                    <li class="nav-item">
                      <a class="nav-link" href="../../../inicio.php">
                        <span data-feather="home"></span>
                        Inicio <span class="sr-only">(current)</span>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="../../../views/rol/index.php">
                        <span data-feather="users"></span>
                        Roles
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="../../../views/usuario/index.php">
                        <span data-feather="users"></span>
                        Usuarios
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active" href="../../../views/cliente/index.php">
                        <span data-feather="users"></span>
                        Clientes
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="../../../views/tipocorreo/index.php">
                        <span data-feather="users"></span>
                        Tipos de Correos
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href=../"../../views/tipotelefono/index.php">
                        <span data-feather="users"></span>
                        Tipos de Teléfonos
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="../../../views/habitacion/index.php">
                        <span data-feather="users"></span>
                        Habitaciones
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="../../../views/tipohabitacion/index.php">
                        <span data-feather="users"></span>
                        Tipo de Habitaciones
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="../../../views/reservacion/index.php">
                        <span data-feather="users"></span>
                        Reservaciones
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="../../../views/edificio/index.php">
                        <span data-feather="users"></span>
                        Edificios
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="../../../views/vista/index.php">
                        <span data-feather="users"></span>
                        Vistas
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="../../../views/estatus/index.php">
                        <span data-feather="users"></span>
                        Estatus
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="../../../views/checkin/index.php">
                        <span data-feather="users"></span>
                        Check In
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="../../../views/checkout/index.php">
                        <span data-feather="users"></span>
                        Check Out
                      </a>
                    </li>
                  </ul>';
                } else {
                  echo '
                  <ul class="nav flex-column">
                    <li class="nav-item">
                      <a class="nav-link" href="../../../views/reservacion/index.php">
                        <span data-feather="users"></span>
                        Reservaciones
                      </a>
                    </li> 
                  </ul>';
                }              
              }
            ?>

            <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
              <span>Reportes</span>
              <a class="d-flex align-items-center text-muted" href="#" aria-label="Add a new report">
                <span data-feather="plus-circle"></span>
              </a>
            </h6>
            <ul class="nav flex-column mb-2">
              <li class="nav-item">
                <a class="nav-link" href="../../../views/reporte1/index.php">
                  <span data-feather="file-text"></span>
                  Reporte 1
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="../../../views/reporte2/index.php">
                  <span data-feather="file-text"></span>
                  Reporte 2
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="../../../views/reporte3/index.php">
                  <span data-feather="file-text"></span>
                  Reporte 3
                </a>
              </li>
            </ul>
          </div>
        </nav>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4 mt-5">
          <h2>Editar Teléfono</h2>
          <a href="index.php" class="btn btn-outline-primary mt-2">Regresar</a>
          <?php
            if ($mensaje) {
              echo '<div class="alert alert-primary alert-dismissible fade show mt-3" role="alert">
                      <strong>Teléfono editado</strong> correctamente.
                      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>';
            }     
          ?>
          <?php
            if ($validacionCombos) {
              echo '<div class="alert alert-danger alert-dismissible fade show mt-3" role="alert">
                      <strong>Alguno o algunos combos no tiene una opción valida.</strong> Favor de elegir una de las opciones que se le presentan.
                      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>';
            }     
          ?>
          <form action="editar.php" method="post" class="mt-3">
            <div class="form-row">
              <input type="hidden" name="idtelefono" value="<?php echo $idTelefono ?>">
              <div class="col-md-4 mb-3">
                <label for="validationDefault01">Cliente:</label>
                <select class="form-control" name="idcliente" id="validationDefault01" required>
                  <option value="pordefecto">Seleccione:</option>
                  <?php
                  $comboCliente = "CALL spComboCliente();";
                  $resultComboCliente = $pdo->prepare($comboCliente);
                  $resultComboCliente->setFetchMode(PDO::FETCH_ASSOC);
                  $resultComboCliente->execute();

                  while($row = $resultComboCliente->fetch()) {
                    if($row["IdCliente"] == $idCliente) { ?>
                      <option selected value="<?php echo $row["IdCliente"] ?>"><?php echo $row["NombreCompleto"] ?></option> <?php 
                    } else { ?> 
                      <option value="<?php echo $row["IdCliente"] ?>"><?php echo $row["NombreCompleto"] ?></option> <?php
                    } 
                  } $resultComboCliente->closeCursor(); ?>
                </select>                   
              </div>           
              <div class="col-md-4 mb-3">
                <label for="validationDefault02">Número de Teléfono:</label>
                <input type="number" class="form-control" id="validationDefault02" name="numero" value="<?php echo $numero; ?>" maxlength="45" required />
              </div>
              <div class="col-md-4 mb-3">
                <label for="validationDefault03">Tipo de Teléfono:</label>
                <select class="form-control" name="idtipotelefono" id="validationDefault03" required>
                  <option value="pordefecto">Seleccione:</option>
                  <?php
                  $comboTipoTelefono = "CALL spComboTipoTelefono();";
                  $resultComboTipoTelefono = $pdo->prepare($comboTipoTelefono);
                  $resultComboTipoTelefono->setFetchMode(PDO::FETCH_ASSOC);
                  $resultComboTipoTelefono->execute();

                  while($row = $resultComboTipoTelefono->fetch()) {
                    if($row["IdTipoTelefono"] == $idTipoTelefono) { ?>
                      <option selected value="<?php echo $row["IdTipoTelefono"] ?>"><?php echo $row["Descrip"] ?></option> <?php 
                    } else { ?> 
                      <option value="<?php echo $row["IdTipoTelefono"] ?>"><?php echo $row["Descrip"] ?></option> <?php
                    } 
                  } $resultComboTipoTelefono->closeCursor(); ?>
                </select>                   
              </div>  
            </div>
            <button class="btn btn-primary" type="submit" name="editar">Editar</button>
            <!-- <button class="btn btn-dark" type="submit" name="limpiar">Limpiar</button> -->
          </form>
        </main>
      </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
    <script src="../../../js/dashboard.js"></script>
  </body>
</html>