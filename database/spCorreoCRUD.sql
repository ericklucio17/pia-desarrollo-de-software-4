USE HOTELES;

DELIMITER //

CREATE PROCEDURE spCorreoCRUD (
  pAccion INT,
  pIdCorreo INT,
  pIdCliente INT,
  pCorreo VARCHAR(45),
  pIdTipoCorreo INT
)
BEGIN
  CASE  
    WHEN pAccion = 1 THEN 
      INSERT INTO CORREO (IdCliente, Correo, IdTipoCorreo)
      VALUES (pIdCliente, pCorreo, pIdTipoCorreo);
    WHEN pAccion = 2 THEN 
      SELECT COR.IdCorreo,
			       COR.IdCliente,
             CONCAT(CLI.Nombre, " ", CLI.APaterno, " ", CLI.AMaterno) AS Cliente,
             COR.Correo,
             COR.IdTipoCorreo,
			       TIPCOR.Descrip AS TipoCorreo
      FROM CORREO AS COR
      INNER JOIN CLIENTE as CLI on COR.IdCliente = CLI.IdCliente
      INNER JOIN TIPOCORREO as TIPCOR on COR.IdTipoCorreo = TIPCOR.IdTipoCorreo
      ORDER BY COR.IdCorreo;
    WHEN pAccion = 3 THEN 
      UPDATE CORREO
      SET IdCliente = pIdCliente,
          Correo = pCorreo,
          IdTipoCorreo = pIdTipoCorreo
		  WHERE IdCorreo = pIdCorreo;
    WHEN pAccion = 4 THEN 
      DELETE 
      FROM CORREO
      WHERE IdCorreo = pIdCorreo;
  END CASE;
END //

DELIMITER ;

-- CALL spCorreoCRUD();