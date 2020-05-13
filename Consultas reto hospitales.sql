--CONSULTAS--
--1. Pacientes que ingresaron en el turno del doctor Antonio Jaén Hernández.--
--Select de la tabla--
SELECT * FROM Hospital.Ingresos
SELECT * FROM Hospital.Medicos
SELECT * FROM Hospital.Pacientes
--Acvidad 5--
SELECT P.Nombre, P.Apellidos
FROM Hospital.Pacientes AS P
JOIN Hospital.Ingresos AS I
ON P.Numero_de_Historial = I.Numero_de_Historial
JOIN Hospital.Medicos AS M
ON M.Codigo_Identificacion = I.Codigo_de_Identificacion
WHERE I.Codigo_de_Identificacion = 'AJH'

--2. Nombre de personas que estan en madrid
--Select --
SELECT * FROM Hospital.Pacientes
--Actividad --
SELECT Nombre
FROM Hospital.Pacientes
WHERE Poblacion = 'Madrid'

--3.  pacientes que ingresaron entre enero y mayo de 2009 y sufren alérgias.--
--Select --
SELECT * FROM Hospital.Ingresos
SELECT * FROM Hospital.Pacientes
--Actividad --
SELECT P.Nombre, P.Apellidos
FROM Hospital.Ingresos AS I
JOIN Hospital.Pacientes AS P
ON I.Numero_de_Historial = P.Numero_de_Historial
WHERE Fecha_de_Ingreso BETWEEN '01/01/2010' AND '28/02/2010' AND Alergico = 'True'

--4. médicos que autorizaron ingresos entre enero y febrero de 2010.--
--Select --
SELECT * FROM Hospital.Ingresos
SELECT * FROM Hospital.Medicos
--Actividad --
SELECT M.Nombre_del_Medico
FROM Hospital.Ingresos AS I
JOIN Hospital.Medicos AS M
ON I.Codigo_de_Identificacion = M.Codigo_Identificacion
WHERE I.Fecha_de_Ingreso BETWEEN '01/01/2010' AND '28/02/2010'



--5. Nombre y fecha de toma de cambio de pediatras.--
--Select--
SELECT * FROM Hospital.Medicos
--Actividad --
SELECT Nombre_del_Medico, Fecha_de_Ingreso
FROM Hospital.Medicos
WHERE Especialidad = 'Pediatria'
