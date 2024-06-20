INSERT INTO Usuarios(Nombre, Email, Pass) VALUES
('Juan Pérez', 'juan.perez@example.com', 'password1'),
('María García', 'maria.garcia@example.com', 'password2'),
('Pedro López', 'pedro.lopez@example.com', 'password3'),
('Ana González', 'ana.gonzalez@example.com', 'password4'),
('Roberto Ramírez', 'roberto.ramirez@example.com', 'password5'),
('Laura Martínez', 'laura.martinez@example.com', 'password6'),
('Carlos Sandoval', 'carlos.sandoval@example.com', 'password7'),
('Diana Flores', 'diana.flores@example.com', 'password8'),
('Alejandro Moreno', 'alejandro.moreno@example.com', 'password9'),
('Patricia Hernández', 'patricia.hernandez@example.com', 'password10');

INSERT INTO Peliculas(Titulo, Genero, FechaEstreno) VALUES
('El Padrino', 'Drama', '1972-03-24'),
('Pulp Fiction', 'Crimen, Drama', '1994-09-23'),
('El silencio de los corderos', 'Crimen, Drama, Thriller', '1991-02-14'),
('Jurassic Park','Ciencia ficción','1993-06-01'),
('Quiero comerme tu pancreas','Romance','2018-09-01'),
('Parasite','Thriller','2019-10-18'),
('500 days of Summer','Romance','2009-10-30'),
('Eternal Sunshine of a spotless mind','Romance','2004-07-23'),
('Whiplash','Drama, Música','2014-01-16'),
('El tiempo contigo','Romance','2024-04-10'),
('Jurassic World ','Ciencia ficción','2015-06-10');

INSERT INTO Suscripciones(UsuarioID, FechaInicio, FechaFin, Tipo) VALUES
(10,'2024-06-19','2024-07-19','Mensual'),
(7, '2024-06-19', NULL, NULL),
(2, '2024-06-19', '2024-12-19', 'Semestral'),
(5, '2024-07-01', '2025-07-01', 'Anual'),
(4, '2024-07-10', NULL, NULL),
(8, '2024-08-01', '2024-09-01', 'Mensual'),
(1, '2024-10-20', '2025-10-20', 'Anual');

INSERT INTO HistorialVisualizacion(UsuarioID, PeliculaID, FechaVisualizacion) VALUES
(10, 10,'2024-06-19 23:30:00'),
(10, 4, '2024-06-20 03:30:00'),
(1, 1, '2024-06-19 10:30:00'),
(1, 5, '2024-06-20 21:00:00'),
(2, 3, '2024-07-12 18:00:00'),
(2, 10, '2024-06-20 14:00:00'),
(3, 2, '2024-06-30 16:00:00'),
(3, 8, '2024-06-19 20:00:00'),
(4, 1, '2024-07-14 12:00:00'),
(4, 6, '2024-07-17 19:30:00'),
(5, 9, '2024-07-11 11:00:00'),
(5, 4, '2024-07-20 10:00:00'),
(6, 7, '2024-06-21 15:00:00'),
(6, 11, '2024-06-19 22:00:00'),
(7, 3, '2024-06-19 14:00:00'),
(7, 2, '2024-06-19 17:00:00'),
(8, 6, '2024-08-12 10:00:00'),
(8, 1, '2024-08-19 18:00:00'),
(9, 5, '2024-07-14 13:00:00'),
(9, 9, '2024-06-30 11:30:00');

