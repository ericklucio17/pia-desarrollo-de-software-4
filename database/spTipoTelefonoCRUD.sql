USE HOTELES;

DELIMITER //

CREATE PROCEDURE spTipoTelefonoCRUD (
  pAccion INT,
  pIdTipoTelefono INT,
  pDescrip VARCHAR(45)
)
BEGIN
  CASE  
    WHEN pAccion = 1 THEN 
      INSERT INTO TIPOTELEFONO (Descrip)
      VALUES (pDescrip);
    WHEN pAccion = 2 THEN 
      SELECT IdTipoTelefono,
             Descrip
      FROM TIPOTELEFONO
      ORDER BY IdTipoTelefono;
    WHEN pAccion = 3 THEN 
      UPDATE TIPOTELEFONO
      SET Descrip = pDescrip
		  WHERE IdTipoTelefono = pIdTipoTelefono;
    WHEN pAccion = 4 THEN 
      DELETE 
      FROM TIPOTELEFONO
      WHERE IdTipoTelefono = pIdTipoTelefono;
  END CASE;
END //

DELIMITER ;

-- CALL spTipoTelefonoCRUD();