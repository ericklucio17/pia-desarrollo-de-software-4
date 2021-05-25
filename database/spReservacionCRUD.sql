USE HOTELES;

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

-- CALL spReservacionCRUD();