CREATE PROCEDURE sp_insert_usuario 
@nombre nvarchar(100),
@email nvarchar(100),
@passwd nvarchar(100),
@fecha DATE
AS
BEGIN 
	INSERT INTO Usuarios(Nombre, Email, Pass, FechaRegistro) VALUES
	(@nombre, @email, @passwd, @fecha)
END;

EXEC sp_insert_usuario @nombre='Marcelina Rosas', @email='marderosas23@gmail.com', @passwd='fl0risacuti$',
@fecha='2024-06-26'

CREATE PROCEDURE sp_edit_sus
@usuario_ID int,
@tipo nvarchar(50)
AS
BEGIN
	UPDATE Suscripciones SET Tipo=@tipo WHERE UsuarioID=@usuario_ID
END;

EXEC sp_edit_sus @usuario_ID=8, @tipo='Semestral'

CREATE PROCEDURE sp_elim_hv
@usuario_ID int,
@pelicula_ID int
AS 
BEGIN
	DELETE FROM HistorialVisualizacion WHERE UsuarioID=@usuario_ID AND PeliculaID=@pelicula_ID
END;

EXEC sp_elim_hv @usuario_ID=1, @pelicula_ID=1

CREATE PROCEDURE sp_usuarios_sus
@tipo nvarchar(50)
AS
BEGIN
	SELECT u.Nombre, u.Email, u.FechaRegistro, u.Pass, s.Tipo FROM Suscripciones s INNER JOIN 
	Usuarios u ON s.UsuarioID=u.UsuarioID WHERE s.Tipo=@tipo
END;

EXEC sp_usuarios_sus @tipo='Mensual'

CREATE PROCEDURE sp_genero_peli
@genero nvarchar(50)
AS 
BEGIN
	SELECT u.Nombre, p.Titulo, p.Genero FROM HistorialVisualizacion h INNER JOIN Peliculas p 
	ON p.PeliculaID=p.PeliculaID INNER JOIN 
	Usuarios u ON h.UsuarioID=u.UsuarioID WHERE p.Genero=@genero
END;