USE HOTELES;

DELIMITER //

CREATE PROCEDURE spTelefonoCRUD (
  pAccion INT,
  pIdTelefono INT,
  pIdCliente INT,
  pNumero VARCHAR(45),
  pIdTipoTelefono INT
)
BEGIN
  CASE  
    WHEN pAccion = 1 THEN 
      INSERT INTO TELEFONO (IdCliente, Numero, IdTipoTelefono)
      VALUES (pIdCliente, pNumero, pIdTipoTelefono);
    WHEN pAccion = 2 THEN 
      SELECT TEL.IdTelefono,
			       TEL.IdCliente,
             CONCAT(CLI.Nombre, " ", CLI.APaterno, " ", CLI.AMaterno) AS Cliente,
             TEL.Numero,
             TEL.IdTipoTelefono,
			       TIPTEL.Descrip AS TipoTelefono
      FROM TELEFONO AS TEL
      INNER JOIN CLIENTE AS CLI ON TEL.IdCliente = CLI.IdCliente
      INNER JOIN TIPOTELEFONO AS TIPTEL ON TEL.IdTipoTelefono = TIPTEL.IdTipoTelefono
      ORDER BY TEL.IdTelefono;
    WHEN pAccion = 3 THEN 
      UPDATE TELEFONO
      SET IdCliente = pIdCliente,
          Numero = pNumero,
          IdTipoTelefono = pIdTipoTelefono
		  WHERE IdTelefono = pIdTelefono;
    WHEN pAccion = 4 THEN 
      DELETE 
      FROM TELEFONO
      WHERE IdTelefono = pIdTelefono;
  END CASE;
END //

DELIMITER ;

-- CALL spTelefonoCRUD();