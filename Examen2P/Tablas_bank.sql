CREATE TABLE Clientes (
	ClienteID INT IDENTITY(1,1) PRIMARY KEY,
	Nombre NVARCHAR(100),
	Direccion NVARCHAR(200),
	Telefono NVARCHAR(15),
	Email NVARCHAR(100)
);

CREATE TABLE Cuentas (
	CuentaID INT IDENTITY(1,1) PRIMARY KEY,
	ClienteID INT,
	TipoCuenta NVARCHAR(50),
	Saldo DECIMAL(18, 2),
	FechaApertura DATE,
	FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

CREATE TABLE Transacciones (
	TransaccionID INT IDENTITY(1,1) PRIMARY KEY,
	CuentaID INT,
	TipoTransaccion NVARCHAR(50),
	Monto DECIMAL(18, 2),
	FechaTransaccion DATETIME,
	FOREIGN KEY (CuentaID) REFERENCES Cuentas(CuentaID)
);

CREATE TABLE Empleados (
	EmpleadoID INT IDENTITY(1,1) PRIMARY KEY,
	Nombre NVARCHAR(100),
	Posicion NVARCHAR(50),
	Departamento NVARCHAR(50),
	FechaContratacion DATE
);

INSERT INTO Clientes(Nombre, Direccion, Telefono, Email) VALUES
('Aaron Carranza Gomes', 'Calle sin nombre 12', '442345804', 'aaronc45@gmail.com'),
('Romeo Cazares Quintero', 'Bosques de San Juan', '4428374942', 'romeo34@gmail.com'),
('Ariel Loma Jimenez', 'Granjas del Valle', '4274567892', 'ariellj4@gmail.com')

INSERT INTO Cuentas(ClienteID, TipoCuenta, Saldo, FechaApertura) VALUES
(1, 'Debito', 13000, '2024-06-23'),
(2, 'Cheques', 7550, '2024-06-30'),
(3, 'Seguro', 7400000, '2024-07-10')

INSERT INTO Transacciones (CuentaID, TipoTransaccion, Monto, FechaTransaccion) VALUES
(2, 'Deposito', 4000, '2024-07-01 19:24:00'),
(3, 'Retiro', 1000, '2024-07-03 11:30:00'),
(3, 'Deposito', 30000, '2024-07-23 20:04:00')


INSERT INTO Empleados(Nombre, Posicion, Departamento, FechaContratacion) VALUES
('Felipe Azcarraga Perez', 'Gerente', 'Administracion', '2024-02-15'),
('Mateo Lopez Garza', 'Director de suscursal', 'Direccion', '2024-03-15'),
('Julian Ramirez Cruz', 'Cajero', 'Finanzas', '2024-05-10')


CREATE PROCEDURE sp_ins_empleado
@nombre nvarchar(100),
@posi nvarchar(50),
@depa nvarchar(50),
@fecha DATE
AS
BEGIN
	INSERT INTO Empleados(Nombre, Posicion, Departamento, FechaContratacion) VALUES
	(@nombre, @posi, @depa, @fecha)
END;

EXEC sp_ins_empleado 'Carlos Alcaraz Tena', 'Intendente', 'Mantenimiento', '2024-03-23';
EXEC sp_ins_empleado 'Radagon Cortes Alegria', 'Recepcionista', 'General', '2024-03-28';

SELECT * FROM Empleados


CREATE PROCEDURE sp_crear_cuenta
@cliente int,
@tipo_cuenta nvarchar(50),
@saldo DECIMAL(18,2),
@apertura DATE,
@tipo varchar(50),
@monto decimal(18,2),
@fecha datetime
AS 
BEGIN
	BEGIN TRANSACTION
	BEGIN TRY
	INSERT INTO Cuentas(ClienteID, TipoCuenta, Saldo, FechaApertura) VALUES
	(@cliente, @tipo_cuenta, @saldo, @apertura)

	DECLARE @cuenta int
	SET @cuenta=SCOPE_IDENTITY()

	INSERT INTO Transacciones(CuentaID,TipoTransaccion, Monto, FechaTransaccion) VALUES
	(@cuenta, @tipo, @monto, @fecha)

	UPDATE Cuentas SET Saldo=Saldo+@monto WHERE CuentaID=@cuenta
	COMMIT
	END TRY

	BEGIN CATCH
	ROLLBACK
	declare @MensajeError nvarchar(4000)
	SET @MensajeError=ERROR_MESSAGE()
	print @MensajeError
	END CATCH
END;
EXEC sp_crear_cuenta 1, 'Ahorro', 10000, '2024-07-10', 'Deposito', 1500, '2024-07-10 20:00:00'
EXEC sp_crear_cuenta 3, 'Debito', 0, '2024-07-10', 'Deposito', 1500, '2024-07-10 23:59:00'
SELECT * FROM Cuentas