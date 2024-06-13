
CREATE VIEW Vista_ComicsComprados AS 
SELECT com.id_cliente, cl.nombre, SUM(cc.cantidad) AS cantidad_comics_comprados FROM Compras com 
INNER JOIN Clientes cl ON com.id_cliente=cl.id_cliente 
INNER JOIN Comic_Compras cc ON com.id_compra=cc.id_compra GROUP BY com.id_cliente, cl.nombre