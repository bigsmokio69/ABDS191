--PRIMER PROCEDIMIENTO CON TRANSACCIONES
CREATE PROCEDURE sp_ins_per_usr
@nom_per varchar(100),
@ap_p varchar(100),
@ap_m varchar(100),
@correo varchar(100),
@tel varchar(100),
@nom_usr varchar(50),
@contra varchar(50),
@tipo int,
@idAsoc int
AS
BEGIN
	BEGIN TRANSACTION
	BEGIN TRY
		INSERT INTO persona(nombre, apellido_p, apellido_m, correo, telefono) VALUES
		(@nom_per, @ap_p, @ap_m, @correo, @tel)

		DECLARE @idPer int
		SET @idPer= SCOPE_IDENTITY()

		INSERT INTO usuario(nombre, contrasena, id_tipoUsuario, id_persona, id_asociacion) VALUES
		(@nom_usr, @contra, @tipo, @idPer, @idAsoc)
	COMMIT
	END TRY

	BEGIN CATCH
	ROLLBACK
	DECLARE @MensajeError nvarchar(4000)
	SET @MensajeError=ERROR_MESSAGE()
	print @MensajeError
	END CATCH
END;

EXEC sp_ins_per_usr @nom_per='Maria', @ap_p='Cruz', @ap_m='Rodriguez', @correo='mar56rod@gmail.com', @tel='4425679523', @nom_usr='Mar Rodriguez', @contra='changeMe234',
@tipo=1101, @idAsoc=204

EXEC sp_ins_per_usr @nom_per='Juan', @ap_p='Ramirez', @ap_m='Gómez',@correo='juan.pg@hotmail.com', @tel='4441234567', @nom_usr='JuanPG', @contra='contra123', 
@tipo=1101, @idAsoc=203

EXEC sp_ins_per_usr @nom_per='Ana', @ap_p='Castorena', @ap_m='Morientes', @correo='analm@yahoo.com.mx', @tel='4477889900', @nom_usr='AnaLM', 
@contra='miClaveSecreta', @tipo=1101, @idAsoc=200

--SEGUNDO PROCEDIMIENTO CON TRANSACCION
CREATE PROCEDURE sp_editar
@nombre varchar(100),
@tel varchar(15),
@correo varchar(100),
@asoc int,
@estat int,
@id int
AS
BEGIN
	BEGIN TRANSACTION
	BEGIN TRY
	UPDATE sponsor SET nombre=@nombre, telefono=@tel, correo=@correo, id_asociacion=@asoc, estatus=@estat WHERE id_sponsor=@id
		SELECT *,(CASE 
		WHEN estatus=1 THEN 'Activo'
		WHEN estatus=0 THEN 'Inactivo'
		ELSE 'desconocido' END) AS indicador FROM sponsor
	COMMIT
	END TRY
	
	BEGIN CATCH
	ROLLBACK
	DECLARE @MensajeError nvarchar(4000)
	SET @MensajeError=ERROR_MESSAGE()
	print @MensajeError
	END CATCH
END;

EXEC sp_editar @nombre='Cemex', @tel='8183283000', @correo='contactocemex@cemex.com', @asoc=200, @estat=1, @id=1003
EXEC sp_editar @nombre='Danone', @tel='5552921096', @correo='contacto@danone.com', @asoc=204, @estat=0, @id=1002
EXEC sp_editar @nombre='Kelloggs', @tel='5554567890', @correo='contacto@kelloggs.com.mx', @asoc=203, @estat=4, @id=1004

--TERCER PROCEDIMIENTO CON TRANSACCION
CREATE PROCEDURE sp_elim_persona
@id_persona int
AS
BEGIN
	BEGIN TRANSACTION
	BEGIN TRY
	DECLARE @usr int
	SELECT @usr= usuario.id_usuario FROM usuario WHERE id_persona=@id_persona
	DELETE FROM donacion WHERE id_usuario=@usr
	DELETE FROM usuario WHERE id_persona=@id_persona
	DELETE FROM persona WHERE id_persona=@id_persona
	COMMIT
	END TRY

	BEGIN CATCH
	ROLLBACK
	Declare @MensajeError nvarchar(4000)
	SET @MensajeError=ERROR_MESSAGE()
	print @MensajeError
	END CATCH
END;

EXEC sp_elim_persona @id_persona=908
EXEC sp_elim_persona @id_persona=909
EXEC sp_elim_persona @id_persona=910