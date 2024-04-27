CREATE DATABASE ProyectoGymnasio

USE ProyectoGymnasio

CREATE TABLE TPersona(
			idPersona INT IDENTITY(1,1) PRIMARY KEY,
			nombre varchar(45),
			cedula INT,
			fechaNacimiento DATE,
			email varchar(45),
			telefono VARCHAR(45)
			)

CREATE TABLE TGymnasio (
			idGymnasio INT IDENTITY(1,1) PRIMARY KEY,
			marca VARCHAR(45) not null,
			telefonoGeneral VARCHAR(45),
			contacto VARCHAR(45)
			)
			
CREATE TABLE TSede(
			idSede INT IDENTITY(1,1) PRIMARY KEY,
			nomSede VARCHAR(45) not null,
			provincia VARCHAR(45) not null,
			canton VARCHAR(45) not null,
			email VARCHAR(45) not null,
			telefono1 VARCHAR(45) not null,
			telefono2 VARCHAR(45) not null,
			idGymnasio INT not null

			CONSTRAINT FK_Gym FOREIGN KEY (idGymnasio)
			REFERENCES TGymnasio(idGymnasio)
			)

CREATE TABLE TPagos(
			idPago INT IDENTITY(1,1) PRIMARY KEY,
			rol VARCHAR(45) not null,
			monto int not null)
			
CREATE TABLE TInstructor(
			idInstructor INT IDENTITY(1,1) PRIMARY KEY,
			idPersona INT NOT NULL,
			idPago INT NOT NULL,
			idSede INT NOT NULL,
			
			CONSTRAINT FK_PERSONA FOREIGN  KEY (idPersona)
			REFERENCES TPersona (idPersona),

			CONSTRAINT FK_Pago FOREIGN KEY (idPago)
			REFERENCES TPagos(idPago),

			CONSTRAINT FK_Sede FOREIGN KEY (idsede)
			REFERENCES TSede (idSede)
			)

CREATE TABLE TCertificaciones(
			idCertificacion INT IDENTITY(1,1) PRIMARY KEY,
			titulo varchar(45),
			idInstructor INT not null

			CONSTRAINT FK_InstructCert FOREIGN KEY (idInstructor)
			REFERENCES TInstructor(idInstructor)
			)

CREATE TABLE TUAdministrativo(
			idUsuario INT IDENTITY(1,1) PRIMARY KEY,
			idPersona INT not null,
			idPago INT not null

			CONSTRAINT FK_PersonaAdmin FOREIGN  KEY (idPersona)
			REFERENCES TPersona (idPersona),

			CONSTRAINT FK_PagoAmin FOREIGN KEY (idPago)
			REFERENCES TPagos(idPago)
			)

CREATE TABLE TMediciones(
			idMedicion INT IDENTITY(1,1) PRIMARY KEY,
			fecha date,
			hora time,
			peso float,
			porcentajeGrasa float,
			porcentajeGViceral float,
			IMC float )

CREATE TABLE TCliente(
			idCliente INT IDENTITY(1,1) PRIMARY KEY,
			idPersona INT not null,
			estatura float,
			sexo varchar(1),
			altoRiesgo varchar(2),
			idInstructor INT not null,

			CONSTRAINT FK_PersonaCliente FOREIGN KEY (idPersona)
			REFERENCES TPersona (idPersona),

			CONSTRAINT FK_InstructorCli FOREIGN KEY (idInstructor)
			REFERENCES TInstructor(idInstructor) )

CREATE TABLE TRutina(
			idRutina INT IDENTITY(1,1) PRIMARY KEY,
			ejercicion varchar(45),
			repeticiones int,
			idExpediente int 
			
			CONSTRAINT FK_ExpedienteRutina FOREIGN KEY (idExpediente)
			REFERENCES TExpediente (idExpediente)
			)
CREATE TABLE TExpediente(
			idExpediente INT IDENTITY(1,1) PRIMARY KEY,
			idCliente INT not null,
			idMedicion INT NOT NULL,
			 


			CONSTRAINT FK_ExpedienteCli FOREIGN KEY (idCliente)
			REFERENCES TCliente(idCliente),
			CONSTRAINT FK_ExpedienteMedi FOREIGN KEY (idMedicion)
			REFERENCES TMediciones(idMedicion) )

----- INTERMEDIAS
CREATE TABLE ExpedienteXCliente(
			idExpediente INT IDENTITY(1,1),
			idCliente INT NOT NULL,

			CONSTRAINT PK_ExpedienteXCliente PRIMARY KEY(idExpediente, idCliente),
			CONSTRAINT ExpeXcliente FOREIGN KEY (idExpediente)
			REFERENCES TExpediente(idExpediente),
			CONSTRAINT ClienteExpe FOREIGN KEY (idCliente)
			REFERENCES TCliente (idCliente) )

CREATE TABLE ExpedienteXMedicion(
			idExpediente INT IDENTITY(1,1),
			idMedicion INT NOT NULL,

			CONSTRAINT PK_ExpedienteXMedicion PRIMARY KEY(idExpediente, idMedicion),
			CONSTRAINT ExpeMedicion FOREIGN KEY (idExpediente)
			REFERENCES TExpediente(idExpediente),
			CONSTRAINT MedicionExpe FOREIGN KEY (idMedicion)
			REFERENCES TMediciones (idMedicion) )

CREATE TABLE ExpedienteXRutina(
			idExpediente INT IDENTITY(1,1),
			idRutina INT, 

			CONSTRAINT PK_ExpedienteXRutina PRIMARY KEY(idExpediente, idRutina),
			CONSTRAINT ExpeRutina FOREIGN KEY (idExpediente)
			REFERENCES TExpediente(idExpediente),
			CONSTRAINT RutinaExpe FOREIGN KEY (idRutina)
			REFERENCES TRutina (idRutina) )

CREATE TABLE SedeXGymnasio(
			idSede INT IDENTITY(1,1) not null,
			idGymnasio INT not null

			CONSTRAINT SedeXGym PRIMARY KEY (idSede, idGymnasio),
			CONSTRAINT FK_SedeXGymS FOREIGN KEY (idSede)
			REFERENCES TSede (idSede),
			CONSTRAINT FK_SedeXGymG FOREIGN KEY (idGymnasio)
			REFERENCES TGymnasio (idGymnasio) )

CREATE TABLE PagoXInstructor(
			idPago INT IDENTITY(1,1),
			idInstructor INT not null

			CONSTRAINT PagoXinstruc PRIMARY KEY(idPago, idInstructor),
			CONSTRAINT FK_PagoXInstrucP FOREIGN KEY (idPago)
			REFERENCES TPagos (idPago),
			CONSTRAINT FK_PagoXInstrucI FOREIGN KEY (idInstructor)
			REFERENCES TInstructor (idInstructor) )

CREATE TABLE CertificacionXInstructor(
			idCertificacion INT IDENTITY(1,1),
			idInstructor INT not null

			CONSTRAINT PagoXInstructorCI PRIMARY KEY(idCertificacion, idInstructor)
			CONSTRAINT FK_CertiXInstrucCer FOREIGN KEY (idCertificacion)
			REFERENCES TCertificaciones (idCertificacion),
			CONSTRAINT FK_CertiXInstrucI FOREIGN KEY (idInstructor)
			REFERENCES TInstructor (idInstructor) )

CREATE TABLE InstructorXSede(
			idInstructor INT IDENTITY(1,1),
			idSede INT not null

			CONSTRAINT InstructXSede PRIMARY KEY(idInstructor, idSede),
			CONSTRAINT FK_InstructorXSedeIns FOREIGN KEY (idInstructor)
			REFERENCES TInstructor (idInstructor),
			CONSTRAINT FK_InstructorXSedeSe FOREIGN KEY (idSede)
			REFERENCES TSede (idSede) )

CREATE TABLE PagoXUAdmin(
			idPago INT IDENTITY(1,1),
			idUsuario INT not null

			CONSTRAINT PagoXAdmin PRIMARY KEY(idPago, idUsuario),
			CONSTRAINT FK_PagoXUAdminU FOREIGN KEY (idUsuario)
			REFERENCES TUAdministrativo (idUsuario),
			CONSTRAINT FK_PagoXUAdminP FOREIGN KEY (idPago)
			REFERENCES TPagos (idPago) )

CREATE TABLE ClienteXMedicion(
			idCliente INT IDENTITY(1,1),
			idMedicion INT not null,

			CONSTRAINT ClienteXMedicionCM PRIMARY KEY(idCliente, idMedicion),
			CONSTRAINT ClienteXMedicionC FOREIGN KEY (idCliente)
			REFERENCES TCliente (idCliente),
			CONSTRAINT ClienteXMedicionM FOREIGN KEY (idMedicion)
			REFERENCES TMediciones (idMedicion) )

CREATE TABLE ClienteXInstructor(
			idCliente INT IDENTITY(1,1),
			idInstructor INT not null,

			CONSTRAINT ClienteXInstructorCI PRIMARY KEY (idCliente, idInstructor),
			CONSTRAINT ClienteXInstructorC FOREIGN KEY(idCliente)
			REFERENCES TCliente (idCliente),
			CONSTRAINT ClienteXInstructorInsructor FOREIGN KEY (idInstructor)
			REFERENCES TInstructor(idInstructor) )

CREATE TABLE PersonaXInstructor(
			idPersona INT IDENTITY(1,1),
			idInstructor INT not null

			CONSTRAINT PersonaXInstructorIP PRIMARY KEY (idPersona, idInstructor),
			CONSTRAINT PersonaXInstructorP FOREIGN KEY(idPersona)
			REFERENCES TPersona (idPersona),
			CONSTRAINT PersonaXInstructorI FOREIGN KEY (idInstructor)
			REFERENCES TInstructor(idInstructor) )

CREATE TABLE PersonaXUAdmin(
			idPersona INT IDENTITY(1,1),
			idUsuario INT not null

			CONSTRAINT PersonaXAdmin PRIMARY KEY (idPersona, idUsuario),
			CONSTRAINT PersonaXAdminP FOREIGN KEY(idPersona)
			REFERENCES TPersona (idPersona),
			CONSTRAINT PersonaXAdminUA FOREIGN KEY (idUsuario)
			REFERENCES TUAdministrativo(idUsuario) )

CREATE TABLE PersonaXCliente(
			idPersona INT IDENTITY(1,1),
			idCliente INT not null

			CONSTRAINT PersonaXClientePC PRIMARY KEY (idPersona, idCliente),
			CONSTRAINT PersonaXClienteP FOREIGN KEY(idPersona)
			REFERENCES TPersona (idPersona),
			CONSTRAINT PersonaXClienteC FOREIGN KEY (idCliente)
			REFERENCES TCliente(idCliente) )

