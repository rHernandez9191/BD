USE ProyectoGym

CREATE TABLE TPersona(
			idPersona int not null PRIMARY KEY,
			nombre varchar(45),
			cedula int,
			fechaNacimiento DATE,
			email varchar(45),
			telefono int)

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
			idPersona int,
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
			idPersona int not null,
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
			porcentajeGViceral float
			)

CREATE TABLE TCliente(
			idCliente int not null PRIMARY KEY,
			idPersona int not null,
			estatura float,
			sexo varchar(1),
			altoRiesgo varchar(2),
			idInstructor int not null,

			CONSTRAINT FK_PersonaCliente FOREIGN  KEY (idPersona)
			REFERENCES TPersona (idPersona),

			CONSTRAINT FK_InstructorCli FOREIGN KEY (idInstructor)
			REFERENCES TInstructor(idInstructor)
			)

CREATE TABLE TExpediente(
			idExpediente int PRIMARY KEY,
			idCliente int not null,
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
			idCliente int not null,
			idMedicion int not null,
			CONSTRAINT ClienteXMedicionCM PRIMARY KEY(idCliente, idMedicion),

			CONSTRAINT ClienteXMedicionC FOREIGN KEY (idCliente)
			REFERENCES TCliente (idCliente),

			CONSTRAINT ClienteXMedicionM FOREIGN KEY (idMedicion)
			REFERENCES TMediciones (idMedicion)
			)

CREATE TABLE ClienteXInstructor(
			idCliente int not null,
			idInstructor int not null
			CONSTRAINT ClienteXInstructorCI PRIMARY KEY (idCliente, idInstructor),
			
			CONSTRAINT ClienteXInstructorC FOREIGN KEY(idCliente)
			REFERENCES TCliente (idCliente),

			CONSTRAINT ClienteXInstructorInsructor FOREIGN KEY (idInstructor)
			REFERENCES TInstructor(idInstructor)
			)

CREATE TABLE PersonaXInstructor(
			idPersona int not null,
			idInstructor int not null
			CONSTRAINT PersonaXInstructorIP PRIMARY KEY (idPersona, idInstructor),
			
			CONSTRAINT PersonaXInstructorP FOREIGN KEY(idPersona)
			REFERENCES TPersona (idPersona),

			CONSTRAINT PersonaXInstructorI FOREIGN KEY (idInstructor)
			REFERENCES TInstructor(idInstructor)
			)

CREATE TABLE PersonaXUAdmin(
			idPersona int not null,
			idUsuario int not null
			CONSTRAINT PersonaXAdmin PRIMARY KEY (idPersona, idUsuario),
			
			CONSTRAINT PersonaXAdminP FOREIGN KEY(idPersona)
			REFERENCES TPersona (idPersona),

			CONSTRAINT PersonaXAdminUA FOREIGN KEY (idUsuario)
			REFERENCES TUAdministrativo(idUsuario)
			)

CREATE TABLE PersonaXCliente(
			idPersona int not null,
			idCliente int not null
			CONSTRAINT PersonaXClientePC PRIMARY KEY (idPersona, idCliente),
			
			CONSTRAINT PersonaXClienteP FOREIGN KEY(idPersona)
			REFERENCES TPersona (idPersona),

			CONSTRAINT PersonaXClienteC FOREIGN KEY (idCliente)
			REFERENCES TCliente(idCliente)
			)