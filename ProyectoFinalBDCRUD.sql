USE ProyectoGymnasio

-----INSERTS------------------

-- Insertar persona ---
CREATE OR ALTER PROCEDURE insertar_persona (
	 @nombre varchar(45), @cedula INT, @fechaNacimiento DATE, @email varchar(45), @telefono VARCHAR(45) )
AS
BEGIN
	INSERT INTO TPersona VALUES(@nombre, @cedula, @fechaNacimiento, @email, @telefono)
END

/**/

--Ingresar 10 personas -- 
EXEC insertar_persona 'Juan', 118390739, '2002-02-02', 'juan.segura@gmail.com', '22440987'
EXEC insertar_persona 'Pedro', 236547865, '2005-05-30', 'pedro.lalo@hotmail.com', '87654322'
EXEC insertar_persona 'Alejandro', 22445678, '1998-1-11', 'papasconatun@gmail.com', '98765678'
EXEC insertar_persona 'Giuliana', 125433456, '1988-8-8', 'peinadoazul@yahoo.com', '76678558'
EXEC insertar_persona 'Lucia', 238777654, '1995-1-30', 'luciamesen@gmail.com', '90908776'
EXEC insertar_persona 'Lucia Ramirez', 238777654, '1995-12-30', 'luciaramirez@example.com', '90908776';
EXEC insertar_persona 'Juan Pérez', 564321987, '1988-06-15', 'juanperez@example.com', '12345678';
EXEC insertar_persona 'María González', 789654123, '1990-03-05', 'maria.gonzalez@example.com', '98765432';
EXEC insertar_persona 'Pedro Martínez', 112233445, '1985-09-18', 'pedromartinez@example.com', '55556666';
EXEC insertar_persona 'Ana López', 777888999, '1977-07-22', 'ana.lopez@example.com', '99998888';
EXEC insertar_persona 'Carlos Fernandez', 456789012, '2000-04-10', 'carlosfernandez@example.com', '11112222';

--Insertar pago--
CREATE OR ALTER PROCEDURE insertar_pago (
	@rol VARCHAR(45), @monto INT )
AS
BEGIN
	INSERT INTO TPagos VALUES(@rol, @monto)
END

--Insertar pago--
EXEC insertar_pago 'Entrenador', 100000
EXEC insertar_pago 'Limpieza', 350000
EXEC insertar_pago 'Administrativo', 500000
EXEC insertar_pago 'Gerente', 450000
EXEC insertar_pago 'Cajero', 2500000
EXEC insertar_pago 'Entrenador', 200000


--insertar Gymnasio--
CREATE OR ALTER PROCEDURE insertar_gymnasio (
	@marca VARCHAR(45), @telefonoGeneral VARCHAR(45), @contacto VARCHAR(45) )
AS
BEGIN 
	INSERT INTO TGymnasio VALUES (@marca, @telefonoGeneral, @contacto)
END

--Insertar Gymnasio--
EXEC insertar_gymnasio 'Strong Fit', '22409897', 'Giuliana Mesen'
EXEC insertar_gymnasio 'Gym Shark', '21225654', 'Rigoberto Loria'
EXEC insertar_gymnasio 'Tecno Gym', '22449090', 'Silvia Asofeifa'
EXEC insertar_gymnasio 'Al Trote', '22418089', 'Genesis Villaran'
EXEC insertar_gymnasio 'Gimnasio activo', '21213434', 'Pablo Madrid'

--Insertar sede--
CREATE OR ALTER PROCEDURE insertar_sede (
	@nomSede VARCHAR(45), @provincia VARCHAR(45), @canton VARCHAR(45), @email VARCHAR(45), @telefono1 VARCHAR(45), @telefono2 VARCHAR(45), @idGymnasio INT )
AS
BEGIN
	INSERT INTO TSede VALUES(@nomSede, @provincia, @canton, @email, @telefono1, @telefono2, @idGymnasio)
END

--Insertar Sede--
EXEC insertar_sede 'Sede central', 'San jose', 'San Jose', 'arrozconmango@gmail.com', '89676545', '89348765', 1
	
----Insertar instructor----
CREATE OR ALTER PROCEDURE insertar_instructor(@idPersona INT, @idPago INT, @idSede INT)
AS
BEGIN 
	INSERT INTO TInstructor VALUES(@idPersona, @idPago, @idSede)
END
----Insertar instructor----
EXEC insertar_instructor 22, 2, 1

--Insertar cliente--
CREATE OR ALTER PROCEDURE insertar_cliente (
	@idPersona INT, @estatura FLOAT, @sexo VARCHAR(1), @altoRiesgo VARCHAR(2), @idInstructor INT)
AS
BEGIN
	INSERT INTO TCliente VALUES(@idPersona, @estatura, @sexo, @altoRiesgo, @idInstructor)
END

--Insertar cliente--
EXEC insertar_cliente 26, 1.8, 'M', 'Si', 1

----Insertar certificaciones----
CREATE OR ALTER PROCEDURE insertar_certificaciones (@titulo VARCHAR(45), @idInstructor INT)
AS
BEGIN
	INSERT INTO TCertificaciones VALUES (@titulo, @idInstructor)
END

----Insertar certificaciones----
EXEC insertar_certificaciones 'Entrenador personal', 1

----Insertar UAdministrativo----
CREATE OR ALTER PROCEDURE insertar_UAdministrativo(@idPersona INT, @idPago INT)
AS
BEGIN
	INSERT INTO TUAdministrativo VALUES(@idPersona, @idPago)
END

----Insertar UAdministrativo----
EXEC insertar_UAdministrativo 24, 3

----Insertar mediciones----
CREATE OR ALTER PROCEDURE insertar_mediciones(@fecha DATE, @hora TIME, @peso FLOAT, @porcentajeGrasa FLOAT, @porcentajeGViceral FLOAT, @IMC FLOAT)
AS
BEGIN
	INSERT INTO TMediciones VALUES(@fecha, @hora, @peso, @porcentajeGrasa, @porcentajeGViceral,@IMC)
END

----Insertar mediciones----
EXEC insertar_mediciones '2024-12-30', '12:50:01', 70, 25, 15, 20



















SELECT * FROM TPersona
SELECT * FROM TGymnasio
SELECT * FROM TSede
SELECT * FROM TPagos
SELECT * FROM TInstructor
SELECT * FROM TCertificaciones
SELECT * FROM TUAdministrativo
SELECT * FROM TMediciones
SELECT * FROM TCliente
SELECT * FROM TRutina
SELECT * FROM TExpediente
