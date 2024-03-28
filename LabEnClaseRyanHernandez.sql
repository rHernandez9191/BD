USE LabEnClase1



CREATE TABLE TCurso(
			idCurso int primary key not null,
			nombre varchar(50),
			creditos int,
			horasSemanales int
			)

CREATE TABLE TCarrera(
			codigo int primary key,
			nombre varchar(50),
			titulo varchar(50),
			ciclo int,
			idCurso int,
			CONSTRAINT FK_Curso FOREIGN KEY (idCurso)
			REFERENCES TCurso(idCurso)
			)

CREATE TABLE TProfesor(
			idProfesor int primary key,
			nombre varchar(30),
			cedula int not null unique,
			telefono int,
			email varchar(50)
			)

CREATE TABLE TAlumno(
			idAlumno int primary key,
			nombre varchar(50),
			cedula int not null unique,
			telefono int,
			email varchar(50),
			fechaNacimiento date,
			codigo int not null,

			CONSTRAINT FK_Carrera FOREIGN KEY (codigo)
			REFERENCES TCarrera(codigo)
			)

CREATE TABLE TCiclo(
			idCiclo int primary key,
			año int,
			numero int,
			fechaInicio date,
			fechaFinal date
			)

CREATE TABLE TGrupo(
			idGrupo int primary key,
			horario varchar(50),
			numero int,
			idCiclo int,
			idCurso int,
			idAlumno int,

			CONSTRAINT FK_Ciclo FOREIGN KEY (idCiclo)
			REFERENCES TCiclo(idCiclo),
			
			CONSTRAINT FK_CursoG FOREIGN KEY (idCurso)
			REFERENCES TCurso(idCurso),

			CONSTRAINT FK_Alumno FOREIGN KEY (idAlumno)
			REFERENCES TAlumno(idAlumno)
			)

CREATE TABLE TUsuarios(
			idusuario int primary key,
			nombre varchar(30),
			cedula int,
			rol varchar(50),
			email varchar(50)
			)


ALTER TABLE TCarrera 
ADD CONSTRAINT FK_CICLOCa FOREIGN KEY (ciclo)
REFERENCES TCiclo(idCiclo)


CREATE TABLE CarreraXCiclo(
			codigo int,
			idCiclo int,
			CONSTRAINT PK_CarreraXCiclo PRIMARY KEY (codigo,idCiclo))

CREATE TABLE EstudianteXCarrera(
			idAlumno int,
			codigo int,
			CONSTRAINT PK_EstudianteXCarrera PRIMARY KEY (idAlumno,codigo)
			)

CREATE TABLE CarreraXCurso(
			codigo int,
			idCurso int,
			CONSTRAINT PK_CarreraXCurso PRIMARY KEY (codigo,idCurso))

CREATE TABLE GrupoXAlumnos(
			idGrupo int,
			idAlumno int,
			CONSTRAINT PK_GrupoXAlumnoAl PRIMARY KEY (idGrupo,idAlumno))

CREATE TABLE GrupoXCurso(
			idGrupo int,
			idCurso int,
			CONSTRAINT PK_GrupoXCursoCu PRIMARY KEY (idGrupo,idCurso))

CREATE TABLE GrupoXCiclo(
			idGrupo int,
			idCiclo int,
			CONSTRAINT PK_GrupoXAlumnoCi PRIMARY KEY (idGrupo,idCiclo))

ALTER TABLE EstudianteXCarrera
ADD CONSTRAINT FK_EstudianteXCarreraE FOREIGN KEY (idAlumno)
REFERENCES TAlumno (idAlumno);

ALTER TABLE EstudianteXCarrera
ADD CONSTRAINT FK_EstudianteXCarreraC FOREIGN KEY (codigo)
REFERENCES TCarrera (codigo);
-----
ALTER TABLE CarreraXCiclo
ADD CONSTRAINT FK_CarreraXCicloCa FOREIGN KEY (codigo)
REFERENCES TCarrera (codigo);

ALTER TABLE CarreraXCiclo
ADD CONSTRAINT FK_CarreraXCicloCi FOREIGN KEY (idCiclo)
REFERENCES TCiclo (idCiclo);
-----
ALTER TABLE CarreraXCurso
ADD CONSTRAINT FK_CarreraXCursoCa FOREIGN KEY (codigo)
REFERENCES TCarrera (codigo);

ALTER TABLE CarreraXCurso
ADD CONSTRAINT FK_CarreraXCursoCu FOREIGN KEY (idCurso)
REFERENCES TCurso (idCurso);
----
ALTER TABLE GrupoXAlumnos
ADD CONSTRAINT FK_GrupoXAlumnosG FOREIGN KEY (idGrupo)
REFERENCES TGrupo (idGrupo);

ALTER TABLE GrupoXAlumnos
ADD CONSTRAINT FK_GrupoXAlumnosA FOREIGN KEY (idAlumno)
REFERENCES TAlumno (idAlumno);
-------
ALTER TABLE GrupoXCurso
ADD CONSTRAINT FK_GrupoXCursoGru FOREIGN KEY (idGrupo)
REFERENCES TGrupo (idGrupo);

ALTER TABLE GrupoXCurso
ADD CONSTRAINT FK_GrupoXCursoC FOREIGN KEY (idCurso)
REFERENCES TCurso (idCurso);
--------
ALTER TABLE GrupoXCiclo
ADD CONSTRAINT FK_GrupoXCicloGr FOREIGN KEY (idGrupo)
REFERENCES TGrupo (idGrupo);

ALTER TABLE GrupoXCiclo
ADD CONSTRAINT FK_GrupoXCicloCic FOREIGN KEY (idCiclo)
REFERENCES TCiclo (idCiclo);

----Consultas----

SELECT * FROM TCurso WHERE nombre = 'Fundamentos de bases de datos'

SELECT * FROM TCurso WHERE codigo = 3456 

SELECT * FROM TCarrera WHERE nombre = 'desarrollo de software'

SELECT * FROM TCarrera WHERE codigo = 5533

SELECT * FROM TProfesor WHERE cedula = 1156654212

SELECT * FROM TProfesor WHERE nombre = 'Juliana'

SELECT * FROM TAlumno WHERE nombre = 'Ryan'

SELECT * FROM TAlumno WHERE cedula = 22658974

SELECT * FROM TCiclo WHERE año = 2024

SELECT nombre , titulo, carrera FROM TAlumno
INNER JOIN TCarrera ON TAlumno.codigo = TCarrera.codigo

SELECT * FROM TCarrera
INNER JOIN TCurso ON TCarrera.idCurso = TCurso.idCurso

SELECT carrera, curso FROM TCarrera
INNER JOIN TCurso ON TCarrera.idCurso = TCurso.idCurso

SELECT carrera, curso, ciclo FROM TCarrera
INNER JOIN TCurso ON TCarrera.idCurso = TCurso.idCurso

SELECT numGrupo, horario, curso FROM TGrupo
INNER JOIN TCurso ON TGrupo.idCurso = TCurso.idCurso

SELECT numGrupo, horario, idCiclo FROM TGrupo
INNER JOIN TCurso ON TGrupo.idCurso = TCurso.idCurso

--Insert-----

INSERT INTO TCurso
VALUES (19
		,'Biologia'
		,7
		,10)

INSERT INTO TProfesor
VALUES(43
		,'Berta Rojas'
		,1148889654
		,74728569
		,'Bertarojas@gmail.com')

INSERT INTO TCiclo
VALUES (4
		,2025
		,4
		,'2025-01-25'
		,'2025-04-30')

INSERT INTO TUsuarios
VALUES(73
		,'bernal rivas'
		,73594215
		,'Matriculador'
		,'BR@universidad.com')

INSERT INTO TCarrera
VALUES(22
		,'Biologia General'
		,'Biologo natural'
		, 4
		,19)

INSERT INTO TAlumno 
VALUES(19
		,'Alejandro Magno'
		,22444085
		,118380937
		,'magnito@gmai.com'
		,'2003-04-24'
		,22)

INSERT INTO TGrupo
VALUES(53
		,'L-M 12pm - 4pm'
		,3
		,4
		,19
		,19)

--read----

SELECT *FROM TAlumno

SELECT *FROM TProfesor

SELECT *FROM TCiclo

SELECT *FROM TCurso

SELECT *FROM TGrupo

SELECT *FROM TCarrera

SELECT *FROM TUsuarios

--Update---

UPDATE TAlumno
SET cedula = 1313131415
WHERE nombre = 'jenifer'

UPDATE TProfesor
SET cedula = 3366582
WHERE nombre = 'juan'

UPDATE TCiclo
SET año = 2025
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

DELETE FROM TAlumno 
WHERE nombre = 'Yulian'

DELETE FROM TProfesor
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

-------Vistas------

CREATE OR ALTER VIEW [TodosAlumnos] with encryption 
AS
SELECT * FROM TAlumno

SELECT * FROM TodosAlumnos

CREATE OR ALTER VIEW [AlumnosYProfesores] with encryption 
AS
SELECT nombre FROM TAlumno 
UNION
SELECT nomProfesor FROM TProfesor

SELECT * FROM AlumnosYProfesores

CREATE OR ALTER VIEW [CarreraYCursos] with encryption 
AS
SELECT carrera, curso FROM TCarrera
INNER JOIN TCurso ON TCarrera.idCurso = TCurso.idCurso

SELECT * FROM CarreraYCursos


------Proceso InsertarCarrera
CREATE OR ALTER PROCEDURE InsertarCarrera(
			@codigo int ,
			@nombre varchar(50),
			@titulo varchar(50),
			@ciclo int,
			@idCurso int)
AS
BEGIN
	INSERT INTO TAlumno(
				idAlumno,
				nombre,
				cedula,
				telefono,
				email,
				fechaNacimiento,
				codigo)
VALUES(	
	@idAlumno, 
	@nombre, 
	@cedula,
	@telefono,
	@email,
	@fechaNacimiento,
	@codigo)
END

---- Proceso insertar Alumno ------
CREATE OR ALTER PROCEDURE InsertarAlumno(
			@idAlumno int ,
			@nombre varchar(50),
			@cedula int,
			@telefono int,
			@email varchar(50),
			@fechaNacimiento date,
			@codigo int )
AS
BEGIN
	INSERT INTO TAlumno(
				idAlumno,
				nombre,
				cedula,
				telefono,
				email,
				fechaNacimiento,
				codigo)
VALUES(	
	@idAlumno, 
	@nombre, 
	@cedula,
	@telefono,
	@email,
	@fechaNacimiento,
	@codigo)
END
----FIN DEL PROCESO
-----Ejecucion
EXEC InsertarAlumno 33,'Eduardo', 222565652, 24451212, 'eded@hotmail.com','1992-10-09', 21

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
EXEC ModificarAlumno 33,'Eduardo Flores',222248956,65689325,'edflores@yahoo.com','1992-10-09',21

---- Proceso eliminar alumno ----
CREATE OR ALTER PROCEDURE EliminarAlumno(
			@idAlumno INT)
AS
BEGIN
			DELETE FROM TAlumno 
			WHERE @idAlumno = idAlumno;
END;
----------Ejecucion eliminarAlumno----


----Funcion
CREATE OR ALTER FUNCTION ConsultaAlumno(
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
        TAlumno
    WHERE
        idAlumno = @ID;

---Ejecucion ConsultarAlumno
SELECT * FROM ConsultaAlumno(33)
