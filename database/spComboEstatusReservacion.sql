USE HOTELES;

DELIMITER //

CREATE PROCEDURE spComboEstatusReservacion()
BEGIN
  SELECT IdEstatusReservacion, 
         Descrip
  FROM ESTATUSRESERVACION
  ORDER BY IdEstatusReservacion;
END //

DELIMITER ;

-- CALL spComboEstatusReservacion();