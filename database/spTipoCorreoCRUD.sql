USE HOTELES;

DELIMITER //

CREATE PROCEDURE spTipoCorreoCRUD (
  pAccion INT,
  pIdTipoCorreo INT,
  pDescrip VARCHAR(45)
)
BEGIN
  CASE  
      WHEN pAccion = 1 THEN 
      INSERT INTO TIPOCORREO (Descrip)
      VALUES (pDescrip);
    WHEN pAccion = 2 THEN 
      SELECT IdTipoCorreo,
             Descrip
      FROM TIPOCORREO
      ORDER BY IdTipoCorreo;
    WHEN pAccion = 3 THEN 
      UPDATE TIPOCORREO
      SET Descrip = pDescrip
		  WHERE IdTipoCorreo = pIdTipoCorreo;
    WHEN pAccion = 4 THEN 
      DELETE 
      FROM TIPOCORREO
      WHERE IdTipoCorreo = pIdTipoCorreo;
  END CASE;
END //

DELIMITER ;

-- CALL spTipoCorreoCRUD();