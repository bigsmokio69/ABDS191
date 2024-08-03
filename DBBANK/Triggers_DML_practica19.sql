--PRIMER TRIGGER
CREATE TRIGGER tr_new_cliente
ON Clientes AFTER INSERT
AS
BEGIN
	print 'Se ha insertado un nuevo cliente'
END;

INSERT INTO Clientes (Nombre, Direccion, Telefono, Email) VALUES
('Godefroy Dorantes', 'Calle Velo brumoso', '4420938573', 'godrickthegolden@gmail.com');

--SEGUNDO TRIGGER
CREATE TRIGGER tr_elim_cliente
ON Clientes AFTER DELETE
AS
BEGIN
	print 'Se ha eliminado un nuevo cliente'
END;

DELETE FROM Clientes where ClienteID=4;

--TERCER TRIGGER
CREATE TRIGGER tr_val_cliente
ON Cuentas
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM INSERTED i
        LEFT JOIN Clientes c ON i.ClienteID = c.ClienteID
        WHERE c.ClienteID IS NULL
    )
    BEGIN
		print 'El cliente no existe '
    END
    ELSE
    BEGIN
        INSERT INTO Cuentas (ClienteID, TipoCuenta, Saldo, FechaApertura)
        SELECT ClienteID, TipoCuenta, Saldo, FechaApertura
        FROM INSERTED;
        PRINT 'Cuenta creada exitosamente.';
    END
END;

INSERT INTO Cuentas (ClienteID, TipoCuenta, Saldo, FechaApertura)
VALUES (10, 'Cheques', 50, '2024-08-02');

INSERT INTO Cuentas (ClienteID, TipoCuenta, Saldo, FechaApertura)
VALUES (5, 'Cheques', 50, '2024-08-02');


select * from PagosPrestamos
insert into Prestamos (ClienteID, Monto, TasaInteres, FechaInicio, FechaFin) VALUES
(5, 5000, 2.5, '2024-08-02', '2024-12-02')
--CUARTO TRIGGER
CREATE TRIGGER tr_validar_update_cuentas
ON Cuentas
INSTEAD OF UPDATE
AS
BEGIN
	IF EXISTS( SELECT 1 FROM inserted where Saldo<0)
	BEGIN
		print 'No se puede actualizar el saldo a un número negativo'
	END
	ELSE
	BEGIN
		UPDATE Cuentas SET Saldo=i.Saldo FROM inserted i WHERE Cuentas.CuentaID=i.CuentaID
		print 'Se actualizo la cuenta'
	END
END;
select * from Cuentas
UPDATE Cuentas SET Saldo=300 WHERE CuentaID=6

--QUINTO TRIGGER
CREATE TRIGGER tr_validar_elim_prestamo
ON Prestamos
INSTEAD OF DELETE 
AS
BEGIN
	IF EXISTS(
		SELECT 1 FROM deleted d INNER JOIN PagosPrestamos pp 
		ON d.PrestamoID=pp.PrestamoID
	)
	BEGIN
		print 'No se puede eliminar el prestamo porque no se ha acabado de pagar'
	END
	ELSE
	BEGIN
		DELETE FROM Prestamos WHERE PrestamoID IN (SELECT PrestamoID FROM deleted);
		print 'Se elimino el préstamo'
	END
END;

DELETE FROM Prestamos where PrestamoID=9
select * from Cuentas

--SEXTO TRIGGER
CREATE TABLE logClientes(
	LogId int identity(1,1) PRIMARY KEY,
	Operacion nvarchar(10),
	FechaHora DATETIME DEFAULT GETDATE()
);

CREATE TRIGGER tr_log_clientes
ON Clientes
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    -- Registrar la operación de inserción
    IF EXISTS (SELECT 1 FROM inserted) AND NOT EXISTS (SELECT 1 FROM deleted)
    BEGIN
        INSERT INTO logClientes (Operacion, FechaHora)
        VALUES ('INSERT', GETDATE());
    END

    -- Registrar la operación de actualización
    IF EXISTS (SELECT 1 FROM inserted) AND EXISTS (SELECT 1 FROM deleted)
    BEGIN
        INSERT INTO logClientes (Operacion, FechaHora)
        VALUES ('UPDATE', GETDATE());
    END

    -- Registrar la operación de eliminación
    IF NOT EXISTS (SELECT 1 FROM inserted) AND EXISTS (SELECT 1 FROM deleted)
    BEGIN
        INSERT INTO logClientes (Operacion, FechaHora)
        VALUES ('DELETE', GETDATE());
    END
END;


INSERT INTO Clientes (Nombre, Direccion, Telefono, Email) VALUES
('Renalla Caria', 'Lagos de Liurnia', '4523289094', 'rencar@gmail.com');

UPDATE Clientes SET Telefono='4239087473' WHERE ClienteID=6

DELETE FROM Clientes where ClienteID=6

SELECT * FROM logClientes