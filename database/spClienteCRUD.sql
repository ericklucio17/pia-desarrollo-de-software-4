USE HOTELES;

DELIMITER //

CREATE PROCEDURE spClienteCRUD (
  pAccion INT,
  pIdCliente INT,
  pNombre VARCHAR(45),
  pAPaterno VARCHAR(60),
  pAMaterno VARCHAR(60),
  pIdUsuario INT,
  pFecRegistro DATE
)
BEGIN
  CASE  
    WHEN pAccion = 1 THEN 
      INSERT INTO CLIENTE (Nombre, APaterno, AMaterno, IdUsuario, FecRegistro)
      VALUES (pNombre, pAPaterno, pAMaterno, pIdUsuario, pFecRegistro);
    WHEN pAccion = 2 THEN 
      SELECT IdCliente,
             Nombre,
             APaterno,
             AMaterno,
             FecRegistro
      FROM CLIENTE
      ORDER BY IdCLiente;
    WHEN pAccion = 3 THEN 
      UPDATE CLIENTE
      SET Nombre = pNombre,
          APaterno = pAPaterno,
          AMaterno = pAMaterno,
	    WHERE IdCLiente = pIdCliente;
    WHEN pAccion = 4 THEN 
      DELETE 
      FROM CLIENTE
      WHERE IdCLiente = pIdCliente;
  END CASE;
END //

DELIMITER ;

-- CALL spClienteCRUD();