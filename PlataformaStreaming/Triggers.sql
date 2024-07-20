CREATE TRIGGER tr_tabla_creada
ON DATABASE
AFTER CREATE_TABLE
AS
BEGIN
	print'Se creo una tabla';
END;

CREATE TABLE anime(
	id int IDENTITY(1,1) PRIMARY KEY,
	nombre nvarchar(50)
);

CREATE TRIGGER tr_tabla_dropeada
ON DATABASE
AFTER DROP_TABLE
AS
BEGIN
	print'Se borro una tabla';
END;

CREATE TRIGGER tr_aft_ins_peli
ON Peliculas
AFTER INSERT
AS
BEGIN
	PRINT 'Se inserto un registro'
END;

EXEC sp_insertar_peliculas '300', 'Accion', '2007-09-12'

CREATE TRIGGER tr_inst_up_hist
ON HistorialVisualizacion
INSTEAD OF INSERT
AS
BEGIN
	PRINT 'NO Se inserto un registro'
END;

INSERT INTO HistorialVisualizacion(UsuarioID, PeliculaID) VALUES
(10, 4)

SELECT * FROM HistorialVisualizacion
