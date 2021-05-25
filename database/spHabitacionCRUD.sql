USE HOTELES;

DELIMITER //

CREATE PROCEDURE spHabitacionCRUD (
  pAccion INT,
  pIdHabitacion INT,
  pDescrip VARCHAR(45),
  pNivel INT,
  pIdTipoHabitacion INT,
  pIdEdificio INT,
  pIdVista INT,
  pIdEstatus INT
)
BEGIN
  CASE  
    WHEN pAccion = 1 THEN 
      INSERT INTO HABITACION (Descrip, Nivel, IdTipoHabitacion, IdEdificio, IdVista, IdEstatus)
      VALUES (pDescrip, pNivel, pIdTipoHabitacion, pIdEdificio, pIdVista, pIdEstatus);
    WHEN pAccion = 2 THEN 
      SELECT HAB.IdHabitacion,
             HAB.Descrip,
             HAB.Nivel, 
             TIPHAB.Descrip AS TipoDeHabitacion, 
             EDI.Descrip AS Edificio,  
             VIS.Descrip AS Vista,
             EST.Descrip AS Estatus
      FROM HABITACION AS HAB
      INNER JOIN TIPOHABITACION AS TIPHAB ON HAB.IdTipoHabitacion = TIPHAB.IdTipoHabitacion
      INNER JOIN EDIFICIO AS EDI ON HAB.IdEdificio = EDI.IdEdificio
      INNER JOIN VISTA AS VIS ON HAB.IdVista = VIS.IdVista
      INNER JOIN ESTATUS AS EST ON HAB.IdEstatus = EST.IdEstatus
      ORDER BY HAB.IdHabitacion;
    WHEN pAccion = 3 THEN 
      UPDATE HABITACION
      SET Descrip = pDescrip,
          Nivel = pNivel,
          IdTipoHabitacion = pIdTipoHabitacion,
          IdEdificio = pIdEdificio,
          IdVista = pIdVista,
          IdEstatus = pIdEstatus
		  WHERE IdHabitacion = pIdHabitacion;
    WHEN pAccion = 4 THEN 
      DELETE 
      FROM HABITACION
      WHERE IdHabitacion = pIdHabitacion;
  END CASE;
END //

DELIMITER ;

-- CALL spHabitacionCRUD();