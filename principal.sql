-- creamos las tablas
CREATE TABLE HOSPITALES (
    direccion VARCHAR(80),
    correo_e VARCHAR(60),
    telefono VARCHAR(20),
nombre VARCHAR(50),
PRIMARY KEY (nombre)
);
CREATE TABLE PERSONAL (
dni INT UNSIGNED,
nombre VARCHAR(50),
apellidos VARCHAR(50),
direccion VARCHAR(50),
telefono VARCHAR(20),
hospital_nombre VARCHAR(50) NOT NULL,
PRIMARY KEY (dni),
FOREIGN KEY (hospital_nombre) REFERENCES HOSPITALES (nombre)
);
CREATE TABLE ADMINISTRATIVO (
    dni INT UNSIGNED,
    cargo VARCHAR(20),
    PRIMARY KEY (dni),
    FOREIGN KEY (dni) REFERENCES PERSONAL (dni)
);
CREATE TABLE SANITARIO (
dni INT UNSIGNED,
PRIMARY KEY (dni),
FOREIGN KEY (dni) REFERENCES PERSONAL (dni)
);
CREATE TABLE ENFERMEROS(
    antiguedad TINYINT UNSIGNED,
    dni INT UNSIGNED,
    PRIMARY KEY (dni),
    FOREIGN KEY (dni) REFERENCES SANITARIO(dni)
);
CREATE TABLE MEDICOS (
    dni INT UNSIGNED,
    especialidad VARCHAR(30),
PRIMARY KEY (dni),
    FOREIGN KEY (dni) REFERENCES SANITARIO (dni)
);
CREATE TABLE OBRAS_SOCIALES (
    nombre VARCHAR(30),
    PRIMARY KEY (nombre)
);
CREATE TABLE PACIENTES (
    dni INT UNSIGNED,
    nombre_y_apellido VARCHAR(70),
    sexo VARCHAR(1),
    fecha_nacimiento DATE,
obra_social_nombre VARCHAR(30),
    edad TINYINT UNSIGNED,
    PRIMARY KEY (dni),
    FOREIGN KEY (obra_social_nombre) REFERENCES OBRAS_SOCIALES (nombre)
);  
CREATE TABLE acuden_a (
    hospital_nombre VARCHAR (50),
    paciente_dni INT UNSIGNED,
    PRIMARY KEY (hospital_nombre, paciente_dni),
    FOREIGN KEY (hospital_nombre) REFERENCES HOSPITALES (nombre),
    FOREIGN KEY (paciente_dni) REFERENCES PACIENTES (dni)
);
CREATE TABLE afiliados_a (
    obra_social_nombre VARCHAR(30),
    paciente_dni INT UNSIGNED,
    codigo_afiliado SMALLINT UNSIGNED,
    PRIMARY KEY (paciente_dni, obra_social_nombre),
    FOREIGN KEY (obra_social_nombre) REFERENCES OBRAS_SOCIALES (nombre)
ON DELETE CASCADE
ON UPDATE CASCADE,
    FOREIGN KEY (paciente_dni) REFERENCES PACIENTES (dni)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
CREATE TABLE SALAS (
    numero SMALLINT UNSIGNED,
    hospital_nombre VARCHAR(50) NOT NULL,
camas TINYINT UNSIGNED,
    PRIMARY KEY (numero, hospital_nombre),
    FOREIGN KEY (hospital_nombre) REFERENCES HOSPITALES (nombre)
ON DELETE CASCADE
ON UPDATE CASCADE
);
CREATE TABLE ENFERMEDADES (
    nombre VARCHAR(50),
    PRIMARY KEY (nombre)
);
CREATE TABLE INTERNACIONES (
    id INT UNSIGNED AUTO_INCREMENT,
    alta BOOLEAN,
    sala_asignada SMALLINT UNSIGNED,
    hospital_nombre VARCHAR(50),
    fecha DATE,
    paciente_dni INT UNSIGNED,
    PRIMARY KEY (id),
    FOREIGN KEY (sala_asignada, hospital_nombre) REFERENCES SALAS (numero, hospital_nombre),
    FOREIGN KEY (paciente_dni) REFERENCES PACIENTES (dni)
);
CREATE TABLE TRATAMIENTOS (
    id INT UNSIGNED AUTO_INCREMENT,
    descripcion VARCHAR(150),
    medico_dni INT,
    enfermedad_nombre VARCHAR(50),
    internacion_id INT UNSIGNED,
    PRIMARY KEY (id),
    FOREIGN KEY (medico_dni) REFERENCES MEDICOS (dni),
    FOREIGN KEY (enfermedad_nombre) REFERENCES ENFERMEDADES (nombre),
    FOREIGN KEY (internacion_id) REFERENCES INTERNACIONES (id)
);
CREATE TABLE RESULTADOS (
    fecha DATE,
    hora TIME,
    comentario VARCHAR(250),
    tratamiento_id INT UNSIGNED,
    PRIMARY KEY (tratamiento_id, fecha, hora),
FOREIGN KEY (tratamiento_id) REFERENCES TRATAMIENTOS (id)
ON DELETE CASCADE
);
--agregamos campo SUELDO
ALTER TABLE PERSONAL ADD COLUMN sueldo DECIMAL(10,2) AFTER telefono;




SOURCE /home/ubuntu/hospitales/hospitales-data.sql;
SOURCE /home/ubuntu/hospitales/personal-data.sql;
LOAD DATA LOCAL INFILE '/home/ubuntu/hospitales/personal-data.csv'
INTO TABLE PERSONAL
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
SOURCE /home/ubuntu/hospitales/administrativo-data.sql;
SOURCE /home/ubuntu/hospitales/sanitario-data-p1.sql;
SOURCE /home/ubuntu/hospitales/sanitario-data-p2.sql;
SOURCE /home/ubuntu/hospitales/medicos-data-p1.sql;
SOURCE /home/ubuntu/hospitales/medicos-data-p2.sql;
SOURCE /home/ubuntu/hospitales/enfermeros-data.sql;
SOURCE /home/ubuntu/hospitales/obrassociales-data.sql;
SOURCE /home/ubuntu/hospitales/pacientes-data.sql;
SOURCE /home/ubuntu/hospitales/enfermedades-data.sql;
