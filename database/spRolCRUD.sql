USE HOTELES;

DELIMITER //

CREATE PROCEDURE spRolCRUD (
  pAccion INT,
  pIdRol INT,
  pDescrip VARCHAR(45)
)
BEGIN
  CASE  
    WHEN pAccion = 1 THEN 
      INSERT INTO ROL (Descrip)
      VALUES (pDescrip);
    WHEN pAccion = 2 THEN 
      SELECT IdRol,
             Descrip
      FROM ROL
      ORDER BY IdRol;
    WHEN pAccion = 3 THEN 
      UPDATE ROL
      SET Descrip = pDescrip
		  WHERE IdRol = pIdRol;
    WHEN pAccion = 4 THEN 
      DELETE 
      FROM ROL
      WHERE IdRol = pIdRol;
  END CASE;
END //

DELIMITER ;

-- CALL spRolCRUD();