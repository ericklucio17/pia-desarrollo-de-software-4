USE HOTELES;

DELIMITER //

CREATE PROCEDURE spUsuarioCRUD (
  pAccion INT,
  pIdUsuario INT,
  pUsuario VARCHAR(45),
  pContra VARCHAR(45),
  pNombre VARCHAR(50),
  pAPaterno VARCHAR(50),
  pAMaterno VARCHAR(50),
  pIdRol INT
)
BEGIN
  CASE  
    WHEN pAccion = 1 THEN 
      INSERT INTO USUARIO (Usuario, Contra, Nombre, APaterno, AMaterno, IdRol)
      VALUES (pUsuario, pContra, pNombre, pAPaterno, pAMaterno, pIdRol);
    WHEN pAccion = 2 THEN 
      SELECT USU.IdUsuario, 
             USU.Usuario, 
             USU.Contra,
             USU.Nombre, 
             USU.APaterno, 
             USU.AMaterno, 
             USU.IdRol, 
             ROL.Descrip AS Rol
      FROM USUARIO as USU
      INNER JOIN ROL as ROL on USU.IdRol = ROL.IdRol
      ORDER BY USU.IdUsuario;
    WHEN pAccion = 3 THEN 
      UPDATE USUARIO
      SET Usuario = pUsuario,
          Contra = pContra,
          Nombre = pNombre,
			    APaterno = pAPaterno,
          AMaterno = pAMaterno,
          IdRol = pIdRol
		  WHERE IdUsuario = pIdUsuario;
    WHEN pAccion = 4 THEN 
      DELETE 
      FROM USUARIO
      WHERE IdUsuario = pIdUsuario;
  END CASE;
END //

DELIMITER ;

-- CALL spUsuarioCRUD();