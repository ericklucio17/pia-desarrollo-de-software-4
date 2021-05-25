USE HOTELES;

DELIMITER //

CREATE PROCEDURE spComboReservacion()
BEGIN
  SELECT IdReservacion
  FROM RESERVACION
  ORDER BY IdReservacion;
END //

DELIMITER ;

-- CALL spComboReservacion();