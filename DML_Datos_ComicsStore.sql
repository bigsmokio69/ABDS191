INSERT INTO Clientes (nombre, correo_electronico, pass) VALUES 
('Thiago Almada', 'thiago20@gmail.com', 'THIAG0AT'),
('Radahn Jimenez', 'radanjim@gmail.com', 'radh4nISbest'),
('Diego Lainez', 'diegolai22@gmail.com', 'Diegol151990'),
('Mariana Torres', 'marianator12@gmail.com', 'Mariana198710'),
('Javier Hernández', 'javierhern07@gmail.com', 'Javier198305'),
('Camila Gómez', 'camilagom89@gmail.com', 'Camila199005'),
('Sebastián Luna', 'sebastianlun34@gmail.com', 'Sebastian199203'),
('Valeria Ruiz', 'valeriarui56@gmail.com', 'Valeria199509'),
('Rodrigo Goes', 'rodrigoes44@gmail.com', 'Rodrigo198706'),
('Gabriela Sánchez', 'gabriela.san99@gmail.com', 'Gabriela198412'),
('Carlos Mendoza', 'carlosmen65@gmail.com', 'Carlos199008'),
('Lucía Rojas', 'luciaroj74@gmail.com', 'Lucia199511');

ALTER TABLE Comics ALTER COLUMN nombre varchar(100);
ALTER TABLE Comics ALTER COLUMN anio int;


INSERT INTO Comics (nombre, anio, precio) VALUES
('Spiderman entre los muertos', 2024, 549),
('Spider-Man: Homecoming', 2017, 150.00),
('Batman: The Killing Joke', 1988, 200.00),
('X-Men: Days of Future Past', 1981, 180.00),
('The Avengers: Infinity Gauntlet', 1991, 220.00),
('Superman: Red Son', 2003, 160.00),
('Berserk 41', 2021, 110),
('JoJos Bizarre Adventure: Steel Ball Run 1', 2004, 110),
('Captain America: Civil War', 2006, 210.00),
('Iron Man: Extremis', 2005, 185.00),
('Thor: God of Thunder', 2013, 195.00),
('Green Lantern: Rebirth', 2004, 170.00),
('Justice League: Origin', 2011, 200.00),
('Spawn: Origins Collection', 2009, 250.00),
('Spawn: Endgame', 2010, 240.00);

ALTER TABLE Inventario ALTER COLUMN disponibilidad BIT;

INSERT INTO Inventario (id_comic, cantidad_disponible, disponibilidad) VALUES
(14, 10, 1),
(16, 7, 1),
(18, 5, 1),
(20, 3, 1),
(22, 14, 1),
(24, 11, 1),
(26, 8, 1),
(28, 0, 0),
(30, 3, 1),
(32, 5, 1),
(34, 0, 0),
(36, 0, 0),
(38, 12, 1),
(40, 9, 1),
(42, 4, 1);


INSERT INTO Compras (id_cliente, fecha_compra, total) VALUES
(2, '2023-12-31', 220),
(5, '2024-01-15', 250),
(7, '2024-01-16', 210),
(9, '2024-01-18', 150),
(11, '2024-01-20', 195),
(1, '2024-01-25', 185),
(3, '2024-01-27', 180);

INSERT INTO Compras (id_cliente, fecha_compra, total) VALUES
(4, '2024-01-31',440),
(4, '2024-02-02',440),
(6, '2024-02-10', 600),
(6, '2024-02-15', 360),
(8, '2024-02-20', 549),
(8, '2024-02-21', 549);

