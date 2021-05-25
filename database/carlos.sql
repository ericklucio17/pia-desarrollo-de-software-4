

-- PROCEDIMIENTOS ALMACENADOS CARLOS

DELIMITER $$
#DROP PROCEDURE spCatalogos

CREATE PROCEDURE spCatalogos (
	_Accion INT
)
BEGIN
	CASE _Accion 
    WHEN 1 THEN
		SELECT * FROM ROL;
        
	 WHEN 2 THEN
		SELECT * FROM ESTATUSRESERVACION;
	
     WHEN 3 THEN
		SELECT * FROM ESTATUS;
	
     WHEN 4 THEN
		SELECT * FROM TIPOCORREO;
	
     WHEN 5 THEN
		SELECT * FROM TIPOHABITACION;
	
      WHEN 6 THEN
		SELECT * FROM EDIFICIO;
	
     WHEN 7 THEN
		SELECT * FROM VISTA;
	
    END CASE;
END$$

DELIMITER $$
#DROP PROCEDURE spUsuario
CREATE PROCEDURE spUsuario (
	_Accion INT(2),
	_IdUsuario INT(2),
	_Usuario VARCHAR(45),
    _Contra VARCHAR(45),
    _Nombre VARCHAR(50),
    _APaterno VARCHAR(50),
	_AMaterno VARCHAR(50),
    _IdRol INT(2)
)
BEGIN
	CASE _Accion
    WHEN 1 THEN
		SELECT U.IdUsuario, U.Usuario, U.Nombre, U.APaterno, U.AMaterno, R.IdRol, R.Descrip
        FROM USUARIO AS U
        INNER JOIN ROL AS R ON R.IdRol = U.IdRol
		WHERE ( U.Nombre LIKE CONCAT( '%', _Nombre , '%' ) OR _Nombre IS NULL ) AND
			  ( U.APaterno LIKE CONCAT('%',_APaterno,'%') OR _APaterno IS NULL) AND
			  ( U.APaterno LIKE CONCAT('%',_APaterno,'%') OR _APaterno IS NULL) AND
              ( U.Usuario LIKE CONCAT( '%' , _Usuario , '%') OR _Usuario IS NULL) AND
			  ( U.IdRol = _IdRol OR _IdRol IS NULL);
		
	WHEN 2 THEN
		INSERT INTO USUARIO ( Usuario, Contra, Nombre, APaterno, AMaterno, IdRol)
        VALUES ( _Usuario, _Contra, _Nombre, _APaterno, _AMaterno, _IdRol );
	
    WHEN 3 THEN 
		UPDATE USUARIO
        SET Nombre = _Nombre,
			APaterno = _APaterno,
            AMaterno = _AMaterno
		WHERE IdUsuario = _IdUsuario;

	WHEN 4 THEN 
		SELECT U.IdUsuario, U.Usuario, U.Nombre, U.APaterno, U.AMaterno, R.IdRol, R.Descrip
        FROM USUARIO U
        INNER JOIN ROL R ON R.IdRol = U.IdRol
		WHERE U.Usuario = _Usuario AND U.Contra = _Contra;
        
	WHEN 5 THEN 
		SELECT U.IdUsuario, U.Usuario, U.Nombre, U.APaterno, U.AMaterno, R.IdRol, R.Descrip
        FROM USUARIO U
        INNER JOIN ROL R ON R.IdRol = U.IdRol
		WHERE IdUsuario = _IdUsuario;
    
	END CASE;
END$$

#DROP PROCEDURE spCliente
DELIMITER $$
CREATE PROCEDURE spCliente (
	_Accion 		INT    (2),
	_IdCliente  	INT    (1),
    _Nombre     	VARCHAR(45),
    _APaterno   	VARCHAR(60),
    _AMaterno   	VARCHAR(60),
    _IdUsuario  	INT,
    _FecRegistro 	DATE
)
BEGIN
	CASE _Accion
    WHEN 1 THEN
		SELECT * FROM  CLIENTE
        WHERE ( Nombre LIKE CONCAT( '%', _Nombre,'%' ) OR _Nombre IS NULL ) AND
			  ( APaterno LIKE CONCAT('%', _APaterno, '%') OR _APaterno IS NULL) AND
			  ( AMaterno LIKE CONCAT( '%', _AMaterno,'%' ) OR _AMaterno IS NULL) AND
              ( IdUsuario LIKE CONCAT( '%', _IdUsuario, '%') OR _IdUsuario IS NULL);
        
	WHEN 2 THEN 
		SELECT * FROM  CLIENTE WHERE IdCliente = _IdCliente;
	
    WHEN 3 THEN 
		INSERT INTO CLIENTE (Nombre, APaterno, AMaterno, IdUsuario, FecRegistro)
		VALUES (_Nombre, _APaterno , _AMaterno, _IdUsuario, CURDATE());

	 WHEN 4 THEN 
		UPDATE CLIENTE
        SET Nombre = _Nombre, 
			APaterno = _APaterno, 
			AMaterno = _AMaterno, 
			IdUsuario = _IdUsuario
		WHERE IdUsuario = _IdUsuario;
		
	END CASE;
END$$

#DROP PROCEDURE spCorreos
DELIMITER $$
CREATE PROCEDURE spCorreos (
	_Accion     INT    (2),
	_IdCorreo   INT (2),
    _IdCliente  INT,
    _Correo     VARCHAR(45),
    _IdTipoCorreo INT
)
BEGIN
	CASE _Accion 
    WHEN 1 THEN
		SELECT * FROM CORREO WHERE IdCliente = _IdCliente;
	
    WHEN 2 THEN
		SELECT * FROM CORREO WHERE IdCorreo = _IdCorrelo;
        
	WHEN 3 THEN
		INSERT INTO TELEFONO (IdCliente, Correo, IdTipoCorreo)
		VALUES ( _IdCliente, _Correo, _IdTipoCorreo );
	
    WHEN 4 THEN
		UPDATE CORREO
        SET Correo = _Correo,
			IdTipoCorreo = _IdTipoCorreo
		WHERE IdCliente = _IdCliente;
    
	END CASE;
END$$

#DROP PROCEDURE spTelefonos
DELIMITER $$
CREATE PROCEDURE spTelefonos (
	_Accion     INT (2),
	_IdTelefono INT (2),
    _IdCliente INT,
    _Numero VARCHAR(45),
    _IdTipoTelefono INT(2)
)
BEGIN
	CASE _Accion 
    WHEN 1 THEN
		SELECT * FROM TELEFONO WHERE IdCliente = _IdCliente;
	
    WHEN 2 THEN
		SELECT * FROM CORREO WHERE IdTelefono = _IdTelefono;
        
	WHEN 3 THEN
		INSERT INTO TELEFONO (IdCliente, Numero, IdTipoTelefono)
		VALUES (_IdCliente, _Numero, _IdTipoTelefono);
	
    WHEN 4 THEN
		UPDATE TELEFONO
        SET Numero = _Numero,
			IdTipoTelefono = _IdTipoTelefono
		WHERE IdCliente = _IdCliente;
    
	END CASE;
END$$

#DROP PROCEDURE spReservacion
DELIMITER $$
CREATE PROCEDURE spReservacion(
	_Accion INT,
	_IdReservacion INT,
    _IdUsuario INT,
    _IdCliente INT,
    _IdHabitacion INT,
    _FecInicio DATE,
    _FecFin DATE,
    _Monto DECIMAL(12,2),
    _FecRegistro DATETIME,
    _IdEstatusReservacion INT
)
BEGIN
	CASE _Accion
    WHEN 1 THEN
		SELECT * FROM RESERVACION
        WHERE ( IdEstatusReservacion = _IdEstatusReservacion OR IS NULL) AND
			  ( FecRegistro = _FecRegistro OR IS _FecRegistro);
	
    WHEN 2 THEN
		SELECT * FROM RESERVACION WHERE IdReservacion = _IdReservacion;
        
	WHEN 3 THEN
		INSERT INTO RESERVACION (IdUsuario, IdCliente, IdHabitacion, FecInicio, FecFin, Monto, FecRegistro, IdEstatusReservacion)
		VALUES (_IdUsuario, _IdCliente, _IdHabitacion , _FecInicio, _FecFin , _Monto, CURDATE(), 1);
        
	WHEN 4 THEN
		UPDATE RESERVACION 
        SET FecInicio = _FecInicio,
			FecFin = _FecFin
        WHERE IdReservacion = _IdReservacion;
    
    WHEN 5 THEN
		UPDATE RESERVACION 
        SET IdEstatusReservacion = 2
        WHERE IdReservacion = _IdReservacion;
	
	END CASE;
END$$

#DROP PROCEDURE spReservaciondDetalle
DELIMITER $$
CREATE PROCEDURE spReservaciondDetalle(
	_Accion INT,
    _IdReservacionDetalle INT,
    _IdReservacion INT,
    _IdCliente INT,
    _FecIN DATETIME,
    _FecOUT DATETIME
) 
BEGIN
	CASE _Accion
    WHEN 1 THEN 
		SELECT * FROM RESERVACION_DETALLE WHERE IdReservacion = _IdReservacion;
	
    WHEN 2 THEN
		INSERT INTO RESERVACION_DETALLE 
        VALUES(_IdReservacion, _IdCliente, _IdCliente, _FecIN, _FecOUT);
	
    WHEN 3 THEN
		UPDATE RESERVACION_DETALLE
		SET FecIN = _FecIN,
			FecOUT = _FecOUT
		WHERE IdReservacionDetalle = _IdReservacionDetalle;
    
    END CASE;
END$$

#DROP PROCEDURE spHabitacion
DELIMITER $$
CREATE PROCEDURE spHabitacion(
	_Accion INT,
    _IdHabitacion INT,
	_Descrip VARCHAR (45),
	_Nivel INT,
	_IdTipoHabitacion INT,
	_IdEdificio INT,
	_IdVista INT,
	_IdEstatus INT
) 
BEGIN
	CASE _Accion
    WHEN 1 THEN
		SELECT H.IdHabitacion, H.Descrip, H.Nivel, E.Descrip AS "Edificio", TB.Descrip AS "Tipo Habitacion", TB.Precio, V.Descrip AS "Vista", ES.Descrip AS "Disponible"
        FROM HABITACION H
        INNER JOIN TIPOHABITACION TB ON H.IdTipoHabitacion = TB.IdTipoHabitacion
        INNER JOIN EDIFICIO E ON H.IdEdificio = E.IdEdificio
        INNER JOIN VISTA V ON H.IdVista = V.IdVista
		INNER JOIN ESTATUS ES ON H.IdEstatus = ES.IdEstatus
        WHERE ( IdEstatus =  _IdEstatus OR _IdEstatus IS NULL) AND
			  ( Nivel = _Nivel OR _Nivel IS NULL) AND 
              ( IdEdificio =  _IdEdificio OR _IdEdificio IS NULL) AND
              ( IdTipoHabitacion = _IdTipoHabitacion OR _IdTipoHabitacion IS NULL ) AND 
              ( IdVista  =  _IdVista OR _IdVista IS NULL );
              
		WHEN 2 THEN 
			SELECT H.IdHabitacion, H.Descrip, H.Nivel, E.Descrip AS "Edificio", TB.Descrip AS "Tipo Habitacion", TB.Precio, V.Descrip AS "Vista", ES.Descrip AS "Disponible"
			FROM HABITACION H
			INNER JOIN TIPOHABITACION TB ON H.IdTipoHabitacion = TB.IdTipoHabitacion
			INNER JOIN EDIFICIO E ON H.IdEdificio = E.IdEdificio
			INNER JOIN VISTA V ON H.IdVista = V.IdVista
			INNER JOIN ESTATUS ES ON H.IdEstatus = ES.IdEstatus
			WHERE IdHabitacion = _IdHabitacion;
            
		WHEN 3 THEN 
			INSERT INTO HABITACION (Descrip, Nivel, IdTipoHabitacion, IdEdificio, IdVista, IdEstatus)
			VALUES (_Descrip, _Nivel, _IdTipoHabitacion, _IdEdificio, _IdVista, 1);
            
		WHEN 4 THEN 
			UPDATE HABITACION
			SET Descrip = _Descrip,
				IdTipoHabitacion = _IdTipoHabitacion
			WHERE IdHabitacion = _IdHabitacion;
            
		WHEN 5 THEN 
			UPDATE HABITACION
			SET IdEstatus = _IdEstatus
			WHERE IdHabitacion = _IdHabitacion;
	END CASE;
END$$
