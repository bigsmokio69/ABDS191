--PRIMER PROCEDIMIENTO
CREATE PROCEDURE sp_ins_persona
@nom varchar(100),
@ap_p varchar(100),
@ap_m varchar(100),
@correo varchar(100),
@tel varchar(100)
AS
BEGIN
	INSERT INTO persona(nombre, apellido_p, apellido_m, correo, telefono) VALUES
	(@nom, @ap_p, @ap_m, @correo, @tel);
END;

EXEC sp_ins_persona @nom='Ferran', @ap_p='Torres', @ap_m='Mingueza', @correo='guido@gmail.com', @tel='442356436';
EXEC sp_ins_persona @nom='Alexis', @ap_p='Torrijos', @ap_m='Valdes', @correo='ale6torr@gmail.com', @tel='444994594';
EXEC sp_ins_persona @nom='Aitana', @ap_p='Bonmati', @ap_m='Dorantes', @correo='aitbon@gmail.com', @tel='426777546';

--SEGUNDO PROCIDIMIENTO
CREATE PROCEDURE sp_select_sponsors
@estat int
AS
BEGIN
	SELECT s.nombre, s.correo, s.telefono, a.nombre AS asociacion FROM sponsor s INNER JOIN asociacion a ON
	s.id_asociacion=a.id_asociacion WHERE s.estatus=@estat;
END;

EXEC sp_select_sponsors @estat=1
EXEC sp_select_sponsors @estat=0

--TERCER PROCEDIMIENTO INFO DE UNA DONACIÓN
CREATE PROCEDURE sp_select_donacion
@monto decimal(18,4)
AS
BEGIN
	SELECT d.id_donacion, p.nombre AS Nombre, p.apellido_p ,d.monto,cat.nombre AS Categoria, a.nombre AS Asociacion
	FROM donacion d INNER JOIN categoria cat ON d.id_categoria=cat.id_categoria INNER JOIN usuario u 
	ON d.id_usuario=u.id_usuario INNER JOIN asociacion a ON d.id_asociacion=a.id_asociacion INNER JOIN persona p
	ON u.id_persona=p.id_persona WHERE d.monto>=@monto;
END;

EXEC sp_select_donacion @monto=200
EXEC sp_select_donacion @monto=400
EXEC sp_select_donacion @monto=700



--CUARTO PROCEDIMIENTO EDITAR UN USUARIO
CREATE PROCEDURE sp_edit_usuario
@nom_usr varchar(50),
@contra varchar(50),
@tipo int,
@persona int,
@asoc int,
@id int
AS
BEGIN
	UPDATE usuario SET nombre=@nom_usr, contrasena=@contra, id_tipoUsuario=@tipo, id_persona=@persona,
	id_asociacion=@asoc WHERE id_usuario=@id
END;

EXEC sp_edit_usuario @nom_usr='Ferran7', @contra='12345678', @tipo=1101, @persona=905, @asoc=204, @id=1205
EXEC sp_edit_usuario @nom_usr='ALEX_X', @contra='GNUWSL53', @tipo=1100, @persona=906, @asoc=203, @id=1206
EXEC sp_edit_usuario @nom_usr='Aita', @contra='blnd0r33', @tipo=1101, @persona=907, @asoc=201, @id=1207
	
--QUINTO PROCEDIMIENTO BORRAR UNA Categoria y 
CREATE PROCEDURE sp_elim_cat
@idCat int
AS
BEGIN
	DELETE FROM donacion WHERE id_categoria=@idCat
	DELETE FROM evento WHERE id_categoria=@idCat
	DELETE FROM categoria WHERE id_categoria=@idCat
END

EXEC sp_elim_cat @idCat=311
EXEC sp_elim_cat @idCat=309
EXEC sp_elim_cat @idCat=301


