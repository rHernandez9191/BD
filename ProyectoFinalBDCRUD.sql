USE ProyectoGymnasio

-----INSERTS------------------

-- Insertar persona ---
CREATE OR ALTER PROCEDURE insertar_persona (
	 @nombre varchar(45), @cedula varchar(45), @fechaNacimiento DATE, @email varchar(45), @telefono VARCHAR(45) )
AS
BEGIN
	DECLARE @idPersona VARCHAR(45)
	SET @idPersona = LEFT(@nombre, 2) + '-' + LEFT(@cedula,4) + '-' + RIGHT(@fechaNacimiento, 2)
	INSERT INTO TPersona VALUES(@idPersona, @nombre, @cedula, @fechaNacimiento, @email, @telefono)
END

--Ingresar 10 personas -- 
EXEC insertar_persona 'Juan', '118390739', '09-03-2002', 'juan.segura@gmail.com', '22440987'
EXEC insertar_persona 'Pedro', '236547865', '12-12-2005', 'pedro.lalo@hotmail.com', '87654322'
EXEC insertar_persona 'Alejandro', '22445678', '01-11-1998', 'papasconatun@gmail.com', '98765678'
EXEC insertar_persona 'Giuliana', '125433456', '05-05-1988', 'peinadoazul@yahoo.com', '76678558'
EXEC insertar_persona 'Lucia', '238777654', '30-12-1995', 'luciamesen@gmail.com', '90908776'
EXEC insertar_persona 'Lucia Ramirez', '238777654', '1995-12-30', 'luciaramirez@example.com', '90908776+';
EXEC insertar_persona 'Juan Pérez', '564321987', '1988-06-15', 'juanperez@example.com', '12345678';
EXEC insertar_persona 'María González', '789654123', '1990-03-05', 'maria.gonzalez@example.com', '98765432';
EXEC insertar_persona 'Pedro Martínez', '112233445', '1985-09-18', 'pedromartinez@example.com', '55556666';
EXEC insertar_persona 'Ana López', '777888999', '1977-07-22', 'ana.lopez@example.com', '99998888';
EXEC insertar_persona 'Carlos Fernandez', '456789012', '2000-04-10', 'carlosfernandez@example.com', '11112222';

SELECT * FROM TPersona

--Insertar pago--
CREATE OR ALTER PROCEDURE insertar_pago (
	@rol VARCHAR(45), @monto INT )
AS
BEGIN
	DECLARE @idPago VARCHAR(45);
	SET @idPago = LEFT(@rol,2)
	INSERT INTO TPagos VALUES(@idPago, @rol, @monto)
END

--Insertar pago--
EXEC insertar_pago 'Entrenador', 100000
EXEC insertar_pago 'Limpieza', 350000
EXEC insertar_pago 'Administrativo', 500000
EXEC insertar_pago 'Gerente', 450000
EXEC insertar_pago 'Cajero', 2500000

--insertar Gymnasio--
CREATE OR ALTER PROCEDURE insertar_gymnasio (
	@marca VARCHAR(45), @telefonoGeneral VARCHAR(45), @contacto VARCHAR(45) )
AS
BEGIN 
	DECLARE @idGymnasio VARCHAR(45)
	SET @idGymnasio = LEFT(@marca, 3) + '-' + LEFT(@telefonoGeneral, 3) + '-' + LEFT(@contacto, 3)
	INSERT INTO TGymnasio VALUES (@idGymnasio, @marca, @telefonoGeneral, @contacto)
END

--Insertar Gymnasio--
EXEC insertar_gymnasio 'Strong Fit', '22409897', 'Giuliana Mesen'
EXEC insertar_gymnasio 'Gym Shark', '21225654', 'Rigoberto Loria'
EXEC insertar_gymnasio 'Tecno Gym', '22449090', 'Silvia Asofeifa'
EXEC insertar_gymnasio 'Al Trote', '22418089', 'Genesis Villaran'
EXEC insertar_gymnasio 'Gimnasio activo', '21213434', 'Pablo Madrid'

--Insertar sede--
CREATE OR ALTER PROCEDURE insertar_sede (
	@nomSede VARCHAR(45), @provincia VARCHAR(45), @canton VARCHAR(45), @email VARCHAR(45), @telefono1 VARCHAR(45), @telefono2 VARCHAR(45), @idGymnasio VARCHAR(45) )
AS
BEGIN
	DECLARE @idSede VARCHAR(45)
	SET @idSede = @idGymnasio + '-' + LEFT(@nomSede, 3) + '-' + LEFT(@provincia, 1) + '-' + @canton + '-' + LEFT(@telefono1, 2)
	INSERT INTO TSede VALUES(@idSede, @nomSede, @provincia, @canton, @email, @telefono1, @telefono2, @idGymnasio)
END

--Insertar Sede--
EXEC insertar_sede 'Sede central', 'San jose', 'San Jose', 'arrozconmango@gmail.com', '89676545', '89348765', 'Al -224-Gen'
	
-------AQUI HAY QUE HACER EL INSERT INSTRUCTOR--------------

--Insertar cliente--
CREATE OR ALTER PROCEDURE insertar_cliente (
	@idPersona VARCHAR(45), @estatura FLOAT, @sexo VARCHAR(1), @altoRiesgo VARCHAR(2), @idInstructor VARCHAR(45))
AS
BEGIN
	DECLARE @idCliente VARCHAR(45);
	SET @idCliente = @idPersona + '-' + @sexo + '-' + @altoRiesgo + '-' + LEFT(@idInstructor,2)
	INSERT INTO TCliente VALUES(@idCliente, @idPersona, @estatura, @sexo, @altoRiesgo, @idInstructor)
END

--Insertar cliente--
EXEC insertar_cliente 'Al-2244-11', 1.8, 'M', 'Si'

