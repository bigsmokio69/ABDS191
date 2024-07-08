CREATE VIEW view_usr_pers_asoc AS
SELECT p.nombre, u.nombre AS usuario, a.nombre AS asociacion, a.correo AS Correo_asociacion FROM usuario u INNER JOIN persona p 
ON u.id_persona=p.id_persona INNER JOIN 
asociacion a ON u.id_asociacion=a.id_asociacion