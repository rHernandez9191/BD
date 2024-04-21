CREATE DATABASE ProyectoGymnasio

USE ProyectoGymnasio

CREATE TABLE TPersona(
			idPersona VARCHAR(45) not null PRIMARY KEY,
			nombre varchar(45),
			cedula int,
			fechaNacimiento DATE,
			email varchar(45),
			telefono VARCHAR(45)
			)

CREATE TABLE TGymnasio (
			idGymnasio int not null PRIMARY KEY,
			marca varchar(45) not null,
			telefonoGeneral int,
			contacto varchar(45)
			)

CREATE TABLE TSede(
			idSede int not null PRIMARY KEY,
			nomSede varchar(45),
			provincia varchar(45),
			canton varchar(45),
			email varchar(45),
			telefono1 int not null,
			telefono2 int,
			idGymnasio int
			
			CONSTRAINT FK_Gym FOREIGN KEY (idGymnasio)
			REFERENCES TGymnasio(idGymnasio)
			)

CREATE TABLE TPagos(
			idPago int not null PRIMARY KEY,
			rol varchar(45) not null,
			monto int not null)

CREATE TABLE TInstructor(
			idInstructor int not null PRIMARY KEY,
			idPersona VARCHAR(45),
			idPago int,
			idSede int
			
			CONSTRAINT FK_PERSONA FOREIGN  KEY (idPersona)
			REFERENCES TPersona (idPersona),

			CONSTRAINT FK_Pago FOREIGN KEY (idPago)
			REFERENCES TPagos(idPago),

			CONSTRAINT FK_Sede FOREIGN KEY (idsede)
			REFERENCES TSede (idSede)
			)

CREATE TABLE TCertificaciones(
			idCertificacion int not null PRIMARY KEY,
			titulo varchar(45),
			idInstructor int not null

			CONSTRAINT FK_InstructCert FOREIGN KEY (idInstructor)
			REFERENCES TInstructor(idInstructor)
			)

CREATE TABLE TUAdministrativo(
			idUsuario int not null PRIMARY KEY,
			idPersona VARCHAR(45) not null,
			idPago int not null

			CONSTRAINT FK_PersonaAdmin FOREIGN  KEY (idPersona)
			REFERENCES TPersona (idPersona),

			CONSTRAINT FK_PagoAmin FOREIGN KEY (idPago)
			REFERENCES TPagos(idPago)
			)

CREATE TABLE TMediciones(
			idMedicion int not null PRIMARY KEY,
			fecha date,
			hora time,
			peso float,
			porcentajeGrasa float,
			porcentajeGViceral float,
			IMC float
			)

CREATE TABLE TCliente(
			idCliente VARCHAR(45) not null PRIMARY KEY,
			idPersona VARCHAR(45) not null,
			estatura float,
			sexo varchar(1),
			altoRiesgo varchar(2),
			idInstructor VARCHAR(45) not null,

			CONSTRAINT FK_PersonaCliente FOREIGN KEY (idPersona)
			REFERENCES TPersona (idPersona),

			CONSTRAINT FK_InstructorCli FOREIGN KEY (idInstructor)
			REFERENCES TInstructor(idInstructor)
			)[dbo].[TCertificaciones]

CREATE TABLE TRutina(
			idRutina int PRIMARY KEY,
			ejercicion varchar(45),
			repeticiones int
			)

CREATE TABLE TExpediente(
			idExpediente int PRIMARY KEY,
			idCliente VARCHAR(45) not null,
			idMedicion int,
			idRutina int 

			CONSTRAINT FK_ExpedienteRutina FOREIGN KEY (idRutina)
			REFERENCES TRutina (idRutina),

			CONSTRAINT FK_ExpedienteCli FOREIGN KEY (idCliente)
			REFERENCES TCliente(idCliente),
			
			CONSTRAINT FK_ExpedienteMedi FOREIGN KEY (idMedicion)
			REFERENCES TMediciones(idMedicion)
			)

----- INTERMEDIAS
CREATE TABLE ExpedienteXCliente(
			idExpediente int,
			idCliente VARCHAR(45)
			CONSTRAINT PK_ExpedienteXCliente PRIMARY KEY(idExpediente, idCliente),

			CONSTRAINT ExpeXcliente FOREIGN KEY (idExpediente)
			REFERENCES TExpediente(idExpediente),

			CONSTRAINT ClienteExpe FOREIGN KEY (idCliente)
			REFERENCES TCliente (idCliente)
			)

CREATE TABLE ExpedienteXMedicion(
			idExpediente int,
			idMedicion int
			CONSTRAINT PK_ExpedienteXMedicion PRIMARY KEY(idExpediente, idMedicion),

			CONSTRAINT ExpeMedicion FOREIGN KEY (idExpediente)
			REFERENCES TExpediente(idExpediente),

			CONSTRAINT MedicionExpe FOREIGN KEY (idMedicion)
			REFERENCES TMediciones (idMedicion)
			)

CREATE TABLE ExpedienteXRutina(
			idExpediente int,
			idRutina int
			CONSTRAINT PK_ExpedienteXRutina PRIMARY KEY(idExpediente, idRutina),

			CONSTRAINT ExpeRutina FOREIGN KEY (idExpediente)
			REFERENCES TExpediente(idExpediente),

			CONSTRAINT RutinaExpe FOREIGN KEY (idRutina)
			REFERENCES TRutina (idRutina)
			)


CREATE TABLE SedeXGymnasio(
			idSede int not null,
			idGymnasio int not null
			CONSTRAINT SedeXGym PRIMARY KEY (idSede, idGymnasio),
			
			CONSTRAINT FK_SedeXGymS FOREIGN KEY (idSede)
			REFERENCES TSede (idSede),

			CONSTRAINT FK_SedeXGymG FOREIGN KEY (idGymnasio)
			REFERENCES TGymnasio (idGymnasio)		
			)

CREATE TABLE PagoXInstructor(
			idPago int not null,
			idInstructor int not null
			CONSTRAINT PagoXinstruc PRIMARY KEY(idPago, idInstructor),
			
			CONSTRAINT FK_PagoXInstrucP FOREIGN KEY (idPago)
			REFERENCES TPagos (idPago),
			
			CONSTRAINT FK_PagoXInstrucI FOREIGN KEY (idInstructor)
			REFERENCES TInstructor (idInstructor)
			)

CREATE TABLE CertificacionXInstructor(
			idCertificacion int not null,
			idInstructor int not null
			CONSTRAINT PagoXInstructorCI PRIMARY KEY(idCertificacion, idInstructor)
			
			CONSTRAINT FK_CertiXInstrucCer FOREIGN KEY (idCertificacion)
			REFERENCES TCertificaciones (idCertificacion),
			
			CONSTRAINT FK_CertiXInstrucI FOREIGN KEY (idInstructor)
			REFERENCES TInstructor (idInstructor)
			)

CREATE TABLE InstructorXSede(
			idInstructor int not null,
			idSede int not null
			CONSTRAINT InstructXSede PRIMARY KEY(idInstructor, idSede),

			CONSTRAINT FK_InstructorXSedeIns FOREIGN KEY (idInstructor)
			REFERENCES TInstructor (idInstructor),

			CONSTRAINT FK_InstructorXSedeSe FOREIGN KEY (idSede)
			REFERENCES TSede (idSede)
			)

CREATE TABLE PagoXUAdmin(
			idPago int not null,
			idUsuario int not null
			CONSTRAINT PagoXAdmin PRIMARY KEY(idPago, idUsuario),
			
			CONSTRAINT FK_PagoXUAdminU FOREIGN KEY (idUsuario)
			REFERENCES TUAdministrativo (idUsuario),
			
			CONSTRAINT FK_PagoXUAdminP FOREIGN KEY (idPago)
			REFERENCES TPagos (idPago)
			)

CREATE TABLE ClienteXMedicion(
			idCliente VARCHAR(45) not null,
			idMedicion int not null,
			CONSTRAINT ClienteXMedicionCM PRIMARY KEY(idCliente, idMedicion),

			CONSTRAINT ClienteXMedicionC FOREIGN KEY (idCliente)
			REFERENCES TCliente (idCliente),

			CONSTRAINT ClienteXMedicionM FOREIGN KEY (idMedicion)
			REFERENCES TMediciones (idMedicion)
			)

CREATE TABLE ClienteXInstructor(
			idCliente VARCHAR(45) not null,
			idInstructor int not null
			CONSTRAINT ClienteXInstructorCI PRIMARY KEY (idCliente, idInstructor),
			
			CONSTRAINT ClienteXInstructorC FOREIGN KEY(idCliente)
			REFERENCES TCliente (idCliente),

			CONSTRAINT ClienteXInstructorInsructor FOREIGN KEY (idInstructor)
			REFERENCES TInstructor(idInstructor)
			)

CREATE TABLE PersonaXInstructor(
			idPersona VARCHAR(45) not null,
			idInstructor int not null
			CONSTRAINT PersonaXInstructorIP PRIMARY KEY (idPersona, idInstructor),
			
			CONSTRAINT PersonaXInstructorP FOREIGN KEY(idPersona)
			REFERENCES TPersona (idPersona),

			CONSTRAINT PersonaXInstructorI FOREIGN KEY (idInstructor)
			REFERENCES TInstructor(idInstructor)
			)

CREATE TABLE PersonaXUAdmin(
			idPersona VARCHAR(45) not null,
			idUsuario int not null
			CONSTRAINT PersonaXAdmin PRIMARY KEY (idPersona, idUsuario),
			
			CONSTRAINT PersonaXAdminP FOREIGN KEY(idPersona)
			REFERENCES TPersona (idPersona),

			CONSTRAINT PersonaXAdminUA FOREIGN KEY (idUsuario)
			REFERENCES TUAdministrativo(idUsuario)
			)

CREATE TABLE PersonaXCliente(
			idPersona VARCHAR(45) not null,
			idCliente VARCHAR(45) not null
			CONSTRAINT PersonaXClientePC PRIMARY KEY (idPersona, idCliente),
			
			CONSTRAINT PersonaXClienteP FOREIGN KEY(idPersona)
			REFERENCES TPersona (idPersona),

			CONSTRAINT PersonaXClienteC FOREIGN KEY (idCliente)
			REFERENCES TCliente(idCliente)
			)

-- Insertar persona ---
CREATE OR ALTER PROCEDURE insertar_persona (
	 @nombre varchar(45), @cedula varchar(45), @fechaNacimiento DATE, @email varchar(45), @telefono int
	)
AS
BEGIN
	DECLARE @idPersona VARCHAR(45)
	SET @idPersona = LEFT(@nombre, 2) + '-' + LEFT(@cedula,4) + '-' + RIGHT(@fechaNacimiento, 2)

	INSERT INTO TPersona VALUES(@idPersona, @nombre, @cedula, @fechaNacimiento, @email, @telefono)
END

--Ingresar 10 personas -- 

EXEC insertar_persona 'Juan', '118390739', '09-03-2002', 'juan.segura@gmail.com', 22440987
EXEC insertar_persona 'Pedro', '236547865', '12-12-2005', 'pedro.lalo@hotmail.com', 87654322
EXEC insertar_persona 'Alejandro', '22445678', '01-11-1998', 'papasconatun@gmail.com', 98765678
EXEC insertar_persona 'Giuliana', '125433456', '05-05-1988', 'peinadoazul@yahoo.com', 76678558
EXEC insertar_persona 'Lucia', '238777654', '30-12-1995', 'luciamesen@gmail.com', 90908776
EXEC insertar_persona 'Lucia Ramirez', '238777654', '1995-12-30', 'luciaramirez@example.com', 90908776;
EXEC insertar_persona 'Juan Pérez', '564321987', '1988-06-15', 'juanperez@example.com', 12345678;
EXEC insertar_persona 'María González', '789654123', '1990-03-05', 'maria.gonzalez@example.com', 98765432;
EXEC insertar_persona 'Pedro Martínez', '112233445', '1985-09-18', 'pedromartinez@example.com', 55556666;
EXEC insertar_persona 'Ana López', '777888999', '1977-07-22', 'ana.lopez@example.com', 99998888;
EXEC insertar_persona 'Carlos Fernandez', '456789012', '2000-04-10', 'carlosfernandez@example.com', 11112222;

SELECT * FROM TPersona

--Insertar Instructor--


--Insertar cliente--

CREATE OR ALTER PROCEDURE insertar_cliente (
	@idPersona VARCHAR(45), @estatura FLOAT, @sexo VARCHAR(1), @altoRiesgo VARCHAR(2), @idInstructor VARCHAR(45)
)
AS
BEGIN

	DECLARE @idCliente VARCHAR(45);
	SET @idCliente = @idPersona + '-' + @sexo + '-' + @altoRiesgo + '-' + LEFT(@idInstructor,2)

	INSERT INTO TCliente VALUES(@idCliente, @idPersona, @estatura, @sexo, @altoRiesgo, @idInstructor)

END

--Insertar cliente--

EXEC insertar_cliente 'Al-2244-11', 1.8, 'M', 'Si', 

--Calcular IMC de una persona fn_calcular_imc--

CREATE FUNCTION fn_calcular_imc (
    @estatura float,
	@peso float
	)
RETURNS int
AS
BEGIN
   
    DECLARE @IMC float

    SET @IMC = @peso / @estatura

    RETURN @IMC
END

--Ejecucion fn_calcular_imc--

SELECT dbo.fn_calcular_imc(5.2,10) AS Resultado

--Clasificar IMC--
CREATE or ALTER FUNCTION fn_clasificar_imc ( 

	@IMC FLOAT

)
RETURNS VARCHAR(45)
AS
BEGIN
	
	DECLARE @RESULTADO AS VARCHAR(45)

	IF @IMC < 18.5 BEGIN
		SET @RESULTADO =  'Bajo peso';
	END
	IF @IMC < 16 BEGIN
		SET @RESULTADO = 'Delgadez severa';
	END
	IF @IMC > 16 AND @IMC < 16.99 BEGIN
		SET @RESULTADO = 'Delgadez moderada';
	END
	IF @IMC >17 AND @IMC < 18.49 BEGIN
		SET @RESULTADO = 'Delgadez leve';
	END
	IF @IMC > 18.5 AND @IMC < 24.99 BEGIN
		SET @RESULTADO = 'Normal';
	END
	IF @IMC >= 25 BEGIN 
		SET @RESULTADO = 'Sobrepeso';
	END
	IF @IMC > 25 AND @IMC < 29.99 BEGIN
		SET @RESULTADO = 'Preobeso';
	END
	IF @IMC >= 30 BEGIN
		SET @RESULTADO = 'Obesidad';
	END
	IF @IMC > 30 AND @IMC < 34.99 BEGIN
		SET @RESULTADO = 'Obesidad leve';
	END
	IF @IMC > 35 AND @IMC <39.99 BEGIN
		SET @RESULTADO = 'Obesidad media';
	END
	IF @IMC >= 40 BEGIN
		SET @RESULTADO = 'Obesidad media';
	END

	RETURN @RESULTADO
END

Select CONVERT(date, GETDATE()) AS FechaActual

--Ejecucion fn_clasificar_imc--

SELECT dbo.fn_clasificar_imc(35) AS Resultado

-- Calcular la edad --

CREATE OR ALTER FUNCTION fn_edad (
	@fechaNacimiento DATE
)
RETURNS INT
AS
BEGIN
	DECLARE @fechaEntero INT;
	DECLARE @fheca INT
	DECLARE @resultado INT
	
	SET @fechaEntero = CONVERT(INT, YEAR(@fechaNacimiento));

	SET @fecha = YEAR(GETDATE())

	SET @resultado = @fecha - @fechaEntero;

	RETURN @resultado
END 

-- Ejecucion de fn_edad --

SELECT dbo.fn_edad ('09-03-2002')

-- Calcular vasos de agua -- 
CREATE OR ALTER FUNCTION fn_vasos_agua (
	@peso INT
)
RETURNS INT
AS
BEGIN
	DECLARE @cantVasos INT

	SET @cantVasos = @peso / 7;

	RETURN @cantVasos
END

SELECT dbo.fn_vasos_agua(70)

CREATE OR ALTER FUNCTION fn_cant_proteina (
	
)

CREATE PROCEDURE dbo.pa_obtener_medidas_ideales(
	@idMedicion
)
AS
BEGIN
	
	SELECT Sexo = 'M' FROM TCliente AS C 
	INNER JOIN
	TExpediente AS E 
	ON C.idCliente = E.idCliente



TMediciones(
			idMedicion int not null PRIMARY KEY,
			fecha date,
			hora time,
			peso float,
			porcentajeGrasa float,
			porcentajeGViceral float,
			IMC float
			)


TPersona(
			idPersona int not null PRIMARY KEY,
			nombre varchar(45),
			cedula int,
			fechaNacimiento DATE,
			email varchar(45),
			telefono int)

TCliente(
			idCliente VARCHAR(45) not null PRIMARY KEY,
			idPersona int not null,
			estatura float,
			sexo varchar(1),
			altoRiesgo varchar(2),
			idInstructor int not null,

			CONSTRAINT FK_PersonaCliente FOREIGN  KEY (idPersona)
			REFERENCES TPersona (idPersona),

			CONSTRAINT FK_InstructorCli FOREIGN KEY (idInstructor)
			REFERENCES TInstructor(idInstructor)

			CONSTRAINT FK_ExpedienteCli FOREIGN KEY (idExpediente)
			REFERENCES TExpediente(idExpediente)
			)

TExpediente(
			idExpediente int PRIMARY KEY,
			idCliente VARCHAR(45) not null,
			idMedicion int,
			idRutina int 

			CONSTRAINT FK_ExpedienteRutina FOREIGN KEY (idRutina)
			REFERENCES TRutina (idRutina),

			CONSTRAINT FK_ExpedienteCli FOREIGN KEY (idCliente)
			REFERENCES TCliente(idCliente),
			
			CONSTRAINT FK_ExpedienteMedi FOREIGN KEY (idMedicion)
			REFERENCES TMediciones(idMedicion)
			)