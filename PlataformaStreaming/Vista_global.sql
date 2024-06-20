CREATE VIEW vista_global AS 
SELECT u.UsuarioID, u.Nombre, u.Email, u.FechaRegistro, p.PeliculaID, p.Titulo, p.Genero, p.FechaEstreno, H.FechaVisualizacion, s.Tipo AS TipoSuscripcion, s.FechaInicio, s.FechaFin
FROM HistorialVisualizacion H FULL JOIN Usuarios u ON H.UsuarioID=u.UsuarioID FULL JOIN Peliculas p ON H.PeliculaID=p.PeliculaID 
FULL JOIN Suscripciones s ON u.UsuarioID=s.UsuarioID;