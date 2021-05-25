USE HOTELES;

DELIMITER //

CREATE PROCEDURE spComboCliente()
BEGIN
  SELECT IdCliente, 
         CONCAT(Nombre, " ", APaterno, " ", AMaterno) AS NombreCompleto
  FROM CLIENTE
  ORDER BY IdCliente;
END //

DELIMITER ;

-- CALL spComboCliente();