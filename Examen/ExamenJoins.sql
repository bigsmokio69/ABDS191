CREATE TABLE Autores(
id_autor bigint identity(300,1) PRIMARY KEY,
nombre VARCHAR(100),
pais_origen VARCHAR(100)
);

ALTER TABLE Comics ADD id_autor bigint, 
FOREIGN KEY (id_autor) REFERENCES Autores(id_autor);


INSERT INTO Autores (nombre, pais_origen) VALUES
('Greg Capullo', 'Estados Unidos'),
('Stan Lee', 'Estados Unidos'),
('Kentaro Miura', 'Japon'),
('Hirohiko Araki', 'Japon');

UPDATE Comics SET id_autor=300 WHERE id_comic=14;
UPDATE Comics SET id_autor=301 WHERE id_comic=16;
UPDATE Comics SET id_autor=302 WHERE id_comic=18;
UPDATE Comics SET id_autor=303 WHERE id_comic=20;
UPDATE Comics SET id_autor=300 WHERE id_comic=22;
UPDATE Comics SET id_autor=301 WHERE id_comic=24;
UPDATE Comics SET id_autor=302 WHERE id_comic=26;
UPDATE Comics SET id_autor=303 WHERE id_comic=28;
UPDATE Comics SET id_autor=300 WHERE id_comic=30;
UPDATE Comics SET id_autor=301 WHERE id_comic=32;
UPDATE Comics SET id_autor=302 WHERE id_comic=34;

--JOIN 1
SELECT Comics.nombre, a.pais_origen, a.nombre AS Autor, cc.cantidad FROM Comics LEFT JOIN Autores a ON Comics.id_autor=a.id_autor 
INNER JOIN Comic_Compras cc ON Comics.id_comic=cc.id_comic

--JOIN 2
SELECT a.nombre, c.nombre AS Comic, i.cantidad_disponible FROM Comics c LEFT JOIN  Autores a ON c.id_autor=a.id_autor INNER JOIN Inventario i ON 
c.id_comic=i.id_comic;
