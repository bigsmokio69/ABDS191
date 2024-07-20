CREATE TABLE Pacientes (
    id_paciente int IDENTITY PRIMARY KEY,
    nombre nvarchar(100) NOT NULL,
    apellido_paterno nvarchar(100) NOT NULL,
    apellido_materno nvarchar(100) NOT NULL, 
    fecha_nacimiento date,
    direccion nvarchar(200),
    telefono nvarchar(15),
    correo nvarchar(100),
    enfermedades nvarchar(200),
    alergias nvarchar(200),
    antecedentes_fam nvarchar(200)
);

CREATE TABLE Medicos(
    id_medico int NOT NULL PRIMARY KEY IDENTITY(1,1),
    nombre nvarchar(100),
    ap_p nvarchar(100),
    ap_m nvarchar(100),
    rfc nvarchar(30),
    tel nvarchar(15),
    correo nvarchar(100),
    cedula nvarchar(30),
    rol nvarchar(40)
);

CREATE TABLE Citas(
    id_citas int NOT NULL PRIMARY KEY IDENTITY (1,1),
    medico_id int,
    paciente_id int,
    fecha_cita datetime,
    FOREIGN KEY(paciente_id) REFERENCES Pacientes(id_paciente),
    FOREIGN KEY(medico_id) REFERENCES Medicos(id_medico)
);

CREATE TABLE Diagnosticos(
    id_diagnostico int IDENTITY PRIMARY KEY,
    sintomas nvarchar(200),
    tratamiento nvarchar(300),
    solicitud_estudios nvarchar(200),
    id_paciente int,
    FOREIGN KEY (id_paciente) REFERENCES Pacientes(id_paciente)
);

CREATE TABLE Recetas(
    id_receta int IDENTITY PRIMARY KEY,
    medicamentos nvarchar(200),
    id_medico int,
    id_paciente int,
    FOREIGN KEY (id_medico) REFERENCES Medicos(id_medico),
    FOREIGN KEY (id_paciente) REFERENCES Pacientes(id_paciente)
);

CREATE TABLE Historial_medico(
    id_historial int IDENTITY PRIMARY KEY,
    id_paciente int,
    fecha_registro datetime,
    edad_paciente int,
    peso nvarchar(10),
    altura nvarchar(10),
    temperatura nvarchar(10),
    lpm nvarchar(10),
    FOREIGN KEY (id_paciente) REFERENCES Pacientes(id_paciente)
);