CREATE DATABASE LabEnClase1

USE LabEnClase1

CREATE TABLE TCiclo(
			idCiclo int primary key,
			a�o int,
			numero int,
			fechaInicio date,
			fechaFinal date
			)

CREATE TABLE TCarrera(
			idCarrera int primary key,
			nombre varchar(50),
			titulo varchar(50),
			ciclo int,	
			
			CONSTRAINT FK_CIC FOREIGN KEY (ciclo)
			REFERENCES TCiclo (idCiclo)
			)

CREATE TABLE TCurso(
			idCurso int primary key not null,
			nombre varchar(50),
			creditos int,
			horasSemanales int,
			idCarrera int not null

			CONSTRAINT FK_Carrera FOREIGN KEY (idCarrera)
			REFERENCES TCarrera(idCarrera)
			)

CREATE TABLE TUsuarios(
			idusuario int primary key,
			nombre varchar(30),
			cedula int,
			rol varchar(50),
			email varchar(50),
			fechaNacimiento DATE,
			telefono int
			)

CREATE TABLE TProfesor(
			idProfesor int primary key,
			idUsuario int not null

			CONSTRAINT FK_PROFEUSUARIO FOREIGN KEY (idUsuario)
			REFERENCES TUsuarios(idUsuario)
			)

CREATE TABLE TGrupo(
			idGrupo int primary key,
			horario varchar(50),
			numero int,
			idCiclo int,
			idCurso int,
			idProfesor int

			CONSTRAINT FK_Ciclo FOREIGN KEY (idCiclo)
			REFERENCES TCiclo(idCiclo),
			
			CONSTRAINT FK_CursoG FOREIGN KEY (idCurso)
			REFERENCES TCurso(idCurso),

			CONSTRAINT FK_GrupoProfe FOREIGN KEY (idProfesor)
			REFERENCES TProfesor(idProfesor)
			)

CREATE TABLE TAlumno(
			idAlumno int primary key,
			idCarrera int not null,
			idGrupo int not null,
			idUsuario int not null

			CONSTRAINT FK_CarreraAlumno FOREIGN KEY (idCarrera)
			REFERENCES TCarrera(idCarrera),

			
			CONSTRAINT FK_Alumno FOREIGN KEY (idGrupo)
			REFERENCES TGrupo(idGrupo),

			CONSTRAINT FK_AlumnoUsuario FOREIGN KEY (idUsuario)
			REFERENCES TUsuarios(idUsuario)
			)

-----------INTERMEDIAS------------

CREATE TABLE CarreraXCiclo(
			idCarrera int,
			idCiclo int,
			CONSTRAINT PK_CarreraXCiclo PRIMARY KEY (idCarrera,idCiclo),
			
			CONSTRAINT FK_CarreraXCicloCa FOREIGN KEY (idCarrera)
			REFERENCES TCarrera (idCarrera),

			CONSTRAINT FK_CarreraXCicloCi FOREIGN KEY (idCiclo)
			REFERENCES TCiclo (idCiclo)
			)

CREATE TABLE EstudianteXCarrera(
			idAlumno int,
			idCarrera int not null,
			CONSTRAINT PK_EstudianteXCarrera PRIMARY KEY (idAlumno, idCarrera),

			CONSTRAINT FK_EstudianteXCarreraE FOREIGN KEY (idAlumno)
			REFERENCES TAlumno (idAlumno),

			CONSTRAINT FK_EstudianteXCarreraC FOREIGN KEY (idCarrera)
			REFERENCES TCarrera (idCarrera)
			)

CREATE TABLE CarreraXCurso(
			idCarrera int not null,
			idCurso int not null,
			CONSTRAINT PK_CarreraXCurso PRIMARY KEY (idCarrera,idCurso),
			
			CONSTRAINT FK_CarreraXCursoCa FOREIGN KEY (idCarrera)
			REFERENCES TCarrera (idCarrera),

			CONSTRAINT FK_CarreraXCursoCu FOREIGN KEY (idCurso)
			REFERENCES TCurso (idCurso)
			)

CREATE TABLE GrupoXAlumnos(
			idGrupo int,
			idAlumno int,
			CONSTRAINT PK_GrupoXAlumnoAl PRIMARY KEY (idGrupo,idAlumno),
			
			CONSTRAINT FK_GrupoXAlumnosG FOREIGN KEY (idGrupo)
			REFERENCES TGrupo (idGrupo),

			CONSTRAINT FK_GrupoXAlumnosA FOREIGN KEY (idAlumno)
			REFERENCES TAlumno (idAlumno)
			)

CREATE TABLE GrupoXCurso(
			idGrupo int,
			idCurso int,
			CONSTRAINT PK_GrupoXCursoCu PRIMARY KEY (idGrupo,idCurso),
			
			CONSTRAINT FK_GrupoXCursoGru FOREIGN KEY (idGrupo)
			REFERENCES TGrupo (idGrupo),

			CONSTRAINT FK_GrupoXCursoC FOREIGN KEY (idCurso)
			REFERENCES TCurso (idCurso)
			)

CREATE TABLE GrupoXCiclo(
			idGrupo int,
			idCiclo int,
			CONSTRAINT PK_GrupoXAlumnoCi PRIMARY KEY (idGrupo,idCiclo),
			
			CONSTRAINT FK_GrupoXCicloGr FOREIGN KEY (idGrupo)
			REFERENCES TGrupo (idGrupo),

			CONSTRAINT FK_GrupoXCicloCic FOREIGN KEY (idCiclo)
			REFERENCES TCiclo (idCiclo)
			)

--Insert-----

INSERT INTO TCiclo
VALUES (67,
		2026,
		1,
		'2026-01-21',
		'2026-04-21')

INSERT INTO TCarrera
VALUES(31,
		'Medicina General',
		'Medico especializado',
		61
		)

INSERT INTO TCurso
VALUES (75,
		'Introduccion a la technologia',
		4,
		4,
		32)

INSERT INTO TUsuarios
VALUES(5,
		'ronald',
		13594215,
		'Estudiante',
		'Roron@universidad.com',
		'2005-09-16',
		62624623)

INSERT INTO TProfesor
VALUES(102,
		2
		)	

INSERT INTO TGrupo
VALUES( 132,
		'M-J',
		2,
		61,
		71,
		102
		)

INSERT INTO TAlumno
VALUES(161,
		31,
		131,
		5
		)

----read---
SELECT * FROM TUsuarios

SELECT *FROM TAlumno

SELECT *FROM TProfesor

SELECT *FROM TCiclo

SELECT *FROM TCurso

SELECT *FROM TGrupo

SELECT *FROM TCarrera

SELECT *FROM TUsuarios

--Update---

UPDATE TUsuarios
SET rol = 'Profesor'
WHERE nombre = 'Eduardo'

UPDATE TUsuarios
SET rol = 'Profesor'
WHERE idUsuario = 3

UPDATE TUsuarios
SET cedula = 3366582
WHERE nombre = 'juan'

UPDATE TCiclo
SET a�o = 2025
WHERE idCiclo = 'CD34'

UPDATE TCurso
SET creditos = 6
WHERE creditos = 5

UPDATE TGrupo
SET numero = 2
WHERE idGrupo = 'PR12'

UPDATE TCarrera
SET nombre = 'Programacion'
WHERE nombre = 'Desarrollo de software'

UPDATE TUsuarios
SET cedula = 156892568
WHERE nombre = 'Antonio'

-- Delete----

DELETE FROM TUsuarios 
WHERE nombre = 'Yulian'

DELETE FROM TUsuarios
      WHERE nombre ='Juan'

DELETE FROM TCiclo
      WHERE idCiclo = 'CD34'

DELETE FROM TCurso
      WHERE creditos = 6

DELETE FROM TGrupo
      WHERE idGrupo = 'PR12'

DELETE FROM TCarrera
      WHERE nombre = 'Tecnico en desarrollo de software'

DELETE FROM TUsuarios
      WHERE nombre = 'Antonio'


----Consultas----
-----Punto 1 del documento
SELECT nombre, creditos, horasSemanales FROM TCurso WHERE idCarrera = 32

SELECT nombre FROM TCarrera WHERE idCarrera = 33 

SELECT nombre FROM TUsuarios WHERE rol = 'profesor'

SELECT nombre FROM TUsuarios WHERE cedula = 222565652

SELECT * FROM TCiclo WHERE a�o = 2024

SELECT a�o, fechaInicio,fechaFinal FROM TCiclo WHERE numero = 2

SELECT * FROM TUsuarios WHERE nombre = 'Juliana'

SELECT nombre, cedula FROM TUsuarios WHERE rol = 'estudiante' 

----------------------------------------------------

-----Proceso UpdateAlumno---
CREATE OR ALTER PROCEDURE ModificarAlumno(
			@idAlumno INT, 
			@nombre VARCHAR(45),
			@cedula INT,
			@telefono INT,
			@email VARCHAR(45),
			@fechaNacimiento DATE,
			@codigo INT)
AS
BEGIN
	UPDATE TAlumno SET
			TAlumno.idAlumno = @idAlumno,
			TAlumno.nombre = @nombre,
			TAlumno.cedula = @cedula,
			TAlumno.telefono = @telefono,
			TAlumno.email = @email,
			TAlumno.fechaNacimiento = @fechaNacimiento,
			TAlumno.codigo = @codigo
	WHERE TAlumno.idAlumno = @idAlumno
END
----FIN DEL PROCESO---
-------Ejecucion-----
EXEC ModificarAlumno 33,'Eduardo Flores',222248956,65689325,'edflores@yahoo.com','1992-10-09',33

---- Proceso eliminar alumno ----
CREATE OR ALTER PROCEDURE EliminarAlumno(
			@idAlumno INT)
AS
BEGIN
			DELETE FROM TAlumno 
			WHERE @idAlumno = idAlumno;
END;
----------Ejecucion eliminarAlumno----
EXEC EliminarAlumno 33

----Funcion consultar alumno ----
CREATE OR ALTER FUNCTION ConsultaUsuario(
    @ID INT
)
RETURNS TABLE
AS
RETURN
    SELECT 
        nombre,
        fechaNacimiento,
        email
    FROM
        TUsuarios
    WHERE
        idUsuario = @ID;

---Ejecucion ConsultarAlumno
SELECT * FROM ConsultaUsuario(5)

---- Funcion consultar tabla de alumnos ----
CREATE OR ALTER PROCEDURE ConsultarListaAlumnos
AS
BEGIN
	SELECT * FROM TAlumno;
END;

----Ejecucion ConsultarListaAlumnos ----

EXEC ConsultarListaAlumnos;
