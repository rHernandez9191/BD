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
			idGymnasio VARCHAR(45) not null PRIMARY KEY,
			marca VARCHAR(45) not null,
			telefonoGeneral VARCHAR(45),
			contacto VARCHAR(45)
			)
			
CREATE TABLE TSede(
			idSede VARCHAR(45) not null PRIMARY KEY,
			nomSede VARCHAR(45) not null,
			provincia VARCHAR(45) not null,
			canton VARCHAR(45) not null,
			email VARCHAR(45) not null,
			telefono1 VARCHAR(45) not null,
			telefono2 VARCHAR(45) not null,
			idGymnasio VARCHAR(45) not null

			CONSTRAINT FK_Gym FOREIGN KEY (idGymnasio)
			REFERENCES TGymnasio(idGymnasio)
			)

CREATE TABLE TPagos(
			idPago VARCHAR(45) not null PRIMARY KEY,
			rol VARCHAR(45) not null,
			monto int not null)
			
CREATE TABLE TInstructor(
			idInstructor VARCHAR(45) not null PRIMARY KEY,
			idPersona VARCHAR(45),
			idPago VARCHAR(45),
			idSede VARCHAR(45)
			
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
			idInstructor VARCHAR(45) not null

			CONSTRAINT FK_InstructCert FOREIGN KEY (idInstructor)
			REFERENCES TInstructor(idInstructor)
			)

CREATE TABLE TUAdministrativo(
			idUsuario int not null PRIMARY KEY,
			idPersona VARCHAR(45) not null,
			idPago VARCHAR(45) not null

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
			REFERENCES TInstructor(idInstructor) )

CREATE TABLE TRutina(
			idRutina int PRIMARY KEY,
			ejercicion varchar(45),
			repeticiones int )

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
			REFERENCES TMediciones(idMedicion) )

----- INTERMEDIAS
CREATE TABLE ExpedienteXCliente(
			idExpediente int,
			idCliente VARCHAR(45)

			CONSTRAINT PK_ExpedienteXCliente PRIMARY KEY(idExpediente, idCliente),
			CONSTRAINT ExpeXcliente FOREIGN KEY (idExpediente)
			REFERENCES TExpediente(idExpediente),
			CONSTRAINT ClienteExpe FOREIGN KEY (idCliente)
			REFERENCES TCliente (idCliente) )

CREATE TABLE ExpedienteXMedicion(
			idExpediente int,
			idMedicion int

			CONSTRAINT PK_ExpedienteXMedicion PRIMARY KEY(idExpediente, idMedicion),
			CONSTRAINT ExpeMedicion FOREIGN KEY (idExpediente)
			REFERENCES TExpediente(idExpediente),
			CONSTRAINT MedicionExpe FOREIGN KEY (idMedicion)
			REFERENCES TMediciones (idMedicion) )

CREATE TABLE ExpedienteXRutina(
			idExpediente int,
			idRutina int

			CONSTRAINT PK_ExpedienteXRutina PRIMARY KEY(idExpediente, idRutina),
			CONSTRAINT ExpeRutina FOREIGN KEY (idExpediente)
			REFERENCES TExpediente(idExpediente),
			CONSTRAINT RutinaExpe FOREIGN KEY (idRutina)
			REFERENCES TRutina (idRutina) )

CREATE TABLE SedeXGymnasio(
			idSede VARCHAR(45) not null,
			idGymnasio VARCHAR(45) not null

			CONSTRAINT SedeXGym PRIMARY KEY (idSede, idGymnasio),
			CONSTRAINT FK_SedeXGymS FOREIGN KEY (idSede)
			REFERENCES TSede (idSede),
			CONSTRAINT FK_SedeXGymG FOREIGN KEY (idGymnasio)
			REFERENCES TGymnasio (idGymnasio) )

CREATE TABLE PagoXInstructor(
			idPago VARCHAR(45) not null,
			idInstructor VARCHAR(45) not null

			CONSTRAINT PagoXinstruc PRIMARY KEY(idPago, idInstructor),
			CONSTRAINT FK_PagoXInstrucP FOREIGN KEY (idPago)
			REFERENCES TPagos (idPago),
			CONSTRAINT FK_PagoXInstrucI FOREIGN KEY (idInstructor)
			REFERENCES TInstructor (idInstructor) )

CREATE TABLE CertificacionXInstructor(
			idCertificacion int not null,
			idInstructor VARCHAR(45) not null

			CONSTRAINT PagoXInstructorCI PRIMARY KEY(idCertificacion, idInstructor)
			CONSTRAINT FK_CertiXInstrucCer FOREIGN KEY (idCertificacion)
			REFERENCES TCertificaciones (idCertificacion),
			CONSTRAINT FK_CertiXInstrucI FOREIGN KEY (idInstructor)
			REFERENCES TInstructor (idInstructor) )

CREATE TABLE InstructorXSede(
			idInstructor VARCHAR(45) not null,
			idSede VARCHAR(45) not null

			CONSTRAINT InstructXSede PRIMARY KEY(idInstructor, idSede),
			CONSTRAINT FK_InstructorXSedeIns FOREIGN KEY (idInstructor)
			REFERENCES TInstructor (idInstructor),
			CONSTRAINT FK_InstructorXSedeSe FOREIGN KEY (idSede)
			REFERENCES TSede (idSede) )

CREATE TABLE PagoXUAdmin(
			idPago VARCHAR(45) not null,
			idUsuario int not null

			CONSTRAINT PagoXAdmin PRIMARY KEY(idPago, idUsuario),
			CONSTRAINT FK_PagoXUAdminU FOREIGN KEY (idUsuario)
			REFERENCES TUAdministrativo (idUsuario),
			CONSTRAINT FK_PagoXUAdminP FOREIGN KEY (idPago)
			REFERENCES TPagos (idPago) )

CREATE TABLE ClienteXMedicion(
			idCliente VARCHAR(45) not null,
			idMedicion int not null,

			CONSTRAINT ClienteXMedicionCM PRIMARY KEY(idCliente, idMedicion),
			CONSTRAINT ClienteXMedicionC FOREIGN KEY (idCliente)
			REFERENCES TCliente (idCliente),
			CONSTRAINT ClienteXMedicionM FOREIGN KEY (idMedicion)
			REFERENCES TMediciones (idMedicion) )

CREATE TABLE ClienteXInstructor(
			idCliente VARCHAR(45) not null,
			idInstructor VARCHAR(45) not null

			CONSTRAINT ClienteXInstructorCI PRIMARY KEY (idCliente, idInstructor),
			CONSTRAINT ClienteXInstructorC FOREIGN KEY(idCliente)
			REFERENCES TCliente (idCliente),
			CONSTRAINT ClienteXInstructorInsructor FOREIGN KEY (idInstructor)
			REFERENCES TInstructor(idInstructor) )

CREATE TABLE PersonaXInstructor(
			idPersona VARCHAR(45) not null,
			idInstructor VARCHAR(45) not null

			CONSTRAINT PersonaXInstructorIP PRIMARY KEY (idPersona, idInstructor),
			CONSTRAINT PersonaXInstructorP FOREIGN KEY(idPersona)
			REFERENCES TPersona (idPersona),
			CONSTRAINT PersonaXInstructorI FOREIGN KEY (idInstructor)
			REFERENCES TInstructor(idInstructor) )

CREATE TABLE PersonaXUAdmin(
			idPersona VARCHAR(45) not null,
			idUsuario int not null

			CONSTRAINT PersonaXAdmin PRIMARY KEY (idPersona, idUsuario),
			CONSTRAINT PersonaXAdminP FOREIGN KEY(idPersona)
			REFERENCES TPersona (idPersona),
			CONSTRAINT PersonaXAdminUA FOREIGN KEY (idUsuario)
			REFERENCES TUAdministrativo(idUsuario) )

CREATE TABLE PersonaXCliente(
			idPersona VARCHAR(45) not null,
			idCliente VARCHAR(45) not null

			CONSTRAINT PersonaXClientePC PRIMARY KEY (idPersona, idCliente),
			CONSTRAINT PersonaXClienteP FOREIGN KEY(idPersona)
			REFERENCES TPersona (idPersona),
			CONSTRAINT PersonaXClienteC FOREIGN KEY (idCliente)
			REFERENCES TCliente(idCliente) )