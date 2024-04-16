USE LabEnClase1



-----------Procesos------------

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
			@telefono int,
			@email varchar(50),
			@fechaNacimiento date
			 )
AS
BEGIN
	INSERT INTO TUsuarios(
				idusuario,
				nombre,
				cedula,
				telefono,
				email,
				fechaNacimiento
				)
VALUES(	 
	@idUsuario,
	@nombre, 
	@cedula,
	@telefono,
	@email,
	@fechaNacimiento
	)
END
----FIN DEL PROCESO
-----Ejecucion
EXEC InsertarUsuario 3,'Carlos', 20058906, 68689272, 'Carl@yahoo.com','1995-11-10'

SELECT * FROM TCarrera

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

EXEC InsertarCurso 88, 'Neurologia', 10, 20, 35
EXEC InsertarCurso 89, 'Neurologia', 10, 20, 35
EXEC InsertarCurso 90, 'Neurologia', 10, 20, 35