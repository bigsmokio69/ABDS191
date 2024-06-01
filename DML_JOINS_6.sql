	--Query 1
	SELECT c.nombre, i.cantidad_disponible FROM Comics c INNER JOIN Inventario i ON c.id_comic=i.id_comic;
	--Query 2
	SELECT cl.nombre, com.id_compra, Comics.nombre, cc.cantidad FROM Compras com INNER JOIN Comic_Compras cc ON com.id_compra=cc.id_compra 
	INNER JOIN Clientes cl ON cl.id_cliente=com.id_cliente INNER JOIN Comics ON Comics.id_comic=cc.id_comic
	--QUERY 3
	SELECT com.id_compra, coms.nombre, i.cantidad_disponible FROM Compras com 
	FULL JOIN Comic_Compras cc ON com.id_compra=cc.id_compra FULL JOIN Inventario i ON cc.id_comic=i.id_comic FULL JOIN Comics coms ON I.id_comic=coms.id_comic

	--QUERY 4
	SELECT com.nombre, i.cantidad_disponible FROM Comics com INNER JOIN Inventario i ON com.id_comic=i.id_comic
	--QUERY 5
	SELECT * FROM Comics com INNER JOIN Inventario i ON com.id_comic=i.id_comic LEFT JOIN Comic_Compras cc ON com.id_comic=cc.id_comic
	--QUERY 6
	SELECT cl.nombre AS CLIENTE, com.id_compra AS COMPRA, Comics.nombre AS COMIC, cc.cantidad AS CANTIDAD, i.cantidad_disponible AS INVENTARIO
	FROM Compras com INNER JOIN Comic_Compras cc ON com.id_compra=cc.id_compra INNER JOIN Clientes cl ON com.id_cliente=cl.id_cliente 
	INNER JOIN Comics ON cc.id_comic=Comics.id_comic INNER JOIN Inventario i ON Comics.id_comic=i.id_comic