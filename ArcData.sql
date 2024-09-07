En este apartado se genera la base de datos completa, se genera la creacion de la base de datos completa de ArcData.


CREATE DATABASE ArcData;
USE ArcData;

-- Crear las tablas según tu definición
CREATE TABLE IF NOT EXISTS EPS
(
  Id_Eps INT NOT NULL UNIQUE,
  Nit_Eps VARCHAR(10) NOT NULL,
  Nombre_Eps VARCHAR(30),
  Direccion_Eps VARCHAR(40),
  Correo_Eps VARCHAR(100),
  PRIMARY KEY (Id_Eps)
);

CREATE TABLE IF NOT EXISTS PACIENTE
(
  Id_Paciente INT NOT NULL UNIQUE,
  Numero_Documento_Paciente VARCHAR(10) NOT NULL UNIQUE,
  Nombre_Paciente VARCHAR(25),
  Apellido_Paciente VARCHAR(25),
  Correo_Paciente VARCHAR(100),
  Direccion_Paciente VARCHAR(100),
  Fecha_Nacimiento_Paciente VARCHAR(10),
  Id_Eps_Fk INT,
  PRIMARY KEY (Id_Paciente),
  FOREIGN KEY (Id_Eps_Fk) REFERENCES EPS(Id_Eps)
);

CREATE TABLE IF NOT EXISTS HISTORIAL_CLINICO
(
  Id_Hclinico INT NOT NULL UNIQUE,
  Id_Paciente_Fk INT NOT NULL,
  Id_Eps_Fk INT NOT NULL,
  Observaciones VARCHAR(500),
  Img BLOB,
  PRIMARY KEY (Id_Hclinico),
  FOREIGN KEY (Id_Paciente_Fk) REFERENCES PACIENTE(Id_Paciente),
  FOREIGN KEY (Id_Eps_Fk) REFERENCES EPS(Id_Eps)
);

CREATE TABLE IF NOT EXISTS DOCTOR
(
  Id_Doctor INT NOT NULL UNIQUE,
  Id_Especialidad_Fk INT,
  Id_Eps_Fk INT,
  Numero_Documento_Doctor VARCHAR(10) UNIQUE,
  Nombre_Doctor VARCHAR(25),
  Apellido_Doctor VARCHAR(25),
  Correo_Doctor VARCHAR(100),
  Direccion_Doctor VARCHAR(100),
  Fecha_Nacimiento_Doctor VARCHAR(10),
  PRIMARY KEY (Id_Doctor),
  FOREIGN KEY (Id_Especialidad_Fk) REFERENCES ESPECIALIDAD(Id_Especialidad),
  FOREIGN KEY (Id_Eps_Fk) REFERENCES EPS(Id_Eps)
);

CREATE TABLE IF NOT EXISTS CITA
(
  Id_cita INT NOT NULL UNIQUE,
  Id_Paciente_Fk INT NOT NULL,
  Id_Doctor_Fk INT NOT NULL,
  Observaciones VARCHAR(500),
  Ordenes_Medicas VARCHAR(200),
  PRIMARY KEY (Id_cita),
  FOREIGN KEY (Id_Paciente_Fk) REFERENCES PACIENTE(Id_Paciente),
  FOREIGN KEY (Id_Doctor_Fk) REFERENCES DOCTOR(Id_Doctor)
);

