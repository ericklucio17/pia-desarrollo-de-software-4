USE HOTELES;

DELIMITER //

CREATE PROCEDURE spComboEstatus()
BEGIN
  SELECT IdEstatus, 
         Descrip
  FROM ESTATUS
  ORDER BY IdEstatus;
END //

DELIMITER ;

-- CALL spComboEstatus();