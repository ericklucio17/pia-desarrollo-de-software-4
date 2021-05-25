USE HOTELES;

DELIMITER //

CREATE PROCEDURE spComboTipoHabitacion()
BEGIN
  SELECT IdTipoHabitacion, 
         Descrip
  FROM TIPOHABITACION
  ORDER BY IdTipoHabitacion;
END //

DELIMITER ;

-- CALL spComboTipoHabitacion();