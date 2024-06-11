CREATE VIEW VISTA_Clientes_Compras AS
SELECT cl.id_cliente, cl.nombre AS Cliente, cl.correo_electronico, cm.id_compra, cm.fecha_compra , cm.total
FROM Clientes cl LEFT JOIN Compras cm ON cl.id_cliente=cm.id_cliente;

SELECT * FROM VISTA_Clientes_Compras;