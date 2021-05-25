CREATE DATABASE HOTELES;

USE HOTELES;

CREATE TABLE ROL (
	IdRol INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  Descrip VARCHAR(45) NOT NULL
);

CREATE TABLE ESTATUSRESERVACION (
	IdEstatusReservacion INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	Descrip	VARCHAR(45) NOT NULL
);

CREATE TABLE ESTATUS (
	IdEstatus INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	Descrip	VARCHAR(45) NOT NULL 
);

CREATE TABLE TIPOCORREO (
	IdTipoCorreo INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  Descrip VARCHAR(45) NOT NULL
);

CREATE TABLE TIPOHABITACION (
	IdTipoHabitacion INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	Descrip	VARCHAR(60) NOT NULL,
	Precio DECIMAL (12,2) NOT NULL,
	Capacidad INT NOT NULL
);

CREATE TABLE TIPOTELEFONO (
	IdTipoTelefono INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  Descrip VARCHAR(45) NOT NULL
);

CREATE TABLE EDIFICIO (
	IdEdificio INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	Descrip	VARCHAR(45) NOT NULL,
	Niveles INT NOT NULL
);

CREATE TABLE VISTA (
	IdVista INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	Descrip VARCHAR(45) NOT NULL
);

CREATE TABLE USUARIO (
	IdUsuario INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  Usuario VARCHAR(45) NOT NULL,
  Contra VARCHAR(45) NOT NULL,
  Nombre VARCHAR(50) NOT NULL,
  APaterno VARCHAR(50) NOT NULL,
  AMaterno VARCHAR(50) NOT NULL,
  IdRol INT NOT NULL,
  FOREIGN KEY (IdRol) REFERENCES ROL(IdRol)
);

CREATE TABLE CLIENTE (
	IdCliente INT AUTO_INCREMENT PRIMARY KEY NOT NULL, 
  Nombre VARCHAR(45) NOT NULL,
  APaterno VARCHAR(60) NOT NULL,
  AMaterno VARCHAR(60) NOT NULL,
  IdUsuario INT NOT NULL,
  FecRegistro DATE NOT NULL,
  FOREIGN KEY (IdUsuario) REFERENCES USUARIO(IdUsuario)
);

CREATE TABLE TELEFONO (
	IdTelefono INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  IdCliente INT NOT NULL,
  Numero VARCHAR(45) NOT NULL,
  IdTipoTelefono INT NOT NULL,
  FOREIGN KEY (IdTipoTelefono) REFERENCES TIPOTELEFONO(IdTipoTelefono)
);

CREATE TABLE CORREO (
	IdCorreo INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  IdCliente INT NOT NULL,
  Correo VARCHAR(45) NOT NULL,
  IdTipoCorreo INT NOT NULL,
  FOREIGN KEY (IdCliente) REFERENCES CLIENTE(IdCliente),
  FOREIGN KEY (IdTipoCorreo) REFERENCES TIPOCORREO(IdTipoCorreo)
);

CREATE TABLE HABITACION (
	IdHabitacion INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	Descrip VARCHAR(45) NOT NULL,
	Nivel INT NOT NULL,
	IdTipoHabitacion INT NOT NULL,
	IdEdificio INT NOT NULL,
	IdVista INT NOT NULL,
	IdEstatus INT NOT NULL,
  FOREIGN KEY (IdTipoHabitacion) REFERENCES TIPOHABITACION(IdTipoHabitacion),
  FOREIGN KEY (IdEdificio) REFERENCES EDIFICIO(IdEdificio),
  FOREIGN KEY (IdVista) REFERENCES VISTA(IdVista),
  FOREIGN KEY (IdEstatus) REFERENCES ESTATUS(IdEstatus)
);

CREATE TABLE RESERVACION (
	IdReservacion INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  IdUsuario INT NOT NULL,
  IdCliente INT NOT NULL,
  IdHabitacion INT NOT NULL,
  FecInicio DATE NOT NULL,
  FecFin DATE NOT NULL,
  Monto DECIMAL(12,2) NOT NULL,
  FecRegistro DATETIME NOT NULL,
  IdEstatusReservacion INT NOT NULL,
  FOREIGN KEY (IdUsuario) REFERENCES USUARIO(IdUsuario),
  FOREIGN KEY (IdCliente) REFERENCES CLIENTE(IdCliente),
  FOREIGN KEY (IdHabitacion) REFERENCES HABITACION(IdHabitacion),
  FOREIGN KEY (IdEstatusReservacion) REFERENCES ESTATUSRESERVACION(IdEstatusReservacion)
);

CREATE TABLE RESERVACION_DETALLE (
	IdReservacionDetalle INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	IdReservacion INT NOT NULL,
  IdCliente INT NOT NULL,
  FecIN DATETIME NOT NULL,
  FecOUT DATETIME NOT NULL,
  FOREIGN KEY (IdReservacion) REFERENCES RESERVACION(IdReservacion),
  FOREIGN KEY (IdCliente) REFERENCES CLIENTE(IdCliente)
);

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

DELIMITER //

CREATE PROCEDURE spClienteCRUD (
  pAccion INT,
  pIdCliente INT,
  pNombre VARCHAR(45),
  pAPaterno VARCHAR(60),
  pAMaterno VARCHAR(60),
  pIdUsuario INT,
  pFecRegistro DATE
)
BEGIN
  CASE  
    WHEN pAccion = 1 THEN 
      INSERT INTO CLIENTE (Nombre, APaterno, AMaterno, IdUsuario, FecRegistro)
      VALUES (pNombre, pAPaterno, pAMaterno, pIdUsuario, pFecRegistro);
    WHEN pAccion = 2 THEN 
      SELECT IdCliente,
             Nombre,
             APaterno,
             AMaterno,
             FecRegistro
      FROM CLIENTE
      ORDER BY IdCLiente;
    WHEN pAccion = 3 THEN 
      UPDATE CLIENTE
      SET Nombre = pNombre,
          APaterno = pAPaterno,
          AMaterno = pAMaterno
	    WHERE IdCLiente = pIdCliente;
    WHEN pAccion = 4 THEN 
      DELETE 
      FROM CLIENTE
      WHERE IdCLiente = pIdCliente;
  END CASE;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE spComboCliente()
BEGIN
  SELECT IdCliente, 
         CONCAT(Nombre, " ", APaterno, " ", AMaterno) AS NombreCompleto
  FROM CLIENTE
  ORDER BY IdCliente;
END //

DELIMITER ;

USE HOTELES;

DELIMITER //

CREATE PROCEDURE spComboEdificio()
BEGIN
  SELECT IdEdificio, 
         Descrip
  FROM EDIFICIO
  ORDER BY IdEdificio;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE spComboEstatus()
BEGIN
  SELECT IdEstatus, 
         Descrip
  FROM ESTATUS
  ORDER BY IdEstatus;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE spComboEstatusReservacion()
BEGIN
  SELECT IdEstatusReservacion, 
         Descrip
  FROM ESTATUSRESERVACION
  ORDER BY IdEstatusReservacion;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE spComboHabitacion()
BEGIN
  SELECT IdHabitacion, 
         Descrip
  FROM HABITACION
  GROUP BY Descrip;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE spComboReservacion()
BEGIN
  SELECT IdReservacion
  FROM RESERVACION
  ORDER BY IdReservacion;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE spComboRol()
BEGIN
  SELECT IdRol,
         Descrip
  FROM ROL
  ORDER BY IdRol;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE spComboTipoCorreo()
BEGIN
  SELECT IdTipoCorreo, 
         Descrip
  FROM TIPOCORREO
  ORDER BY IdTipoCorreo;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE spComboTipoHabitacion()
BEGIN
  SELECT IdTipoHabitacion, 
         Descrip
  FROM TIPOHABITACION
  ORDER BY IdTipoHabitacion;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE spComboTipoTelefono()
BEGIN
  SELECT IdTipoTelefono,
         Descrip
  FROM TIPOTELEFONO
  ORDER BY IdTipoTelefono;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE spComboVista()
BEGIN
  SELECT IdVista, 
         Descrip
  FROM VISTA
  ORDER BY IdVista;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE spCorreoCRUD (
  pAccion INT,
  pIdCorreo INT,
  pIdCliente INT,
  pCorreo VARCHAR(45),
  pIdTipoCorreo INT
)
BEGIN
  CASE  
    WHEN pAccion = 1 THEN 
      INSERT INTO CORREO (IdCliente, Correo, IdTipoCorreo)
      VALUES (pIdCliente, pCorreo, pIdTipoCorreo);
    WHEN pAccion = 2 THEN 
      SELECT COR.IdCorreo,
			       COR.IdCliente,
             CONCAT(CLI.Nombre, " ", CLI.APaterno, " ", CLI.AMaterno) AS Cliente,
             COR.Correo,
             COR.IdTipoCorreo,
			       TIPCOR.Descrip AS TipoCorreo
      FROM CORREO AS COR
      INNER JOIN CLIENTE as CLI on COR.IdCliente = CLI.IdCliente
      INNER JOIN TIPOCORREO as TIPCOR on COR.IdTipoCorreo = TIPCOR.IdTipoCorreo
      ORDER BY COR.IdCorreo;
    WHEN pAccion = 3 THEN 
      UPDATE CORREO
      SET IdCliente = pIdCliente,
          Correo = pCorreo,
          IdTipoCorreo = pIdTipoCorreo
		  WHERE IdCorreo = pIdCorreo;
    WHEN pAccion = 4 THEN 
      DELETE 
      FROM CORREO
      WHERE IdCorreo = pIdCorreo;
  END CASE;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE spEdificioCRUD (
  pAccion INT,
  pIdEdificio INT,
  pDescrip VARCHAR(45),
  pNiveles VARCHAR(45)
)
BEGIN
  CASE  
    WHEN pAccion = 1 THEN 
      INSERT INTO EDIFICIO (Descrip, Niveles)
      VALUES (pDescrip, pNiveles);
    WHEN pAccion = 2 THEN 
      SELECT IdEdificio,
             Descrip,
             Niveles
      FROM EDIFICIO
      ORDER BY IdEdificio;
    WHEN pAccion = 3 THEN 
      UPDATE EDIFICIO
      SET Descrip = pDescrip,
          Niveles = pNiveles
		  WHERE IdEdificio = pIdEdificio;
    WHEN pAccion = 4 THEN 
      DELETE 
      FROM EDIFICIO
      WHERE IdEdificio = pIdEdificio;
  END CASE;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE spEstatusCRUD (
  pAccion INT,
  pIdEstatus INT,
  pDescrip VARCHAR(45)
)
BEGIN
  CASE  
    WHEN pAccion = 1 THEN 
      INSERT INTO ESTATUS (Descrip)
      VALUES (pDescrip);
    WHEN pAccion = 2 THEN 
      SELECT IdEstatus,
             Descrip
      FROM ESTATUS
      ORDER BY IdEstatus;
    WHEN pAccion = 3 THEN 
      UPDATE ESTATUS
      SET Descrip = pDescrip
		  WHERE IdEstatus = pIdEstatus;
    WHEN pAccion = 4 THEN 
      DELETE 
      FROM ESTATUS
      WHERE IdEstatus = pIdEstatus;
  END CASE;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE spHabitacionCRUD (
  pAccion INT,
  pIdHabitacion INT,
  pDescrip VARCHAR(45),
  pNivel INT,
  pIdTipoHabitacion INT,
  pIdEdificio INT,
  pIdVista INT,
  pIdEstatus INT
)
BEGIN
  CASE  
    WHEN pAccion = 1 THEN 
      INSERT INTO HABITACION (Descrip, Nivel, IdTipoHabitacion, IdEdificio, IdVista, IdEstatus)
      VALUES (pDescrip, pNivel, pIdTipoHabitacion, pIdEdificio, pIdVista, pIdEstatus);
    WHEN pAccion = 2 THEN 
      SELECT HAB.IdHabitacion,
             HAB.Descrip,
             HAB.Nivel, 
             TIPHAB.Descrip AS TipoDeHabitacion, 
             EDI.Descrip AS Edificio,  
             VIS.Descrip AS Vista,
             EST.Descrip AS Estatus
      FROM HABITACION AS HAB
      INNER JOIN TIPOHABITACION AS TIPHAB ON HAB.IdTipoHabitacion = TIPHAB.IdTipoHabitacion
      INNER JOIN EDIFICIO AS EDI ON HAB.IdEdificio = EDI.IdEdificio
      INNER JOIN VISTA AS VIS ON HAB.IdVista = VIS.IdVista
      INNER JOIN ESTATUS AS EST ON HAB.IdEstatus = EST.IdEstatus
      ORDER BY HAB.IdHabitacion;
    WHEN pAccion = 3 THEN 
      UPDATE HABITACION
      SET Descrip = pDescrip,
          Nivel = pNivel,
          IdTipoHabitacion = pIdTipoHabitacion,
          IdEdificio = pIdEdificio,
          IdVista = pIdVista,
          IdEstatus = pIdEstatus
		  WHERE IdHabitacion = pIdHabitacion;
    WHEN pAccion = 4 THEN 
      DELETE 
      FROM HABITACION
      WHERE IdHabitacion = pIdHabitacion;
  END CASE;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE spLogin(
  pUsuario VARCHAR(45),
  pContra VARCHAR(45)
)
BEGIN
  SELECT IdUsuario, 
         Usuario,
         Contra, 
         Nombre, 
         APaterno, 
         AMaterno, 
         IdRol
  FROM USUARIO
  WHERE Usuario = pUsuario AND Contra = pContra;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE spReportesCRUD (
  pAccion INT
)
BEGIN
  CASE  
    WHEN pAccion = 1 THEN 
      SELECT USU.IdUsuario AS USUARIO, USU.Nombre AS NOMBRE, USU.APaterno AS APELLIDO, COUNT(DISTINCT CLI.IdCliente) AS CLIENTES_REGISTRADOS
      FROM USUARIO AS USU
      INNER JOIN CLIENTE AS CLI ON USU.IdUsuario = CLI.IdUsuario
      GROUP BY USU.IdUsuario;
    WHEN pAccion = 2 THEN 
      SELECT RES.IdCliente AS CLIENTE, CLI.Nombre AS NOMBRE, CLI.APaterno AS APELLIDO, COUNT(CLI.IdCliente) AS RESERVACIONES
      FROM CLIENTE AS CLI
      INNER JOIN RESERVACION AS RES ON CLI.IdCliente = RES.IdCliente
      GROUP BY CLI.IdCliente;
	  WHEN pAccion = 3 THEN 
      SELECT THAB.Descrip AS HABITACION, COUNT(HAB.IdTipoHabitacion) AS REGISTRO_HABITACIONES
      FROM HABITACION AS HAB
      INNER JOIN TIPOHABITACION AS THAB ON HAB.IdTipoHabitacion = THAB.IdTipoHabitacion
      GROUP BY HAB.IdTipoHabitacion;
  END CASE;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE spReservacionCRUD (
  pAccion INT,
  pIdReservacion INT,
  pIdUsuario INT,
  pIdCliente INT,
  pIdHabitacion INT,
  pFecInicio DATE,
  pFecFin DATE,
  pMonto DECIMAL(12,2),
  pFecRegistro DATETIME,
  pIdEstatusReservacion INT
)
BEGIN
  CASE  
    WHEN pAccion = 1 THEN 
      INSERT INTO RESERVACION (IdUsuario, IdCliente, IdHabitacion, FecInicio, FecFin, Monto, FecRegistro, IdEstatusReservacion)
      VALUES (pIdUsuario, pIdCliente, pIdHabitacion, pFecInicio, pFecFin, pMonto, pFecRegistro, pIdEstatusReservacion);
    WHEN pAccion = 2 THEN 
      SELECT RES.IdReservacion,
             RES.IdUsuario, 
             USU.Nombre AS Usuario,
             RES.IdCliente,
             CONCAT(CLI.Nombre, " ", CLI.APaterno, " ", CLI.AMaterno) AS Cliente,
             RES.IdHabitacion, 
             HAB.Descrip AS Habitacion,
             RES.FecInicio, 
             RES.FecFin, 
             RES.Monto, 
             RES.FecRegistro,
             RES.IdEstatusReservacion,
             ESTRES.Descrip AS Estatus
      FROM RESERVACION AS RES
      INNER JOIN USUARIO AS USU ON RES.IdUsuario = USU.IdUsuario
      INNER JOIN CLIENTE AS CLI ON RES.IdCliente = CLI.IdCliente
      INNER JOIN HABITACION as HAB on RES.IdHabitacion = HAB.IdHabitacion
      INNER JOIN ESTATUSRESERVACION AS ESTRES ON RES.IdEstatusReservacion = ESTRES.IdEstatusReservacion
      ORDER BY RES.IdReservacion;
    WHEN pAccion = 3 THEN 
      UPDATE RESERVACION
      SET IdUsuario = pIdUsuario,
          IdCliente = pIdCliente,
          IdHabitacion = pIdHabitacion,
          FecInicio = pFecInicio,
          FecFin = pFecFin,
			    Monto = pMonto,
          FecRegistro = pFecRegistro,
          IdEstatusReservacion = pIdEstatusReservacion
		  WHERE IdReservacion = pIdReservacion;
    WHEN pAccion = 4 THEN 
      DELETE 
      FROM RESERVACION
      WHERE IdReservacion = pIdReservacion;
  END CASE;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE spReservacionDetalleCRUD (
  pAccion INT,
  pIdReservacionDetalle INT,
  pIdReservacion INT,
  pIdCliente INT,
  pFecIN DATETIME,
  pFecOUT DATETIME
)
BEGIN
  CASE  
    WHEN pAccion = 1 THEN 
      INSERT INTO RESERVACION_DETALLE (IdReservacion, IdCliente, FecIN, FecOUT)
      VALUES (pIdReservacion, pIdCliente, pFecIN, pFecOUT);
    WHEN pAccion = 2 THEN 
      SELECT RES.IdReservacion,
			       RES.IdCliente,
             CONCAT(CLI.Nombre, " ", CLI.APaterno, " ", CLI.AMaterno) AS Cliente,
             RES.IdHabitacion,
             HAB.Descrip AS Habitacion,
             RES.IdEstatusReservacion,
             ESTRES.Descrip AS Estatus
      FROM RESERVACION AS RES
      INNER JOIN CLIENTE AS CLI ON RES.IdCliente = CLI.IdCLiente
      INNER JOIN HABITACION AS HAB ON RES.IdHabitacion =  HAB.IdHabitacion
      INNER JOIN ESTATUSRESERVACION AS ESTRES ON RES.IdEstatusReservacion = ESTRES.IdEstatusReservacion;
    WHEN pAccion = 3 THEN 
      SELECT RES.IdReservacion,
			       RES.IdCliente,
             CONCAT(CLI.Nombre, " ", CLI.APaterno, " ", CLI.AMaterno) AS Cliente,
             RES.IdHabitacion,
             HAB.Descrip AS Habitacion,
             RES.IdEstatusReservacion,
             ESTRES.Descrip AS Estatus
      FROM RESERVACION AS RES
      INNER JOIN CLIENTE AS CLI ON RES.IdCliente = CLI.IdCLiente
      INNER JOIN HABITACION AS HAB ON RES.IdHabitacion =  HAB.IdHabitacion
      INNER JOIN ESTATUSRESERVACION AS ESTRES ON RES.IdEstatusReservacion = ESTRES.IdEstatusReservacion
      WHERE RES.IdReservacion = pIdReservacion;
    WHEN pAccion = 4 THEN 
      SELECT RESDET.IdReservacionDetalle,
             RESDET.IdReservacion,
			       RESDET.IdCliente,
             CONCAT(CLI.Nombre, " ", CLI.APaterno, " ", CLI.AMaterno) AS Cliente,
             RESDET.FecIN
      FROM RESERVACION_DETALLE AS RESDET
      INNER JOIN RESERVACION AS RES ON RESDET.IdReservacion = RES.IdReservacion
      INNER JOIN CLIENTE AS CLI ON RES.IdCliente = CLI.IdCLiente;
    WHEN pAccion = 5 THEN 
      UPDATE RESERVACION_DETALLE
      SET FecOUT = pFecOUT
		  WHERE IdReservacionDetalle = pIdReservacionDetalle;
    WHEN pAccion = 6 THEN 
      SELECT RESDET.IdReservacionDetalle,
             RESDET.IdReservacion,
			       RESDET.IdCliente,
             CONCAT(CLI.Nombre, " ", CLI.APaterno, " ", CLI.AMaterno) AS Cliente
      FROM RESERVACION_DETALLE AS RESDET
      INNER JOIN RESERVACION AS RES ON RESDET.IdReservacion = RES.IdReservacion
      INNER JOIN CLIENTE AS CLI ON RES.IdCliente = CLI.IdCLiente
      WHERE RESDET.IdReservacionDetalle = pIdReservacionDetalle; 
  END CASE;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE spRolCRUD (
  pAccion INT,
  pIdRol INT,
  pDescrip VARCHAR(45)
)
BEGIN
  CASE  
    WHEN pAccion = 1 THEN 
      INSERT INTO ROL (Descrip)
      VALUES (pDescrip);
    WHEN pAccion = 2 THEN 
      SELECT IdRol,
             Descrip
      FROM ROL
      ORDER BY IdRol;
    WHEN pAccion = 3 THEN 
      UPDATE ROL
      SET Descrip = pDescrip
		  WHERE IdRol = pIdRol;
    WHEN pAccion = 4 THEN 
      DELETE 
      FROM ROL
      WHERE IdRol = pIdRol;
  END CASE;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE spTelefonoCRUD (
  pAccion INT,
  pIdTelefono INT,
  pIdCliente INT,
  pNumero VARCHAR(45),
  pIdTipoTelefono INT
)
BEGIN
  CASE  
    WHEN pAccion = 1 THEN 
      INSERT INTO TELEFONO (IdCliente, Numero, IdTipoTelefono)
      VALUES (pIdCliente, pNumero, pIdTipoTelefono);
    WHEN pAccion = 2 THEN 
      SELECT TEL.IdTelefono,
			       TEL.IdCliente,
             CONCAT(CLI.Nombre, " ", CLI.APaterno, " ", CLI.AMaterno) AS Cliente,
             TEL.Numero,
             TEL.IdTipoTelefono,
			       TIPTEL.Descrip AS TipoTelefono
      FROM TELEFONO AS TEL
      INNER JOIN CLIENTE AS CLI ON TEL.IdCliente = CLI.IdCliente
      INNER JOIN TIPOTELEFONO AS TIPTEL ON TEL.IdTipoTelefono = TIPTEL.IdTipoTelefono
      ORDER BY TEL.IdTelefono;
    WHEN pAccion = 3 THEN 
      UPDATE TELEFONO
      SET IdCliente = pIdCliente,
          Numero = pNumero,
          IdTipoTelefono = pIdTipoTelefono
		  WHERE IdTelefono = pIdTelefono;
    WHEN pAccion = 4 THEN 
      DELETE 
      FROM TELEFONO
      WHERE IdTelefono = pIdTelefono;
  END CASE;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE spTipoCorreoCRUD (
  pAccion INT,
  pIdTipoCorreo INT,
  pDescrip VARCHAR(45)
)
BEGIN
  CASE  
      WHEN pAccion = 1 THEN 
      INSERT INTO TIPOCORREO (Descrip)
      VALUES (pDescrip);
    WHEN pAccion = 2 THEN 
      SELECT IdTipoCorreo,
             Descrip
      FROM TIPOCORREO
      ORDER BY IdTipoCorreo;
    WHEN pAccion = 3 THEN 
      UPDATE TIPOCORREO
      SET Descrip = pDescrip
		  WHERE IdTipoCorreo = pIdTipoCorreo;
    WHEN pAccion = 4 THEN 
      DELETE 
      FROM TIPOCORREO
      WHERE IdTipoCorreo = pIdTipoCorreo;
  END CASE;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE spTipoHabitacionCRUD (
  pAccion INT,
  pIdTipoHabitacion INT,
  pDescrip VARCHAR(45),
  pPrecio DECIMAL(12,2),
  pCapacidad INT
)
BEGIN
  CASE  
    WHEN pAccion = 1 THEN 
      INSERT INTO TIPOHABITACION (Descrip, Precio, Capacidad)
      VALUES (pDescrip, pPrecio, pCapacidad);
    WHEN pAccion = 2 THEN 
      SELECT IdTipoHabitacion,
             Descrip,
             Precio,
             Capacidad
      FROM TIPOHABITACION
      ORDER BY IdTipoHabitacion;
    WHEN pAccion = 3 THEN 
      UPDATE TIPOHABITACION
      SET Descrip = pDescrip,
			    Precio = pPrecio,
			    Capacidad = pCapacidad
		  WHERE IdTipoHabitacion = pIdTipoHabitacion;
    WHEN pAccion = 4 THEN 
      DELETE 
      FROM TIPOHABITACION
      WHERE IdTipoHabitacion = pIdTipoHabitacion;
  END CASE;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE spTipoTelefonoCRUD (
  pAccion INT,
  pIdTipoTelefono INT,
  pDescrip VARCHAR(45)
)
BEGIN
  CASE  
    WHEN pAccion = 1 THEN 
      INSERT INTO TIPOTELEFONO (Descrip)
      VALUES (pDescrip);
    WHEN pAccion = 2 THEN 
      SELECT IdTipoTelefono,
             Descrip
      FROM TIPOTELEFONO
      ORDER BY IdTipoTelefono;
    WHEN pAccion = 3 THEN 
      UPDATE TIPOTELEFONO
      SET Descrip = pDescrip
		  WHERE IdTipoTelefono = pIdTipoTelefono;
    WHEN pAccion = 4 THEN 
      DELETE 
      FROM TIPOTELEFONO
      WHERE IdTipoTelefono = pIdTipoTelefono;
  END CASE;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE spUsuarioCRUD (
  pAccion INT,
  pIdUsuario INT,
  pUsuario VARCHAR(45),
  pContra VARCHAR(45),
  pNombre VARCHAR(50),
  pAPaterno VARCHAR(50),
  pAMaterno VARCHAR(50),
  pIdRol INT
)
BEGIN
  CASE  
    WHEN pAccion = 1 THEN 
      INSERT INTO USUARIO (Usuario, Contra, Nombre, APaterno, AMaterno, IdRol)
      VALUES (pUsuario, pContra, pNombre, pAPaterno, pAMaterno, pIdRol);
    WHEN pAccion = 2 THEN 
      SELECT USU.IdUsuario, 
             USU.Usuario, 
             USU.Contra,
             USU.Nombre, 
             USU.APaterno, 
             USU.AMaterno, 
             USU.IdRol, 
             ROL.Descrip AS Rol
      FROM USUARIO as USU
      INNER JOIN ROL as ROL on USU.IdRol = ROL.IdRol
      ORDER BY USU.IdUsuario;
    WHEN pAccion = 3 THEN 
      UPDATE USUARIO
      SET Usuario = pUsuario,
          Contra = pContra,
          Nombre = pNombre,
			    APaterno = pAPaterno,
          AMaterno = pAMaterno,
          IdRol = pIdRol
		  WHERE IdUsuario = pIdUsuario;
    WHEN pAccion = 4 THEN 
      DELETE 
      FROM USUARIO
      WHERE IdUsuario = pIdUsuario;
  END CASE;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE spVistaCRUD (
  pAccion INT,
  pIdVista INT,
  pDescrip VARCHAR(45)
)
BEGIN
  CASE  
    WHEN pAccion = 1 THEN 
      INSERT INTO VISTA (Descrip)
      VALUES (pDescrip);
    WHEN pAccion = 2 THEN 
      SELECT IdVista,
             Descrip
      FROM VISTA
      ORDER BY IdVista;
    WHEN pAccion = 3 THEN 
      UPDATE VISTA
      SET Descrip = pDescrip
		  WHERE IdVista = pIdVista;
    WHEN pAccion = 4 THEN 
      DELETE 
      FROM VISTA
      WHERE IdVista = pIdVista;
  END CASE;
END //

DELIMITER ;

