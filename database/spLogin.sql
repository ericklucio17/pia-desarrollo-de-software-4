USE HOTELES;

DELIMITER //

CREATE PROCEDURE spLogin(
  pUsuario VARCHAR(45),
  pContra VARCHAR(45)
)
BEGIN
  SELECT IdUsuario, 
         Usuario,
         Contra, 
         Nombre, 
         APaterno, 
         AMaterno, 
         IdRol
  FROM USUARIO
  WHERE Usuario = pUsuario AND Contra = pContra;
END //

DELIMITER ;

-- CALL spLogin();