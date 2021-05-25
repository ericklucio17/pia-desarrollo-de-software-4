USE HOTELES;

DELIMITER //

CREATE PROCEDURE spComboRol()
BEGIN
  SELECT IdRol,
         Descrip
  FROM ROL
  ORDER BY IdRol;
END //

DELIMITER ;

-- CALL spComboRol();