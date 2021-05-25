USE HOTELES;

DELIMITER //

CREATE PROCEDURE spComboHabitacion()
BEGIN
  SELECT IdHabitacion, 
         Descrip
  FROM HABITACION
  GROUP BY Descrip;
END //

DELIMITER ;

-- CALL spComboHabitacion();