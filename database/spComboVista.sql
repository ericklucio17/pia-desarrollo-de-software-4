USE HOTELES;

DELIMITER //

CREATE PROCEDURE spComboVista()
BEGIN
  SELECT IdVista, 
         Descrip
  FROM VISTA
  ORDER BY IdVista;
END //

DELIMITER ;

-- CALL spComboVista();