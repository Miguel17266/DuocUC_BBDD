CREATE TABLE REGION (
    id_region NUMBER(5) NOT NULL,
    nombre VARCHAR2(50) NOT NULL,
    CONSTRAINT PK_REGION PRIMARY KEY(id_region)
);
CREATE TABLE CIUDAD (
    id_ciudad NUMBER(5) NOT NULL, 
    nombre VARCHAR2(50) NOT NULL,
    id_region NUMBER(5) NOT NULL,
    CONSTRAINT PK_CIUDAD PRIMARY KEY(id_ciudad),
    CONSTRAINT FK_REGION_CIUDAD FOREIGN KEY(id_region) REFERENCES REGION(id_region)
);
CREATE TABLE COMUNA (
    id_comuna NUMBER(5) NOT NULL,
    nomcomuna VARCHAR2 (100) NOT NULL,
    id_ciudad NUMBER(5) NOT NULL,
    CONSTRAINT PK_COMUNA PRIMARY KEY (id_comuna),
    CONSTRAINT FK_COMUNA_CIUDAD FOREIGN KEY (id_ciudad) REFERENCES CIUDAD(id_ciudad)
);
CREATE TABLE EMPRESA (
    id_empresa NUMBER(5) NOT NULL,  
    nombre VARCHAR2(50) NOT NULL,
    id_comuna NUMBER(5) NOT NULL, 
    CONSTRAINT PK_EMPRESA PRIMARY KEY (id_empresa),
    CONSTRAINT FK_EMPRESA_COMUNA FOREIGN KEY(id_comuna) REFERENCES COMUNA(id_comuna)
);
CREATE TABLE EMPLEADO (
    id_empleado NUMBER(5) NOT NULL, 
    rut_empleado NUMBER(10) NOT NULL,
    nombre VARCHAR2(50) NOT NULL,
    telefono NUMBER(9) NOT NULL,
    sueldo NUMBER(10) NOT NULL,
    id_empresa NUMBER(5) NOT NULL,  
    CONSTRAINT PK_EMPLEADO PRIMARY KEY (id_empleado),
    CONSTRAINT FK_EMPLEADO_EMPRESA FOREIGN KEY(id_empresa) REFERENCES EMPRESA(id_empresa)
);
--AGREGAR REGIONES
INSERT INTO REGION(id_region, nombre)
VALUES(5, 'Valparaiso');
INSERT INTO REGION(id_region, nombre)
VALUES(6, 'OHiggins');
INSERT INTO REGION(id_region, nombre)
VALUES(13, 'Metropolitana');

--AGREGAR CIUDADES
INSERT INTO CIUDAD (id_ciudad, nombre, id_region)
VALUES (1, 'Santiago', 13);
INSERT INTO CIUDAD (id_ciudad, nombre, id_region)
VALUES (2, 'Rancagua', 6);
INSERT INTO CIUDAD (id_ciudad, nombre, id_region)
VALUES (3, 'Valparaiso', 5);

--AGREGAR COMUNA
INSERT INTO COMUNA (id_comuna, nomcomuna, id_ciudad)
VALUES (1, 'Nunoa', 1);
INSERT INTO COMUNA (id_comuna, nomcomuna, id_ciudad)
VALUES (2, 'Machali', 2);
INSERT INTO COMUNA (id_comuna, nomcomuna, id_ciudad)
VALUES (3, 'Quilpue', 3);

--AGREGAR EMPRESA
INSERT INTO EMPRESA (id_empresa, nombre, id_comuna)
VALUES (1, 'Entel', 1);
INSERT INTO EMPRESA (id_empresa, nombre, id_comuna)
VALUES (2, 'Duoc', 1);
INSERT INTO EMPRESA (id_empresa, nombre, id_comuna)
VALUES (3, 'UNAB', 2);
INSERT INTO EMPRESA (id_empresa, nombre, id_comuna)
VALUES (4, 'Xiaomi', 2);
INSERT INTO EMPRESA (id_empresa, nombre, id_comuna)
VALUES (5, 'Amazon', 3);

--AGREGAR EMPLEADO
INSERT INTO EMPLEADO (id_empleado, rut_empleado, nombre, telefono, sueldo, id_empresa)
VALUES (1, 123456789, 'Juan Gomez', 431847268, 800000, 1);
INSERT INTO EMPLEADO (id_empleado, rut_empleado, nombre, telefono, sueldo, id_empresa)
VALUES (2, 234567890, 'Alvaro Salas', 928573649, 450000, 1);
INSERT INTO EMPLEADO (id_empleado, rut_empleado, nombre, telefono, sueldo, id_empresa)
VALUES (3, 345678901, 'Eduardo Carrasco', 294718250, 300000, 2);
INSERT INTO EMPLEADO (id_empleado, rut_empleado, nombre, telefono, sueldo, id_empresa)
VALUES (4, 456789012, 'Constanza Silva', 753908933, 600000, 2);
INSERT INTO EMPLEADO (id_empleado, rut_empleado, nombre, telefono, sueldo, id_empresa)
VALUES (5, 567890123, 'Javiera Tapia', 534097833, 850000, 3);
INSERT INTO EMPLEADO (id_empleado, rut_empleado, nombre, telefono, sueldo, id_empresa)
VALUES (6, 678901234, 'Loreto Sandoval', 435146573, 900000, 3);
INSERT INTO EMPLEADO (id_empleado, rut_empleado, nombre, telefono, sueldo, id_empresa)
VALUES (7, 789012345, 'Cecilia Tapia', 234587909, 540000, 4);
INSERT INTO EMPLEADO (id_empleado, rut_empleado, nombre, telefono, sueldo, id_empresa)
VALUES (8, 890123456, 'Nelson Trivino', 343589703, 230000, 4);
INSERT INTO EMPLEADO (id_empleado, rut_empleado, nombre, telefono, sueldo, id_empresa)
VALUES (9, 901234567, 'Nicolas Saveedra', 453098789, 780000, 5);
INSERT INTO EMPLEADO (id_empleado, rut_empleado, nombre, telefono, sueldo, id_empresa)
VALUES (10, 11234567, 'Julio Prado', 345089734, 423000, 5);

--CONSULTAS--
--1. CONSULTA EMPLEADOS QUE GANAN MAS DE 500.000
SELECT nombre, sueldo FROM EMPLEADO WHERE sueldo > 500000;
--2. CONSULTA EMPRESAS
SELECT NOMBRE FROM EMPRESA;
--3. CONSULTA CIUDADES IGUALES A SANTIAGO
SELECT 'Santiago' FROM CIUDAD WHERE NOMBRE = 'Santiago';
