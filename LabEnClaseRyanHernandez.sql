CREATE DATABASE LabEnClase1

USE LabEnClase1

CREATE TABLE TCiclo(
			idCiclo int primary key,
			año int,
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


----Consultas----
-----Mantenimiento de cursos-------------------------------------
SELECT nombre FROM TCurso WHERE idCarrera = 32

SELECT * FROM TCurso where nombre = 'bases de datos'

------Mantenimiento de carreras
SELECT nombre FROM TCarrera WHERE idCarrera = 33

SELECT * FROM TCarrera WHERE nombre = 'Medicina general'

------Mantenimiento de profesoreS----------------------------------
SELECT nombre FROM TUsuarios WHERE rol = 'profesor'

SELECT nombre,cedula FROM TUsuarios INNER JOIN TProfesor
ON TUsuarios.idusuario = TProfesor.idUsuario

-----Mantenimiento de Alumnos-------------------------------------
SELECT nombre, cedula FROM TUsuarios WHERE rol = 'Estudiante'

SELECT nombre, cedula FROM TUsuarios INNER JOIN TAlumno
ON TUsuarios.idusuario = TAlumno.idUsuario

SELECT nombre, cedula FROM TUsuarios INNER JOIN TAlumno
ON TUsuarios.idusuario = TAlumno.idUsuario

-----Mantenimiento de ciclo-----------------
SELECT * FROM TCiclo WHERE año = 2024
SELECT * FROM TCiclo WHERE año BETWEEN 2024 AND 2026
SELECT año, fechaInicio,fechaFinal FROM TCiclo WHERE numero = 2

-----Oferta Academica-----------


