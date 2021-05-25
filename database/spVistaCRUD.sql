USE HOTELES;

DELIMITER //

CREATE PROCEDURE spVistaCRUD (
  pAccion INT,
  pIdVista INT,
  pDescrip VARCHAR(45)
)
BEGIN
  CASE  
    WHEN pAccion = 1 THEN 
      INSERT INTO VISTA (Descrip)
      VALUES (pDescrip);
    WHEN pAccion = 2 THEN 
      SELECT IdVista,
             Descrip
      FROM VISTA
      ORDER BY IdVista;
    WHEN pAccion = 3 THEN 
      UPDATE VISTA
      SET Descrip = pDescrip
		  WHERE IdVista = pIdVista;
    WHEN pAccion = 4 THEN 
      DELETE 
      FROM VISTA
      WHERE IdVista = pIdVista;
  END CASE;
END //

DELIMITER ;

-- CALL spVistaCRUD();