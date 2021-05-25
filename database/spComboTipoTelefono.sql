USE HOTELES;

DELIMITER //

CREATE PROCEDURE spComboTipoTelefono()
BEGIN
  SELECT IdTipoTelefono,
         Descrip
  FROM TIPOTELEFONO
  ORDER BY IdTipoTelefono;
END //

DELIMITER ;

-- CALL spComboTipoTelefono();