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



--------CRUDS---------

-----Insertar ciclo----
EXEC InsertarCiclo 66,2025, 3, '2025-08-11', '2025-12-11'
EXEC InsertarCiclo 66,2025, 3, '2025-08-11', '2025-12-11'

-------insertar carrera-------
EXEC InsertarCarrera 33, 'Electronica Industiral', 'Ingeniero Electrico', 61
EXEC InsertarCarrera 34, 'Ingenieria biomecanica', 'Ingeniero biomecanico', 62