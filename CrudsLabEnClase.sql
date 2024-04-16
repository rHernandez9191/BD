USE LabEnClase1

------Proceso InsertarCiclo
CREATE OR ALTER PROCEDURE InsertarCiclo(
			@idCiclo int ,
			@año int,
			@numero int,
			@fechaInicio DATE,
			@FechaFinal DATE
			)
AS
BEGIN
	INSERT INTO TCiclo(
				idCiclo,
				año,
				numero,
				fechaInicio,
				fechaFinal
				)
VALUES(	
	@idCiclo, 
	@año, 
	@numero,
	@fechaInicio,
	@fechaFinal
)
END

------Proceso InsertarCarrera
CREATE OR ALTER PROCEDURE InsertarCarrera(
			@idCarrera int ,
			@nombre varchar(50),
			@titulo varchar(50),
			@ciclo int
			)
AS
BEGIN
	INSERT INTO TCarrera(
				idCarrera,
				nombre,
				titulo,
				ciclo
				)
VALUES(	
	@idCarrera, 
	@nombre, 
	@titulo,
	@ciclo
)
END

---------PROCESO INSERTAR CURSO---------
CREATE OR ALTER PROCEDURE InsertarCurso(
			@idCurso int,
			@nombre varchar(50),
			@creditos int,
			@horasSemanales int,
			@idCarrera int
			 )
AS
BEGIN
	INSERT INTO TCurso(
				idCurso,
				nombre,
				creditos,
				horasSemanales,
				idCarrera
				)
VALUES(	 
	@idCurso,
	@nombre, 
	@creditos,
	@horasSemanales,
	@idCarrera
	)
END

---- Proceso insertar usuario ------
CREATE OR ALTER PROCEDURE InsertarUsuario(
			@idUsuario int,
			@nombre varchar(50),
			@cedula int,
			@rol VARCHAR(50),
			@email varchar(50),
			@fechaNacimiento date,
			@telefono int
			 )
AS
BEGIN
	INSERT INTO TUsuarios(
				idusuario,
				nombre,
				cedula,
				rol,
				email,
				fechaNacimiento,
				telefono
				)
VALUES(	 
	@idUsuario,
	@nombre, 
	@cedula,
	@rol,
	@email,
	@fechaNacimiento,
	@telefono
	)
END
------------------Proceso InsertarProfesor--------------------
CREATE OR ALTER PROCEDURE InsertarProfesor(
			@idProfesor int,
			@idUsuario int
			)
AS
BEGIN
	INSERT INTO TProfesor(
				idProfesor,
				idUsuario
				)
VALUES(
		@idProfesor,
		@idUsuario
		)
END
-----------------Proceso insertarGrupo-----------
CREATE OR ALTER PROCEDURE InsertarGrupo(
			@idGrupo int,
			@horario VARCHAR(50),
			@numero int,
			@idCiclo int,
			@idCurso int,
			@idProfesor int
			)
AS
BEGIN
	INSERT INTO TGrupo(
				idGrupo,
				horario,
				numero,
				idCiclo,
				idCurso,
				idProfesor
				)
VALUES(
		@idGrupo,
		@horario,
		@numero,
		@idCiclo,
		@idCurso,
		@idProfesor
		)
END
----------Proceso insertar Alumno------------------
CREATE OR ALTER PROCEDURE InsertarAlumno(
			@idAlumno int,
			@idCarrera int,
			@idGrupo int,
			@idUsuario int
			)
AS
BEGIN
	INSERT INTO TAlumno(
			idAlumno,
			idCarrera,
			idGrupo,
			idUsuario)
VALUES(
		@idAlumno,
		@idCarrera,
		@idGrupo,
		@idUsuario) 
END
--------CRUDS---------

-----Insertar ciclos----
EXEC InsertarCiclo 61,2024, 1, '2024-01-10', '2024-04-11'
EXEC InsertarCiclo 62,2024, 2, '2024-04-12', '2024-08-12'
EXEC InsertarCiclo 63,2024, 3, '2024-08-14', '2024-12-15'
EXEC InsertarCiclo 64,2025, 1, '2025-01-05', '2025-04-05'
EXEC InsertarCiclo 65,2025, 2, '2025-04-08', '2025-08-09'
EXEC InsertarCiclo 66,2025, 3, '2025-08-11', '2025-12-13'
EXEC InsertarCiclo 67,2026, 1, '2026-01-21', '2026-04-25'

-------insertar carreras-------
EXEC InsertarCarrera 31, 'Medicina General', 'Medico especializado', 61
EXEC InsertarCarrera 32, 'Desarrollo de softwar', 'Ingeniero en sistemas', 62
EXEC InsertarCarrera 33, 'Electronica Industiral', 'Ingeniero Electrico', 61
EXEC InsertarCarrera 34, 'Ingenieria biomecanica', 'Ingeniero biomecanico', 62
EXEC InsertarCarrera 35, 'Enseñanza', 'Maestro de primaria', 63
EXEC InsertarCarrera 36, 'Contabilidad', 'Contador', 64
EXEC InsertarCarrera 37, 'Leyes', 'Criminologo', 65

--------Insertar Cursos----------
EXEC InsertarCurso 71, 'Fundamentos de Programacion', 4, 6, 32
EXEC InsertarCurso 72, 'Principios de programacion', 4, 6, 32
EXEC InsertarCurso 73, 'Bases de datos',5 , 6, 32
EXEC InsertarCurso 74, 'Proyecto de ingenieria', 8, 9, 32
EXEC InsertarCurso 75, 'Introducciona a la technologia', 4, 4, 32

EXEC InsertarCurso 76, 'Medicina#1', 5, 10, 31
EXEC InsertarCurso 77, 'Biologia#2', 4, 6, 31
EXEC InsertarCurso 78, 'Farmacia', 3, 5, 31
EXEC InsertarCurso 79, 'Psicologia basica', 8, 7, 31
EXEC InsertarCurso 80, 'Neurologia', 10, 20, 31

EXEC InsertarCurso 81, 'Electronica para principiantes', 3, 4, 33
EXEC InsertarCurso 82, 'Circuitos basicos', 4, 6, 33
EXEC InsertarCurso 83, 'Redes Electricas', 6, 8, 33
EXEC InsertarCurso 84, 'Electronica exterior', 4, 8, 33

EXEC InsertarCurso 85, 'Principios de la biomecanica', 2, 10, 34
EXEC InsertarCurso 86, 'biomecanica avanzada', 4, 10, 34
EXEC InsertarCurso 87, 'biomecanica en un fin de semana', 8, 15, 34

EXEC InsertarCurso 88, 'Valores#1', 2, 5, 35
EXEC InsertarCurso 89, 'MEtodologia explicativa', 8, 12, 35
EXEC InsertarCurso 90, 'Ciencias de la enseñanza', 6, 9, 35

EXEC InsertarCurso 91, 'Metodologia Matematica', 9, 18, 36
EXEC InsertarCurso 92, 'Herramientas Informaticas', 3, 4, 36
EXEC InsertarCurso 93, 'Contabilidad Empresarial', 7, 9, 36
EXEC InsertarCurso 94, 'Matematica Avanzada', 10, 22, 36

EXEC InsertarCurso 95, 'Criminologia#1', 6, 8, 37
EXEC InsertarCurso 96, 'Leyes Penales', 6, 7, 37
EXEC InsertarCurso 97, 'Criminologia#2', 10, 20, 37

----------Insertar usuarios-----------
EXEC InsertarUsuario 1,'Eduardo', 11231124, 'Profesor', 'Edeeed@yahoo.com', '1996-11-10', 8956454
EXEC InsertarUsuario 2,'Juliana', 22289581, 'Profesor', 'JJJJBBB@yahoo.com', '2001-08-10', 6567123
EXEC InsertarUsuario 3,'Carlos', 11425252, 'Profesor', 'carl@yahoo.com', '1991-05-10', 76058954
EXEC InsertarUsuario 4,'Bernal', 33369694, 'Profesor', 'Berz@yahoo.com', '1997-08-10', 88965412
EXEC InsertarUsuario 5,'Ronald', 96969481, 'Estudiante', 'Ronaldono@yahoo.com', '1999-09-10', 66685252
EXEC InsertarUsuario 6,'Martin', 11158625, 'Estudiante', 'martByr@yahoo.com', '2004-12-10', 79752146
EXEC InsertarUsuario 7,'Wendy', 11895478, 'Estudiante', 'wen@yahoo.com', '2000-01-10', 55628741
EXEC InsertarUsuario 8,'Johna', 20202258, 'Estudiante', 'Jna123@yahoo.com', '2005-06-10', 2252525
EXEC InsertarUsuario 9,'Ruth', 20089642, 'Estudiante', 'rugge85@yahoo.com', '2003-09-10', 64123817
EXEC InsertarUsuario 10,'Deliberto', 33345862, 'Estudiante', 'Dellii@yahoo.com', '1995-12-10', 72251983
EXEC InsertarUsuario 11,'Walter', 11445323, 'Profesor', 'profewal@gmail.com', '1994-01-30', 89521746
EXEC InsertarUsuario 12,'Heberto', 45198372, 'Profesor', 'sdhumberto@gmail.com', '1985-03-19', 67941985
EXEC InsertarUsuario 13,'Marjorie', 22238546, 'Profesor', 'marchmarch@gmail.com', '2002-05-08', 5064852
EXEC InsertarUsuario 14,'lizandra', 12230011, 'Estudiante', 'liz2222@hotmail.com', '2003-10-15', 77767895
EXEC InsertarUsuario 15,'Dexter', 20422898, 'Profesor', 'dexmotion@niIdea.com', '1989-03-27', 84521480
EXEC InsertarUsuario 16,'Deborah', 30825254, 'Profesor', 'debvelop40@gmail.com', '1992-11-02', 60089465
EXEC InsertarUsuario 17,'Andres', 15423254, 'Estudiante', 'adresillo123456@gmail.com', '2010-05-16', 84569245
EXEC InsertarUsuario 18,'Andrea', 208229451, 'Estudiante', 'andre500@gmail.com', '2007-11-09', 70708564


-----------Insertar Profesores---------------
EXEC InsertarProfesor 101,1
EXEC InsertarProfesor 102,2
EXEC InsertarProfesor 103,3
EXEC InsertarProfesor 104,4
EXEC InsertarProfesor 105,11
EXEC InsertarProfesor 106,12
EXEC InsertarProfesor 107,13
EXEC InsertarProfesor 108,14
EXEC InsertarProfesor 109,15
EXEC InsertarProfesor 110,16

--------Insertar Grupos----------------------
EXEC InsertarGrupo  131, 'L-MI 8:00AM-12:00PM', 1, 61, 71,101
EXEC InsertarGrupo  132, 'M-J 8:00AM-12:00PM', 2, 61, 71,102
EXEC InsertarGrupo  133, 'V-L 10:00AM-02:30PM', 3, 62, 72,103
EXEC InsertarGrupo  134, 'M-J 8:30AM-12:00PM', 4, 63, 73,104
EXEC InsertarGrupo  135, 'L-MI 4:00PM-6:00PM', 5, 62, 74,105
EXEC InsertarGrupo  136, 'V-S 7:00AM-11:00PM', 6, 64, 75,106
EXEC InsertarGrupo  137, 'L-MI 6:00PM-10:00PM', 7, 65, 76,107
EXEC InsertarGrupo  138, 'M-J 8:00PM-10:00PM', 8, 66, 77,108
EXEC InsertarGrupo  139, 'L-MI 1:00PM,-5:00PM', 9, 67, 78,109

--------Insertar Alumno-------------
EXEC InsertarAlumno 161, 31,131,5
EXEC InsertarAlumno 162, 32,132,6
EXEC InsertarAlumno 163, 33,133,7
EXEC InsertarAlumno 164, 32,134,8
EXEC InsertarAlumno 165, 34,135,9
EXEC InsertarAlumno 166, 35,136,10
EXEC InsertarAlumno 167, 36,137,14
EXEC InsertarAlumno 168, 31,131,17
EXEC InsertarAlumno 169, 33,133,18

SELECT * FROM TAlumno