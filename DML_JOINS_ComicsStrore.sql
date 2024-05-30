--INSERTS QUE FALTARON EN COMICS COMPRAS
INSERT INTO Comic_Compras (cantidad, id_compra, id_comic) VALUES
(2,100, 26),
(1, 103, 40),
(1,	106, 30),
(1, 109, 16),
(1, 112, 34),
(1, 115, 32),
(1, 118, 20),
(2, 121, 22),
(4, 124, 28),
(3, 127, 38),
(2, 130, 20),
(1, 133, 14),
(1, 136, 14);



--INNER JOIN
Select c.id_compra, cl.nombre AS Cliente, c.fecha_compra, c.total FROM Compras c JOIN Clientes cl on c.id_cliente=cl.id_cliente
--LEFT JOIN
Select c.id_compra, cl.nombre AS Cliente, c.fecha_compra, c.total FROM Compras c LEFT JOIN Clientes cl on c.id_cliente=cl.id_cliente
--RIGHT JOIN
Select c.id_compra, cl.nombre AS Cliente, c.fecha_compra, c.total FROM Compras c RIGHT JOIN Clientes cl on c.id_cliente=cl.id_cliente
--FULL JOIN
Select * FROM Clientes cl FULL JOIN Compras c on cl.id_cliente=c.id_cliente
