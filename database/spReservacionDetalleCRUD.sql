USE HOTELES;

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

-- CALL spReservacionDetalleCRUD();

CALL spReservacionDetalleCRUD(2, null, null, null, null, null);