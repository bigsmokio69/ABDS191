--PRIMER EJERCICIO
CREATE PROCEDURE sp_ins_peli_hv_usuario
@titulo nvarchar(100),
@genero nvarchar(50),
@estreno date,
@usuario_id int
AS
BEGIN
	BEGIN TRANSACTION
	BEGIN TRY
	INSERT INTO Peliculas(Titulo, Genero, FechaEstreno) VALUES
	(@titulo, @genero, @estreno);
	
	DECLARE @peli_id INT;
    SET @peli_id= SCOPE_IDENTITY();
	
	INSERT INTO HistorialVisualizacion(UsuarioID, PeliculaID) VALUES
	(@usuario_id, @peli_id);

	COMMIT
	END TRY
	
	BEGIN CATCH
	ROLLBACK
	DECLARE @MensajeError nvarchar(4000)
	SET @MensajeError=ERROR_MESSAGE()
	PRINT @MensajeError
	END CATCH;
END;

EXEC sp_ins_peli_hv_usuario @titulo='Buscando a Nemo', @genero='infantil', @estreno='2003-07-04', @usuario_id=13;
EXEC sp_ins_peli_hv_usuario @titulo='La forma del agua', @genero='Ciencia ficción', @estreno='2017-12-01', @usuario_id=6;
EXEC sp_ins_peli_hv_usuario @titulo='Orgullo y prejuicio', @genero='Romance', @estreno='2006-02-10', @usuario_id=12;

--SEGUNDO EJERCICIO
CREATE PROCEDURE sp_ins_usuario_sus_hv
@nombre_u nvarchar(100),
@email nvarchar(100),
@pass nvarchar(100),
@fecha_reg date,
@fecha_fin date,
@tipo nvarchar(50),
@peli_id int
AS
BEGIN
	BEGIN TRANSACTION
	BEGIN TRY
	
	INSERT INTO Usuarios(Nombre, Email, Pass, FechaRegistro) VALUES
	(@nombre_u, @email, @pass, @fecha_reg);

	DECLARE @usr_id INT;
    SET @usr_id= SCOPE_IDENTITY();

	INSERT INTO Suscripciones(UsuarioID, FechaInicio, FechaFin, Tipo) VALUES
	(@usr_id, @fecha_reg, @fecha_fin, @tipo);

	INSERT INTO HistorialVisualizacion(UsuarioID, PeliculaID) VALUES
	(@usr_id, @peli_id);
	COMMIT
	END TRY
	
	BEGIN CATCH
	ROLLBACK
	DECLARE @MensajeError nvarchar(4000)
	SET @MensajeError=ERROR_MESSAGE()
	PRINT @MensajeError
	END CATCH;
END;

EXEC sp_ins_usuario_sus_hv @nombre_u='Gerardo Flores', @email='geraflor3@gmail.com', @pass='fsdfjq93', @fecha_reg='2024-07-03', 
@fecha_fin='2024-08-03', @tipo='Mensual', @peli_id=11

EXEC sp_ins_usuario_sus_hv @nombre_u='Nico Williams', @email='nicow3@gmail.com', @pass='fhjsUFjj4', @fecha_reg='2024-07-08', 
@fecha_fin='2024-08-04', @tipo='Mensual', @peli_id=14

EXEC sp_ins_usuario_sus_hv @nombre_u='German Pezzella', @email='pezzellager5@gmail.com', @pass='gsdfSAjee3', @fecha_reg='2024-07-08', 
@fecha_fin='2025-01-04', @tipo='Semestral', @peli_id=16

--TERCER EJERCICIO
CREATE PROCEDURE sp_updt_correo
@new_mail nvarchar(100),
@usr_id int,
@fecha_inicio date,
@fecha_fin date,
@tipo nvarchar(50)
AS
BEGIN
	BEGIN TRANSACTION
	BEGIN TRY
	UPDATE Usuarios SET Email=@new_mail WHERE UsuarioID=@usr_id;

	UPDATE Suscripciones SET FechaInicio=@fecha_inicio, FechaFin=@fecha_fin, Tipo=@tipo WHERE UsuarioID=@usr_id 
	COMMIT
	END TRY
	
	BEGIN CATCH
	ROLLBACK
	DECLARE @MensajeError nvarchar(4000)
	SET @MensajeError=ERROR_MESSAGE()
	PRINT @MensajeError
	END CATCH;
END;

EXEC sp_updt_correo @new_mail='flores4gera@gmail.com', @usr_id=14, @fecha_inicio='2024-07-03', @fecha_fin='2025-07-03',
@tipo='Anual';
EXEC sp_updt_correo @new_mail='dianafl9@gmail.com', @usr_id=9, @fecha_inicio='2024-07-03', @fecha_fin='2025-07-03',
@tipo='Anual';
EXEC sp_updt_correo @new_mail='carlosssand64@gmail.com', @usr_id=7, @fecha_inicio='2024-07-03', @fecha_fin='2025-07-03',
@tipo='Anual';

--CUARTO EJERCICIO
CREATE PROCEDURE sp_del_peli_hv
@peli int
AS
BEGIN
	BEGIN TRANSACTION
	BEGIN TRY
	DELETE FROM HistorialVisualizacion WHERE PeliculaID=@peli
	DELETE FROM Peliculas WHERE PeliculaID=@peli
	COMMIT
	END TRY
	
	BEGIN CATCH
	ROLLBACK
	DECLARE @MensajeError nvarchar(4000)
	SET @MensajeError=ERROR_MESSAGE()
	PRINT @MensajeError
	END CATCH;
END;

EXEC sp_del_peli_hv @peli=1;
EXEC sp_del_peli_hv @peli=2;
EXEC sp_del_peli_hv @peli=3;

--QUINTO EJERCICIO
CREATE PROCEDURE sp_del_sus_hv
@usr int
AS
BEGIN
	BEGIN TRANSACTION
	BEGIN TRY
	DELETE FROM Suscripciones WHERE UsuarioID=@usr
	DELETE FROM HistorialVisualizacion WHERE UsuarioID=@usr
	DELETE FROM Usuarios WHERE UsuarioID=@usr
	COMMIT
	END TRY
	
	BEGIN CATCH
	ROLLBACK
	DECLARE @MensajeError nvarchar(4000)
	SET @MensajeError=ERROR_MESSAGE()
	PRINT @MensajeError
	END CATCH;
END;

EXEC sp_del_sus_hv @usr=7;
EXEC sp_del_sus_hv @usr=8;
EXEC sp_del_sus_hv @usr=9;