USE HOTELES;

INSERT INTO ROL (Descrip)
VALUES ('Administrador');
INSERT INTO ROL (Descrip)
VALUES ('Sub-Administrador');

INSERT INTO USUARIO (Usuario, Contra, Nombre, APaterno, AMaterno, IdRol)
VALUES ('Admin', 'Admin123', 'Erick', 'Lucio', 'Villegas' ,1);
INSERT INTO USUARIO (Usuario, Contra, Nombre, APaterno, AMaterno ,IdRol)
VALUES ('Admin2', 'Admin456', 'Bryan', 'González','Ortega', 2);

INSERT INTO TIPOTELEFONO (Descrip)
VALUES ('Casa');
INSERT INTO TIPOTELEFONO (Descrip)
VALUES ('Oficina');
INSERT INTO TIPOTELEFONO (Descrip)
VALUES ('Celular');

INSERT INTO CLIENTE (Nombre, APaterno, AMaterno, IdUsuario, FecRegistro)
VALUES ('Cesar', 'Sanchez', 'Carreón', 1, '2021-01-20');
INSERT INTO CLIENTE (Nombre, APaterno, AMaterno, IdUsuario, FecRegistro)
VALUES ('Alan', 'Jacinto', 'Martinez', 2, '2021-02-20');
INSERT INTO CLIENTE (Nombre, APaterno, AMaterno, IdUsuario, FecRegistro)
VALUES ('Celeste', 'Julio', 'Rodrigo', 1, '2021-03-20');
INSERT INTO CLIENTE (Nombre, APaterno, AMaterno, IdUsuario, FecRegistro)
VALUES ('Felicia', 'Luis', 'Romina', 2, '2021-04-20');
INSERT INTO CLIENTE (Nombre, APaterno, AMaterno, IdUsuario, FecRegistro)
VALUES ('Gustavo', 'Martín', 'Zulema', 1, '2021-05-20');

INSERT INTO TELEFONO (IdCliente, Numero, IdTipoTelefono)
VALUES (1, 9874563210, 3);
INSERT INTO TELEFONO (IdCliente, Numero, IdTipoTelefono)
VALUES (2, 3215489156, 3);
INSERT INTO TELEFONO (IdCliente, Numero, IdTipoTelefono)
VALUES (3, 8153164985, 3);
INSERT INTO TELEFONO (IdCliente, Numero, IdTipoTelefono)
VALUES (4, 8181565352, 2);
INSERT INTO TELEFONO (IdCliente, Numero, IdTipoTelefono)
VALUES (5, 8181526304, 1);

INSERT INTO TIPOCORREO (Descrip)
VALUES ('Personal');
INSERT INTO TIPOCORREO (Descrip)
VALUES ('Laboral');
INSERT INTO TIPOCORREO (Descrip)
VALUES ('Educativo');

INSERT INTO CORREO (IdCliente, Correo, IdTipoCorreo)
VALUES (1, 'cesarsanchez@gmail.com', 1);
INSERT INTO CORREO (IdCliente, Correo, IdTipoCorreo)
VALUES (2, 'cesarsanchez@empresa.com', 2);
INSERT INTO CORREO (IdCliente, Correo, IdTipoCorreo)
VALUES (3, 'cesarsanchez@uanl.edu.mx', 3);

INSERT INTO ESTATUSRESERVACION (Descrip)
VALUES ('Activa');
INSERT INTO ESTATUSRESERVACION (Descrip)
VALUES ('Cancelada');

INSERT INTO ESTATUS (Descrip)
VALUES ('Activa');
INSERT INTO ESTATUS (Descrip)
VALUES ('Reservada');
INSERT INTO ESTATUS (Descrip)
VALUES ('Ocupada');
INSERT INTO ESTATUS (Descrip)
VALUES ('Baja');
INSERT INTO ESTATUS (Descrip)
VALUES ('Mantenimiento');

INSERT INTO EDIFICIO (Descrip, Niveles)
VALUES ('Sierra', 15);
INSERT INTO EDIFICIO (Descrip, Niveles)
VALUES ('Alaska', 15);

INSERT INTO TIPOHABITACION (Descrip, Precio, Capacidad)
VALUES ('Oro', 2500, 5);
INSERT INTO TIPOHABITACION (Descrip, Precio, Capacidad)
VALUES ('Diamante', 3000, 5);
INSERT INTO TIPOHABITACION (Descrip, Precio, Capacidad)
VALUES ('Plata', 3500, 5);
INSERT INTO TIPOHABITACION (Descrip, Precio, Capacidad)
VALUES ('Platino', 4000, 5);

INSERT INTO VISTA (Descrip)
VALUES ('Mar');
INSERT INTO VISTA (Descrip)
VALUES ('Jardín');
INSERT INTO VISTA (Descrip)
VALUES ('Montaña');

INSERT INTO HABITACION (Descrip, Nivel, IdTipoHabitacion, IdEdificio, IdVista, IdEstatus)
VALUES ('Habitación para 2 personas', 5, 1,1,1,1);
INSERT INTO HABITACION (Descrip, Nivel, IdTipoHabitacion, IdEdificio, IdVista, IdEstatus)
VALUES ('Habitación para 2 personas', 2, 1,2,2,1);
INSERT INTO HABITACION (Descrip, Nivel, IdTipoHabitacion, IdEdificio, IdVista, IdEstatus)
VALUES ('Habitación para 2 personas', 1, 1,1,1,1);
INSERT INTO HABITACION (Descrip, Nivel, IdTipoHabitacion, IdEdificio, IdVista, IdEstatus)
VALUES ('Habitación para 2 personas', 3, 1,2,2,1);
INSERT INTO HABITACION (Descrip, Nivel, IdTipoHabitacion, IdEdificio, IdVista, IdEstatus)
VALUES ('Habitación para 2 personas', 10, 1,1,1,1);
INSERT INTO HABITACION (Descrip, Nivel, IdTipoHabitacion, IdEdificio, IdVista, IdEstatus)
VALUES ('Habitación para 2 personas',15 , 2,2,2,1);
INSERT INTO HABITACION (Descrip, Nivel, IdTipoHabitacion, IdEdificio, IdVista, IdEstatus)
VALUES ('Habitación para 2 personas', 11, 3,1,3,1);
INSERT INTO HABITACION (Descrip, Nivel, IdTipoHabitacion, IdEdificio, IdVista, IdEstatus)
VALUES ('Habitación para 2 personas', 8, 4,2,2,1);
INSERT INTO HABITACION (Descrip, Nivel, IdTipoHabitacion, IdEdificio, IdVista, IdEstatus)
VALUES ('Habitación para 2 personas', 7, 1,1,3,1);
INSERT INTO HABITACION (Descrip, Nivel, IdTipoHabitacion, IdEdificio, IdVista, IdEstatus)
VALUES ('Habitación para 2 personas', 4, 2,2,1,1);


INSERT INTO RESERVACION (IdUsuario, IdCliente, IdHabitacion, FecInicio, FecFin, Monto,FecRegistro, IdEstatusReservacion)
VALUES (1, 1, 1, '2021-01-29', '2021-02-01', 2000, '2021-01-20', 1);

