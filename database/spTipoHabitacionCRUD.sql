USE HOTELES;

DELIMITER //

CREATE PROCEDURE spTipoHabitacionCRUD (
  pAccion INT,
  pIdTipoHabitacion INT,
  pDescrip VARCHAR(45),
  pPrecio DECIMAL(12,2),
  pCapacidad INT
)
BEGIN
  CASE  
    WHEN pAccion = 1 THEN 
      INSERT INTO TIPOHABITACION (Descrip, Precio, Capacidad)
      VALUES (pDescrip, pPrecio, pCapacidad);
    WHEN pAccion = 2 THEN 
      SELECT IdTipoHabitacion,
             Descrip,
             Precio,
             Capacidad
      FROM TIPOHABITACION
      ORDER BY IdTipoHabitacion;
    WHEN pAccion = 3 THEN 
      UPDATE TIPOHABITACION
      SET Descrip = pDescrip,
			    Precio = pPrecio,
			    Capacidad = pCapacidad
		  WHERE IdTipoHabitacion = pIdTipoHabitacion;
    WHEN pAccion = 4 THEN 
      DELETE 
      FROM TIPOHABITACION
      WHERE IdTipoHabitacion = pIdTipoHabitacion;
  END CASE;
END //

DELIMITER ;

-- CALL spTipoHabitacionCRUD();

