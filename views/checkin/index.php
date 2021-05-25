<?php

  include_once '../../includes/database-pdo.php';

  session_start();

  $query = "CALL spReservacionDetalleCRUD(2, null, null, null, null, null);";
  $result = $pdo->prepare($query);
  $result->setFetchMode(PDO::FETCH_ASSOC);
  $result->execute();

?>

<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Check IN | Hoteles</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous" />
    <link href="../../css/dashboard.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />

    <style>
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
      <a class="navbar-brand col-md-3 col-lg-2 mr-0 px-3" href="../../inicio.php">HOTELES</a>
      <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-toggle="collapse" data-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <!-- <input class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search" /> -->
      <ul class="navbar-nav px-3">
        <li class="nav-item text-nowrap">
          <a class="nav-link" href="../../index.php">Cerrar Sesión</a>
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
                      <a class="nav-link" href="../../inicio.php">
                        <span data-feather="home"></span>
                        Inicio <span class="sr-only">(current)</span>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="../../views/rol/index.php">
                        <span data-feather="users"></span>
                        Roles
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="../../views/usuario/index.php">
                        <span data-feather="users"></span>
                        Usuarios
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="../../views/cliente/index.php">
                        <span data-feather="users"></span>
                        Clientes
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="../../views/tipocorreo/index.php">
                        <span data-feather="users"></span>
                        Tipos de Correos
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="../../views/tipotelefono/index.php">
                        <span data-feather="users"></span>
                        Tipos de Teléfonos
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="../../views/habitacion/index.php">
                        <span data-feather="users"></span>
                        Habitaciones
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="../../views/tipohabitacion/index.php">
                        <span data-feather="users"></span>
                        Tipo de Habitaciones
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="../../views/reservacion/index.php">
                        <span data-feather="users"></span>
                        Reservaciones
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="../../views/edificio/index.php">
                        <span data-feather="users"></span>
                        Edificios
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="../../views/vista/index.php">
                        <span data-feather="users"></span>
                        Vistas
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="../../views/estatus/index.php">
                        <span data-feather="users"></span>
                        Estatus
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active" href="../../views/checkin/index.php">
                        <span data-feather="users"></span>
                        Check In
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="../../views/checkout/index.php">
                        <span data-feather="users"></span>
                        Check Out
                      </a>
                    </li>
                  </ul>';
                } else {
                  echo '
                  <ul class="nav flex-column">
                    <li class="nav-item">
                      <a class="nav-link" href="../../views/reservacion/index.php">
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
                <a class="nav-link" href="../../views/reporte1/index.php">
                  <span data-feather="file-text"></span>
                  Reporte 1
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="../../views/reporte2/index.php">
                  <span data-feather="file-text"></span>
                  Reporte 2
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="../../views/reporte3/index.php">
                  <span data-feather="file-text"></span>
                  Reporte 3
                </a>
              </li>
            </ul>
          </div>
        </nav>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4 mt-5">
          <h2>Check IN</h2>
          <div class="table-responsive mt-2">
            <table class="table table-hover table-dark">
              <thead>
                <tr>
                  <th>Id Reservación</th>
                  <th>Cliente</th>
                  <th>Habitación</th>
                  <th>Estatus</th>
                  <th>Acciones</th>
                </tr>
              </thead>
              <tbody>      
                <?php
                  while($row = $result->fetch()) {
                    echo '<tr>';
                    echo '<td>' . $row['IdReservacion'] . '</td>';
                    echo '<td>' . $row['Cliente'] . '</td>';
                    echo '<td>' . $row['Habitacion'] . '</td>';
                    echo '<td>' . $row['Estatus'] . '</td>';
                    echo '<td><a class="btn btn-outline-primary" href="agregar.php?id=' . $row['IdReservacion'] . '"><i class="fas fa-plus-square"></i></a></td>';
                    echo '</tr>';
                  }
                ?>
              </tbody>
            </table>
          </div>
        </main>
      </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
    <script src="../../js/dashboard.js"></script>
  </body>
</html>
