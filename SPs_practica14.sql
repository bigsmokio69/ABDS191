CREATE PROCEDURE sp_insert_autor
@nombre varchar(100),
@pais varchar(100)
AS
BEGIN
	INSERT INTO Autores (nombre, pais_origen) VALUES (@nombre, @pais);
END;

EXEC sp_insert_autor @nombre='Frank Miller', @pais='Estados Unidos';
EXEC sp_insert_autor @nombre='Neil Gaiman', @pais='Inglaterra';
EXEC sp_insert_autor @nombre='Alan Moore', @pais='Inglaterra';

CREATE PROCEDURE sp_insert_comic
@nombre varchar(100),
@year int,
@precio decimal (18,0),
@autor bigint
AS
BEGIN
	INSERT INTO Comics (nombre, anio, precio, id_autor) VALUES (@nombre, @year, @precio, @autor)
END;

EXEC sp_insert_comic @nombre='Batman: The Killing Joke', @year=2008, @precio=516.05, @autor=10303;
EXEC sp_insert_comic @nombre='Daredevil', @year=2010, @precio=656.52, @autor=10301;
EXEC sp_insert_comic @nombre='Marvel 1602', @year=2003, @precio=500.0, @autor=10302;

CREATE PROCEDURE sp_editar_inventario
@id_inv bigint,
@idcomic bigint,
@cantidad int,
@dispon bit
AS
BEGIN
	UPDATE Inventario SET id_comic=@idcomic, cantidad_disponible=@cantidad, disponibilidad=@dispon
	WHERE id_inventario=@id_inv
END;

EXEC sp_editar_inventario @id_inv=208, @idcomic=28, @cantidad=10, @dispon=1;
EXEC sp_editar_inventario @id_inv=211, @idcomic=34, @cantidad=7, @dispon=1;
EXEC sp_editar_inventario @id_inv=212, @idcomic=36, @cantidad=5, @dispon=1;

CREATE PROCEDURE sp_editar_clientes
@id_cliente bigint,
@nombre varchar(100),
@correo varchar(100),
@contra varchar(32)
AS
BEGIN
	UPDATE Clientes SET nombre=@nombre, correo_electronico=@correo, pass=@contra WHERE id_cliente=@id_cliente
END;

EXEC sp_editar_clientes @id_cliente=10, @nombre='Gabriela Sánchez', @correo='gabisan34@gmail.com', @contra='af3Fjfds4';
EXEC sp_editar_clientes @id_cliente=11, @nombre='Carlos Mendoza', @correo='carlos1men@gmail.com', @contra='fjGJ73SDl0';
EXEC sp_editar_clientes @id_cliente=12, @nombre='Lucero Rojo', @correo='rojo4luce@gmail.com', @contra='ChocoBollo4';

CREATE PROCEDURE sp_del_cc
@id_cc bigint
AS
BEGIN
	DELETE FROM Comic_Compras WHERE id_CC=@id_cc
END;

EXEC sp_del_cc @id_cc=1020;
EXEC sp_del_cc @id_cc=1022;
EXEC sp_del_cc @id_cc=1024;

CREATE PROCEDURE sp_del_inventario
@id_inv bigint
AS
BEGIN
	DELETE FROM Inventario WHERE id_inventario=@id_inv
END;

EXEC sp_del_inventario @id_inv=213;
EXEC sp_del_inventario @id_inv=214;
EXEC sp_del_inventario @id_inv=215;

--PROCEDIMIENTOS DE CONSULTA
CREATE PROCEDURE sp_consulta_comic_year
@anio int
AS
BEGIN
	SELECT c.id_comic, c.nombre, c.anio, i.cantidad_disponible ,a.nombre AS AUTOR FROM Comics c INNER JOIN Autores a ON 
	c.id_autor=a.id_autor INNER JOIN Inventario i ON c.id_comic=i.id_comic WHERE c.anio>@anio
	
END;

EXEC sp_consulta_comic_year @anio=2004
EXEC sp_consulta_comic_year @anio=1980
EXEC sp_consulta_comic_year @anio=2015

--SEGUNDO PROCEDIMIENTO

CREATE PROCEDURE sp_consulta_gastado_compra
@gastado decimal(10,2),
@longitud int
AS
BEGIN
	SELECT c.id_compra, c.id_cliente, cl.nombre, c.total, cl.pass FROM Compras c INNER JOIN Clientes cl ON 
	c.id_cliente=cl.id_cliente WHERE c.total<=@gastado AND LEN(cl.pass)>@longitud
END;

EXEC sp_consulta_gastado_compra @gastado=300, @longitud=10
EXEC sp_consulta_gastado_compra @gastado=500, @longitud=8
EXEC sp_consulta_gastado_compra @gastado=400, @longitud=12

--TERCER PROCEDIMIENTO

CREATE PROCEDURE sp_consulta_cliente_autor
@cantidad tinyint
AS
BEGIN
	SELECT co.id_compra, cc.cantidad, com.nombre AS Comic, cl.nombre AS Cliente, a.nombre AS Autor FROM Comic_Compras cc 
	INNER JOIN Compras co ON cc.id_compra=co.id_compra INNER JOIN Comics com ON cc.id_comic=com.id_comic INNER JOIN 
	Clientes cl ON co.id_cliente=cl.id_cliente INNER JOIN  Autores a ON com.id_autor=a.id_autor
	WHERE cc.cantidad<=@cantidad
END; 

EXEC sp_consulta_cliente_autor @cantidad=1
EXEC sp_consulta_cliente_autor @cantidad=2
EXEC sp_consulta_cliente_autor @cantidad=4