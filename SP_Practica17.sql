--PRIMER PROCEDIMIENTO INSERTAR UNA COMPRA
CREATE PROCEDURE sp_ins_compra
@cliente bigint,
@fecha date,
@total decimal(10,2)
AS
BEGIN
	BEGIN TRANSACTION
	BEGIN TRY
	INSERT INTO Compras(id_cliente, fecha_compra, total) VALUES
	(@cliente, @fecha, @total)
	COMMIT
	END TRY

	BEGIN CATCH
	ROLLBACK
	DECLARE @MensajeError nvarchar(4000)
	SET @MensajeError=ERROR_MESSAGE()
	PRINT @MensajeError
	END CATCH;
END;

EXEC sp_ins_compra @cliente=13, @fecha='2024-07-06', @total=657;
EXEC sp_ins_compra @cliente=14, @fecha='2024-07-07', @total=200;
EXEC sp_ins_compra @cliente=15, @fecha='2024-07-07', @total=480;

--SEGUNDO PROCEDIMIENTO EDITAR AUTOR EN LA TABLA COMICS
CREATE PROCEDURE sp_edit_aut_comics
@comicID bigint,
@autorID bigint
AS
BEGIN
	BEGIN TRANSACTION
	BEGIN TRY
	UPDATE Comics SET id_autor=@autorID WHERE id_comic=@comicID
	COMMIT
	END TRY

	BEGIN CATCH
	ROLLBACK
	DECLARE @MensajeError nvarchar(4000)
	SET @MensajeError=ERROR_MESSAGE()
	PRINT @MensajeError
	END CATCH;
END;

EXEC sp_edit_aut_comics @comicID=36, @autorID=10304;
EXEC sp_edit_aut_comics @comicID=38, @autorID=10304;
EXEC sp_edit_aut_comics @comicID=40, @autorID=10305;
EXEC sp_edit_aut_comics @comicID=42, @autorID=10305;

--TERCER PROCEDIMIENTO ELIMINAR UNA COMPRA

CREATE PROCEDURE sp_elim_compra
@compraID bigint
AS
BEGIN
	BEGIN TRANSACTION
	BEGIN TRY
	DELETE FROM Comic_Compras WHERE id_compra=@compraID
	DELETE FROM Compras WHERE id_compra=@compraID
	COMMIT
	END TRY

	BEGIN CATCH
	ROLLBACK
	DECLARE @MensajeError nvarchar(4000)
	SET @MensajeError=ERROR_MESSAGE()
	PRINT @MensajeError
	END CATCH;
END;

EXEC sp_elim_compra @compraID=136;
EXEC sp_elim_compra @compraID=139;
EXEC sp_elim_compra @compraID=145;

--CUARTO PROCEDIMIENTO MODIFICACION DE CANTIDAD EN INVENTARIO
CREATE PROCEDURE sp_edit_cantidadInv
@nueva_cant int,
@comic bigint
AS
BEGIN
	BEGIN TRANSACTION
	BEGIN TRY
	UPDATE Inventario SET cantidad_disponible=@nueva_cant WHERE id_comic=@comic
	IF @nueva_cant=0
		BEGIN
			UPDATE Inventario SET disponibilidad=0 WHERE id_comic=@comic
		END
	COMMIT
	END TRY
	
	BEGIN CATCH
	ROLLBACK
	DECLARE @MensajeError nvarchar(4000)
	SET @MensajeError=ERROR_MESSAGE()
	print @MensajeError
	END CATCH;
END;

EXEC sp_edit_cantidadInv @nueva_cant=7, @comic=26;
EXEC sp_edit_cantidadInv @nueva_cant=0, @comic=28;
EXEC sp_edit_cantidadInv @nueva_cant=0, @comic=30;

--QUINTO PROCEDIMIENTO INSERTAR EN Comics y Autores
CREATE PROCEDURE sp_ins_comics_autores
@nom_aut varchar(100),
@pais varchar(100),
@nom_com varchar(100),
@anio int,
@precio decimal(18,0)
AS
BEGIN
	BEGIN TRANSACTION
	BEGIN TRY
	INSERT INTO Autores (nombre, pais_origen) VALUES
	(@nom_aut, @pais);
	
	DECLARE @id_aut bigint
	SET @id_aut=SCOPE_IDENTITY();

	INSERT INTO Comics (nombre, anio, precio, id_autor) VALUES
	(@nom_com, @anio, @precio, @id_aut)
	COMMIT
	END TRY

	BEGIN CATCH
	ROLLBACK
	DECLARE @MensajeError nvarchar(4000)
	SET @MensajeError=ERROR_MESSAGE()
	print @MensajeError
	END CATCH;
END;


EXEC sp_ins_comics_autores @nom_aut='Takehiko Inoue', @pais='Japon', @nom_com='Vagabond', @anio='1998', @precio='200';
EXEC sp_ins_comics_autores @nom_aut='Margaret Atwood', @pais='Canada', @nom_com='The Handmaids Tale (Graphic Novel)', @anio='2019', @precio='350';
EXEC sp_ins_comics_autores @nom_aut='Art Spiegelman', @pais='Estados unidos', @nom_com='Maus: A Survivors Tale', @anio='1986', @precio='320';
