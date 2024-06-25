--Explorar las propiedades de una base de datos
EXEC sp_helpdb
EXEC sp_helpdb  'ComicsStore'
--Explorar las propiedades de un objeto
EXEC sp_help 'Clientes'
--Explorar las llaves primarias de una tabla
EXEC sp_helpindex 'Clientes'
--Informacion de los procesos y usuarios actuales
EXEC sp_who
--Informacion sobre el rendimiento del servidor
EXEC sp_monitor
--Informacion sobre el espacio usado por la base de datos
EXEC sp_spaceused
--Informacion sobre el puerto de escucha del SQL server
EXEC sp_readerrorlog 0,1

--Procedimientos creados por nosotros
--Procedimiento para obtener el historial de un usuario
CREATE PROCEDURE sp_obtenerHistorial
@usuarioId INT 
AS 
BEGIN
	SELECT h.HistorialID, p.Titulo, h.FechaVisualizacion FROM HistorialVisualizacion h INNER JOIN Peliculas p 
	ON h.PeliculaID=p.PeliculaID WHERE h.UsuarioID=@usuarioId ORDER BY h.FechaVisualizacion DESC
END;

EXEC sp_obtenerHistorial 10

--SP para insertar peliculas
CREATE PROCEDURE sp_insertar_peliculas
@titulo nvarchar(100),
@genero nvarchar(50),
@fecha_estreno DATE
AS
BEGIN
	INSERT INTO Peliculas(Titulo, Genero, FechaEstreno) VALUES
	(@titulo, @genero, @fecha_estreno)
END;

EXEC sp_insertar_peliculas @titulo='Intensamente' ,@genero='Accion', @fecha_estreno='2024-06-13'