CREATE PROCEDURE sp_transaccion1
@usuario int,
@fecha_inicio date,
@fecha_fin date,
@tipo nvarchar(50)
AS
BEGIN
	BEGIN TRANSACTION
	BEGIN TRY
		INSERT INTO Suscripciones(UsuarioID, FechaInicio, FechaFin, Tipo) VALUES
		(@usuario, @fecha_inicio, @fecha_fin, @tipo)
		UPDATE Usuarios SET FechaRegistro=@fecha_inicio WHERE UsuarioID=@usuario
	COMMIT
	END TRY
	
	BEGIN CATCH
	ROLLBACK
	DECLARE @MensajeError nvarchar(4000)
	SET @MensajeError=ERROR_MESSAGE()
	PRINT @MensajeError
	END CATCH;
END;

EXEC sp_transaccion1 @usuario=12, @fecha_inicio='2024-07-01', @fecha_fin='2024-11-01', @tipo='Cuatrimestral'