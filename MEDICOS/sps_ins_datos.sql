--Procedimiento para insertar pacientes
CREATE PROCEDURE sp_ins_paciente
@nom nvarchar(100),
@ap_m nvarchar(100),
@ap_p nvarchar(100),
@nacimiento date,
@direccion nvarchar(200),
@tel nvarchar(15),
@correo nvarchar(100),
@enfermedades nvarchar(200),
@alergias nvarchar(200),
@ant_fam nvarchar(200)
AS
BEGIN
	INSERT INTO Pacientes(nombre, apellido_paterno, apellido_materno, fecha_nacimiento, direccion, telefono, correo, enfermedades, alergias, antecedentes_fam) VALUES
	(@nom, @ap_m, @ap_p, @nacimiento, @direccion, @tel, @correo, @enfermedades, @alergias, @ant_fam)
END;

EXEC sp_ins_paciente 'Juan', 'Perez', 'Lopez', '1980-05-15', 'Calle Falsa 123', '4420401659', 'juan.perez@example.com', 'Diabetes', 'Penicilina', 'Padre: Hipertensi�n';
EXEC sp_ins_paciente 'Maria', 'Gomez', 'Sanchez', '1990-08-25', 'Avenida Siempreviva 742', '4427942066', 'maria.gomez@example.com', 'Asma', 'Ninguna', 'Madre: Asma';
EXEC sp_ins_paciente 'Carlos', 'Hernandez', 'Diaz', '1975-12-10', 'Boulevard Reforma 100', '4279219917', 'carlos.hernandez@example.com', 'Hipertensi�n', 'Polen', 'T�o: Diabetes';
EXEC sp_ins_paciente 'Ana', 'Martinez', 'Ramirez', '1985-03-30', 'Calle de la Amargura 50', '4424321524', 'ana.martinez@example.com', 'Colesterol alto', 'Frutos secos', 'Hermana: Hipertensi�n';
EXEC sp_ins_paciente 'Luis', 'Garcia', 'Torres', '1995-07-20', 'Camino Real 200', '4270740236', 'luis.garcia@example.com', 'Ninguna', 'Mariscos', 'Abuelo: C�ncer';
EXEC sp_ins_paciente 'Elena', 'Fernandez', 'Vega', '1982-02-14', 'Callej�n del Beso 7', '4417591432', 'elena.fernandez@example.com', 'Hipotiroidismo', 'L�cteos', 'Padre: Hipotiroidismo';
EXEC sp_ins_paciente 'Jorge', 'Lopez', 'Morales', '1978-11-05', 'Paseo de la Reforma 1234', '4428452049', 'jorge.lopez@example.com', 'Migra�a', 'Nueces', 'Madre: Migra�a';
EXEC sp_ins_paciente 'Lucia', 'Ruiz', 'Ortega', '1988-04-22', 'Plaza de la Constituci�n 1', '4270529427', 'lucia.ruiz@example.com', 'Gastritis', 'Gluten', 'Hermano: Gastritis';
EXEC sp_ins_paciente 'Miguel', 'Sanchez', 'Rios', '1992-09-15', 'Avenida de los Insurgentes 500', '427052324', 'miguel.sanchez@example.com', 'Hiperglucemia', 'Mariscos', 'Padre: Diabetes';
EXEC sp_ins_paciente 'Laura', 'Diaz', 'Mendoza', '1983-06-28', 'Calle de los Artesanos 25', '4270529324', 'laura.diaz@example.com', 'Hipertensi�n', 'Polvo', 'Madre: Hipertensi�n';


--Procedimiento para insertar medicos
CREATE PROCEDURE sp_ins_medico
@nom nvarchar(100),
@ap_m nvarchar(100),
@ap_p nvarchar(100),
@rfc nvarchar(30),
@tel nvarchar(15),
@correo nvarchar(100),
@cedula nvarchar(100),
@rol nvarchar(40)
AS
BEGIN
	INSERT INTO Medicos(nombre, ap_p, ap_m, rfc, tel, correo, cedula, rol) VALUES
	(@nom, @ap_p, @ap_m, @rfc, @tel, @correo, @cedula, @rol)
END;

EXEC sp_ins_medico 'Alejandro', 'Mendoza', 'Lopez', 'ALEM780505HDF', '4451236789', 'alejandro.mendoza@example.com', '1234567890', 'Administrador';
EXEC sp_ins_medico 'Beatriz', 'Ramos', 'Martinez', 'BEAR900825LDF', '4469871234', 'beatriz.ramos@example.com', '0987654321', 'Medico';
EXEC sp_ins_medico 'Carlos', 'Garcia', 'Hernandez', 'CARG751210CDF', '4476543210', 'carlos.garcia@example.com', '1122334455', 'Medico';
EXEC sp_ins_medico 'Diana', 'Fernandez', 'Gonzalez', 'DIAF850330CDF', '4483214567', 'diana.fernandez@example.com', '2233445566', 'Medico';
EXEC sp_ins_medico 'Eduardo', 'Martinez', 'Ruiz', 'EDUM950720LDF', '4491230987', 'eduardo.martinez@example.com', '3344556677', 'Medico';
EXEC sp_ins_medico 'Fernanda', 'Lopez', 'Mora', 'FERL820214HDF', '4412345678', 'fernanda.lopez@example.com', '4455667788', 'Medico';
EXEC sp_ins_medico 'Gerardo', 'Perez', 'Sanchez', 'GERP781105CDF', '4423456789', 'gerardo.perez@example.com', '5566778899', 'Administrador';
EXEC sp_ins_medico 'Hilda', 'Gomez', 'Torres', 'HILG880422LDF', '4434567890', 'hilda.gomez@example.com', '6677889900', 'Medico';
EXEC sp_ins_medico 'Ignacio', 'Diaz', 'Vega', 'IGND920915CDF', '4445678901', 'ignacio.diaz@example.com', '7788990011', 'Medico';
EXEC sp_ins_medico 'Juana', 'Santos', 'Ortega', 'JUAS830628LDF', '4456789012', 'juana.santos@example.com', '8899001122', 'Administrador';

--Procedimiento para insertar citas
CREATE PROCEDURE sp_ins_citas
@id_medico int,
@id_paciente int,
@fecha datetime
AS
BEGIN
	INSERT INTO Citas(medico_id, paciente_id, fecha_cita) VALUES
	(@id_medico, @id_paciente, @fecha)
END;

EXEC sp_ins_citas 5, 3, '2024-06-15 10:30:00';
EXEC sp_ins_citas 7, 2, '2024-07-20 14:00:00';
EXEC sp_ins_citas 2, 8, '2024-08-05 09:00:00';
EXEC sp_ins_citas 9, 1, '2024-06-25 16:00:00';
EXEC sp_ins_citas 4, 6, '2024-07-10 11:15:00';
EXEC sp_ins_citas 10, 7, '2024-08-15 08:45:00';
EXEC sp_ins_citas 3, 4, '2024-06-30 13:30:00';
EXEC sp_ins_citas 8, 5, '2024-07-25 15:00:00';
EXEC sp_ins_citas 6, 10, '2024-08-20 12:00:00';
EXEC sp_ins_citas 1, 9, '2024-07-05 10:00:00';

--Procedimiento para insertar diagnostico
CREATE PROCEDURE sp_ins_diagn
@sintomas nvarchar(200),
@tratamiento nvarchar(300),
@soli_estud nvarchar(200),
@id_paciente int
AS
BEGIN
	INSERT INTO Diagnosticos (sintomas, tratamiento, solicitud_estudios, id_paciente) VALUES
	(@sintomas, @tratamiento, @soli_estud, @id_paciente)
END;

EXEC sp_ins_diagn 'Dolor de cabeza y fiebre', 'Paracetamol 500mg cada 8 horas por 5 d�as', 'Ninguno', 4;
EXEC sp_ins_diagn 'Tos persistente y dolor en el pecho', 'Jarabe para la tos, reposo, y abundantes l�quidos', 'Ninguno', 1;
EXEC sp_ins_diagn 'Dolor abdominal y n�useas', 'Omeprazol 20mg una vez al d�a por 2 semanas', 'Ecograf�a abdominal', 7;
EXEC sp_ins_diagn 'Fiebre alta y dolor muscular', 'Ibuprofeno 400mg cada 6 horas', 'Ninguno', 9;
EXEC sp_ins_diagn 'Dificultad para respirar y sibilancias', 'Salbutamol inhalador 2 puff cada 4 horas', 'Prueba de funci�n pulmonar', 2;
EXEC sp_ins_diagn 'Dolor articular y rigidez', 'Diclofenaco 50mg dos veces al d�a', 'An�lisis de factor reumatoide', 5;
EXEC sp_ins_diagn 'Diarrea y deshidrataci�n', 'Rehidrataci�n oral y dieta blanda', 'Ninguno', 10;
EXEC sp_ins_diagn 'Mareos y visi�n borrosa', 'Betahistina 16mg tres veces al d�a', 'Examen de vista y an�lisis de sangre', 3;
EXEC sp_ins_diagn 'Erupci�n cut�nea y picaz�n', 'Crema antihistam�nica, evitar al�rgenos', 'Pruebas de alergia', 6;
EXEC sp_ins_diagn 'Falta de apetito y p�rdida de peso', 'Suplementos nutricionales y dieta balanceada', 'Endoscopia digestiva', 8;


--Procedimiento para insertar recetas
CREATE PROCEDURE sp_ins_recetas
@medicamentos nvarchar(200),
@id_medico int,
@id_paciente int
AS
BEGIN
	INSERT INTO Recetas (medicamentos, id_medico, id_paciente) VALUES
	(@medicamentos, @id_medico, @id_paciente)
END;

EXEC sp_ins_recetas 'Amoxicilina 500mg cada 8 horas por 7 d�as', 5, 3;
EXEC sp_ins_recetas 'Paracetamol 1g cada 6 horas seg�n necesidad', 7, 2;
EXEC sp_ins_recetas 'Loratadina 10mg una vez al d�a por 5 d�as', 2, 8;
EXEC sp_ins_recetas 'Ibuprofeno 400mg cada 6 horas por 3 d�as', 9, 1;
EXEC sp_ins_recetas 'Salbutamol inhalador 2 puff cada 4 horas', 4, 6;
EXEC sp_ins_recetas 'Diclofenaco gel aplicar en �rea afectada cada 8 horas', 10, 7;
EXEC sp_ins_recetas 'Omeprazol 20mg una vez al d�a antes del desayuno por 4 semanas', 3, 4;
EXEC sp_ins_recetas 'Dexametasona 0.5mg una vez al d�a por 3 d�as', 8, 5;
EXEC sp_ins_recetas 'Metronidazol 500mg cada 12 horas por 7 d�as', 6, 10;
EXEC sp_ins_recetas 'Paracetamol 500mg cada 8 horas seg�n necesidad', 1, 9;


--Procedimiento para insertar hisorial medico
CREATE PROCEDURE sp_ins_hist_medico
@id_paciente int,
@fecha_reg datetime,
@edad_pac int,
@peso nvarchar(15),
@altura nvarchar(10),
@temp nvarchar(10),
@lpm nvarchar(10)
AS
BEGIN
	INSERT INTO Historial_medico(id_paciente ,fecha_registro, edad_paciente, peso, altura, temperatura, lpm) VALUES
	(@id_paciente, @fecha_reg, @edad_pac, @peso, @altura, @temp, @lpm)
END;

EXEC sp_ins_hist_medico 5, '2024-06-03 08:00:00', 40, '70 kg', '170 cm', '36.5�C', '80 lpm';
EXEC sp_ins_hist_medico 7, '2024-06-10 10:30:00', 55, '65 kg', '165 cm', '37.0�C', '75 lpm';
EXEC sp_ins_hist_medico 2, '2024-06-05 14:15:00', 30, '80 kg', '175 cm', '36.8�C', '78 lpm';
EXEC sp_ins_hist_medico 9, '2024-06-12 16:45:00', 25, '60 kg', '160 cm', '36.7�C', '82 lpm';
EXEC sp_ins_hist_medico 4, '2024-06-08 09:20:00', 45, '75 kg', '172 cm', '37.2�C', '85 lpm';
EXEC sp_ins_hist_medico 10, '2024-06-01 11:00:00', 65, '70 kg', '168 cm', '36.9�C', '79 lpm';
EXEC sp_ins_hist_medico 3, '2024-06-14 13:00:00', 35, '85 kg', '180 cm', '36.6�C', '77 lpm';
EXEC sp_ins_hist_medico 8, '2024-06-06 15:45:00', 50, '68 kg', '163 cm', '37.1�C', '81 lpm';
EXEC sp_ins_hist_medico 6, '2024-06-02 07:30:00', 60, '78 kg', '170 cm', '36.4�C', '76 lpm';
EXEC sp_ins_hist_medico 1, '2024-06-09 12:00:00', 20, '55 kg', '158 cm', '36.3�C', '83 lpm';
