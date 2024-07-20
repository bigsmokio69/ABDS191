CREATE TRIGGER tr_creacion_tablas
ON DATABASE AFTER CREATE_TABLE
AS
BEGIN
	print 'Se ha creado una nueva tabla en DBBANK'
END;

CREATE TRIGGER tr_creacion_sp
ON DATABASE 
AFTER CREATE_PROCEDURE
AS
BEGIN
	print 'Se ha creado un nuevo procedimiento en DBBANK'
END;

CREATE TABLE Prestamos(
	PrestamoID INT IDENTITY(1,1) PRIMARY KEY,
	ClienteID int, 
	Monto Decimal(18,2),
	TasaInteres DECIMAL(5,2),
	FechaInicio DATE,
	FechaFin DATE
	FOREIGN KEY(ClienteID) References Clientes(ClienteID)
);

CREATE TABLE PagosPrestamos(
	PagoID INT IDENTITY(1,1) PRIMARY KEY,
	PrestamoID INT,
	MontoPagado DECIMAL(18,2),
	FechaPago DATE,
	FOREIGN KEY (PrestamoID) REFERENCES Prestamos(PrestamoID)
);

SELECT * FROM Clientes

INSERT INTO Prestamos(ClienteID, Monto, TasaInteres, FechaInicio, FechaFin) VALUES
(1, 10000, 3.5, '2024-07-19', '2025-07-19'),
(2, 30000, 4.2, '2024-07-19', '2026-07-19'),
(3, 5000, 1.5, '2024-07-19', '2024-12-31'),
(1, 3000, 2.5, '2024-07-23', '2025-03-14'),
(2, 90000, 1.1, '2024-07-19', '2028-07-19')

INSERT PagosPrestamos(PrestamoID, MontoPagado, FechaPago) VALUES
(1,1000, '2024-09-19'),
(2, 10000, '2024-12-20'),
(3,500, '2024-11-1'),
(4,200, '2024-09-17'),
(5,100, '2024-07-21')

CREATE PROCEDURE sp_crear_prestamo_y_pago
	@ClienteID int, 
	@Monto Decimal(18,2),
	@TasaInteres DECIMAL(5,2),
	@FechaInicio DATE,
	@FechaFin DATE,
	@MontoPagado DECIMAL(18,2),
	@FechaPago DATE
AS
BEGIN
	BEGIN TRANSACTION
	BEGIN TRY
		INSERT INTO Prestamos(ClienteID, Monto, TasaInteres, FechaInicio, FechaFin) VALUES
		(@ClienteID, @Monto, @TasaInteres, @FechaInicio, @FechaFin)

		DECLARE @PrestamoID int
		SET @PrestamoID=SCOPE_IDENTITY()

		INSERT INTO PagosPrestamos(PrestamoID, MontoPagado, FechaPago) VALUES
		(@PrestamoID, @MontoPagado, @FechaPago)
	COMMIT 
	END TRY

	BEGIN CATCH
	ROLLBACK
	Declare @MensajeError nvarchar(4000)
	SET @MensajeError=ERROR_MESSAGE()
	print @MensajeError
	END CATCH
END;

EXEC sp_crear_prestamo_y_pago 3, 25000, 2.5, '2024-09-01', '2026-09-01', 5000, '2024-09-01'
EXEC sp_crear_prestamo_y_pago 1, 50000, 10.5, '2024-07-01', '2025-12-01', 10000, '2024-07-03'
EXEC sp_crear_prestamo_y_pago 2, 30000, 2, '2024-07-30', '2026-01-01', 7500, '2024-08-01'

CREATE PROCEDURE sp_datos_cliente_prestamo
AS
BEGIN
	SELECT c.ClienteID, pr.PrestamoID, pp.PagoID, c.Nombre, c.Telefono, c.Email, c.Direccion, 
	pr.Monto, pr.TasaInteres, pr.FechaInicio, pr.FechaFin, pp.PrestamoID, pp.MontoPagado, pp.FechaPago
	FROM Prestamos pr INNER JOIN Clientes c ON pr.ClienteID=c.ClienteID INNER JOIN PagosPrestamos pp
	ON pr.PrestamoID=pp.PrestamoID 
END;

EXEC sp_datos_cliente_prestamo

select * from PagosPrestamos
