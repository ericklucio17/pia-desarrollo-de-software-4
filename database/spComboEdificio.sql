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

-- CALL spComboEdificio();