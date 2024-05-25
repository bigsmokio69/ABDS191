CREATE TABLE Clientes(
id_cliente bigint identity(1,1) PRIMARY KEY,
nombre varchar(100),
correo_electronico varchar(100),
pass varchar(32)
);

CREATE TABLE Compras(
id_compra  bigint identity(100,3) PRIMARY KEY,
id_cliente bigint,
fecha_compra date,
total decimal(10,2),
FOREIGN KEY(id_cliente) REFERENCES Clientes(id_cliente)
);

CREATE TABLE Comics(
id_comic bigint identity(10,2) PRIMARY KEY,
nombre varchar,
anio tinyint,
precio decimal
);

CREATE TABLE Inventario(
id_inventario bigint identity(200,1) PRIMARY KEY,
id_comic bigint,
cantidad_disponible int,
disponibilidad int
FOREIGN KEY(id_comic) REFERENCES Comics(id_comic)
);

CREATE TABLE Comic_Compras(
id_CC bigint identity(1000,2) PRIMARY KEY,
cantidad TINYINT,
id_compra bigint,
id_comic bigint,
FOREIGN KEY(id_compra) REFERENCES Compras(id_compra),
FOREIGN KEY(id_comic) REFERENCES Comics(id_comic),
);