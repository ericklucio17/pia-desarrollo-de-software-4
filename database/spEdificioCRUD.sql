USE HOTELES;

DELIMITER //

CREATE PROCEDURE spEdificioCRUD (
  pAccion INT,
  pIdEdificio INT,
  pDescrip VARCHAR(45),
  pNiveles VARCHAR(45)
)
BEGIN
  CASE  
    WHEN pAccion = 1 THEN 
      INSERT INTO EDIFICIO (Descrip, Niveles)
      VALUES (pDescrip, pNiveles);
    WHEN pAccion = 2 THEN 
      SELECT IdEdificio,
             Descrip,
             Niveles
      FROM EDIFICIO
      ORDER BY IdEdificio;
    WHEN pAccion = 3 THEN 
      UPDATE EDIFICIO
      SET Descrip = pDescrip,
          Niveles = pNiveles
		  WHERE IdEdificio = pIdEdificio;
    WHEN pAccion = 4 THEN 
      DELETE 
      FROM EDIFICIO
      WHERE IdEdificio = pIdEdificio;
  END CASE;
END //

DELIMITER ;

-- CALL spEdificioCRUD();