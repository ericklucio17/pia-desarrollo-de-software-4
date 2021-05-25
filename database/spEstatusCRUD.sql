USE HOTELES;

DELIMITER //

CREATE PROCEDURE spEstatusCRUD (
  pAccion INT,
  pIdEstatus INT,
  pDescrip VARCHAR(45)
)
BEGIN
  CASE  
    WHEN pAccion = 1 THEN 
      INSERT INTO ESTATUS (Descrip)
      VALUES (pDescrip);
    WHEN pAccion = 2 THEN 
      SELECT IdEstatus,
             Descrip
      FROM ESTATUS
      ORDER BY IdEstatus;
    WHEN pAccion = 3 THEN 
      UPDATE ESTATUS
      SET Descrip = pDescrip
		  WHERE IdEstatus = pIdEstatus;
    WHEN pAccion = 4 THEN 
      DELETE 
      FROM ESTATUS
      WHERE IdEstatus = pIdEstatus;
  END CASE;
END //

DELIMITER ;

-- CALL spEstatusCRUD();