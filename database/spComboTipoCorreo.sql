USE HOTELES;

DELIMITER //

CREATE PROCEDURE spComboTipoCorreo()
BEGIN
  SELECT IdTipoCorreo, 
         Descrip
  FROM TIPOCORREO
  ORDER BY IdTipoCorreo;
END //

DELIMITER ;

-- CALL spComboTipoCorreo();