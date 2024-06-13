CREATE VIEW ComprasComic AS
SELECT cc.id_CC, cc.cantidad, com.nombre AS Comic, co.id_compra, co.fecha_compra, co.total
FROM Comic_Compras cc INNER JOIN Comics com ON cc.id_comic=com.id_comic INNER JOIN Compras co 
ON cc.id_compra=co.id_compra;