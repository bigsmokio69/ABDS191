CREATE VIEW vista_dona_usr_asoc AS
SELECT d.id_donacion, p.nombre, d.monto, a.nombre AS Asociacion, d.descripcion
FROM donacion d INNER JOIN usuario u ON d.id_usuario=u.id_usuario
INNER JOIN asociacion a ON d.id_asociacion=a.id_asociacion INNER JOIN 
persona p ON u.id_persona=p.id_persona