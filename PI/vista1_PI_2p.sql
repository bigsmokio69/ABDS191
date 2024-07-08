CREATE VIEW view_evento__localidad_cat  AS
SELECT e.id_evento, e.nombre AS Evento, l.direccion, c.nombre AS categoria FROM evento e INNER JOIN localidad l ON e.id_localidad=l.id_localidad
INNER JOIN categoria c ON e.id_categoria=c.id_categoria;

