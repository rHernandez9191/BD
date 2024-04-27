USE ProyectoGymnasio
-----------------------------------------------------------------------------
-----------------------------------INSERTS-----------------------------------
-----------------------------------------------------------------------------

-- Insertar persona ---
CREATE OR ALTER PROCEDURE insertar_persona (
	 @nombre varchar(45), @cedula INT, @fechaNacimiento DATE, @email varchar(45), @telefono VARCHAR(45) )
AS
BEGIN
	INSERT INTO TPersona VALUES(@nombre, @cedula, @fechaNacimiento, @email, @telefono)
END

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
EXEC insertar_pago 'Nutricionista', 150000;
EXEC insertar_pago 'Fisioterapeuta', 180000;
EXEC insertar_pago 'Masajista', 100000;
EXEC insertar_pago 'Preparador Físico', 220000;


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
EXEC insertar_gymnasio 'Gimnasio Fitness Club', '12345678', 'Laura García';
EXEC insertar_gymnasio 'BodyTech', '98765432', 'Juan Pérez';
EXEC insertar_gymnasio 'Gimnasio Wellness', '87654321', 'María Martínez';
EXEC insertar_gymnasio 'GymXtreme', '56781234', 'Carlos Rodríguez';
EXEC insertar_gymnasio 'Gimnasio PowerFit', '34567890', 'Ana Gómez';

--Insertar sede--
CREATE OR ALTER PROCEDURE insertar_sede (
	@nomSede VARCHAR(45), @provincia VARCHAR(45), @canton VARCHAR(45), @email VARCHAR(45), @telefono1 VARCHAR(45), @telefono2 VARCHAR(45), @idGymnasio INT )
AS
BEGIN
	INSERT INTO TSede VALUES(@nomSede, @provincia, @canton, @email, @telefono1, @telefono2, @idGymnasio)
END

--Insertar Sede--
EXEC insertar_sede 'Sede central', 'San jose', 'San Jose', 'arrozconmango@gmail.com', '89676545', '89348765', 1
EXEC insertar_sede 'Sede norte', 'Alajuela', 'Alajuela', 'contacto_norte@gmail.com', '76543210', '98765432', 3;
EXEC insertar_sede 'Sede sur', 'Puntarenas', 'Puntarenas', 'contacto_sur@gmail.com', '87654321', '67890123', 5;
EXEC insertar_sede 'Sede este', 'Limón', 'Limón', 'contacto_este@gmail.com', '65432109', '56789012', 8;
EXEC insertar_sede 'Sede oeste', 'Guanacaste', 'Liberia', 'contacto_oeste@gmail.com', '54321098', '45678901', 2;
EXEC insertar_sede 'Sede central 2', 'San José', 'San José', 'contacto_central2@gmail.com', '43210987', '34567890', 4;
EXEC insertar_sede 'Sede pacífico', 'Puntarenas', 'Golfito', 'contacto_pacifico@gmail.com', '32109876', '23456789', 7;
EXEC insertar_sede 'Sede montaña', 'Cartago', 'Cartago', 'contacto_montaña@gmail.com', '21098765', '12345678', 6;
EXEC insertar_sede 'Sede caribe', 'Limón', 'Limón', 'contacto_caribe@gmail.com', '10987654', '01234567', 9;
EXEC insertar_sede 'Sede metropolitana', 'San José', 'Desamparados', 'contacto_metropolitana@gmail.com', '09876543', '90123456', 10;
	
----Insertar instructor----
CREATE OR ALTER PROCEDURE insertar_instructor(@idPersona INT, @idPago INT, @idSede INT)
AS
BEGIN 
	INSERT INTO TInstructor VALUES(@idPersona, @idPago, @idSede)
END
----Insertar instructor----
EXEC insertar_instructor 1, 2, 1
EXEC insertar_instructor 2, 3, 2;
EXEC insertar_instructor 3, 4, 3;
EXEC insertar_instructor 4, 5, 4;
EXEC insertar_instructor 5, 2, 5;
SELECT * FROM TInstructor
--Insertar cliente--
CREATE OR ALTER PROCEDURE insertar_cliente (
	@idPersona INT, @estatura FLOAT, @sexo VARCHAR(1), @altoRiesgo VARCHAR(2), @idInstructor INT)
AS
BEGIN
	INSERT INTO TCliente VALUES(@idPersona, @estatura, @sexo, @altoRiesgo, @idInstructor)
END

--Insertar cliente--
EXEC insertar_cliente 6, 1.8, 'M', 'Si', 1
EXEC insertar_cliente 7, 1.75, 'M', 'No', 2;
EXEC insertar_cliente 8, 1.65, 'F', 'Si', 3;
EXEC insertar_cliente 9, 1.70, 'M', 'No', 4;
EXEC insertar_cliente 10, 1.60, 'F', 'Si', 5;

----Insertar certificaciones----
CREATE OR ALTER PROCEDURE insertar_certificaciones (@titulo VARCHAR(45), @idInstructor INT)
AS
BEGIN
	INSERT INTO TCertificaciones VALUES (@titulo, @idInstructor)
END

----Insertar certificaciones----
EXEC insertar_certificaciones 'Entrenador personal', 1
EXEC insertar_certificaciones 'Entrenador personal', 2;
EXEC insertar_certificaciones 'Entrenador personal', 3;
EXEC insertar_certificaciones 'Gerente', 4;
EXEC insertar_certificaciones 'Cajero', 5;

----Insertar UAdministrativo----
CREATE OR ALTER PROCEDURE insertar_UAdministrativo(@idPersona INT, @idPago INT)
AS
BEGIN
	INSERT INTO TUAdministrativo VALUES(@idPersona, @idPago)
END

----Insertar UAdministrativo----
EXEC insertar_UAdministrativo 24, 3

----Insertar mediciones----
CREATE OR ALTER PROCEDURE insertar_mediciones(@fecha DATE, @hora TIME, @peso FLOAT, @porcentajeGrasa FLOAT, @porcentajeGViceral FLOAT, @IMC FLOAT, @idCliente INT)
AS
BEGIN
	INSERT INTO TMediciones VALUES(@fecha, @hora, @peso, @porcentajeGrasa, @porcentajeGViceral,@IMC, @idCliente)
END

----Insertar mediciones----
EXEC insertar_mediciones '2024-10-30', '12:50:01', 70, 25, 15, 20, 6
EXEC insertar_mediciones '2024-09-30', '10:30:15', 72, 24, 14, 21, 7;
EXEC insertar_mediciones '2024-01-30', '11:20:30', 68, 26, 16, 19, 8;
EXEC insertar_mediciones '2024-12-29', '14:15:45', 75, 23, 13, 22, 9;
EXEC insertar_mediciones '2024-05-28', '13:40:20', 69, 27, 17, 18, 10;
EXEC insertar_mediciones '2024-07-27', '09:45:55', 71, 25, 15, 20, 6;
EXEC insertar_mediciones '2024-11-26', '16:55:10', 73, 22, 12, 23, 7;
EXEC insertar_mediciones '2024-02-25', '08:10:25', 67, 28, 18, 17, 8;
EXEC insertar_mediciones '2024-08-24', '17:25:40', 74, 21, 11, 24, 9;
EXEC insertar_mediciones '2024-12-23', '09:30:55', 70, 26, 16, 19, 10;
EXEC insertar_mediciones '2024-10-22', '12:45:10', 76, 20, 10, 25, 6;
EXEC insertar_mediciones '2024-02-21', '15:00:25', 68, 27, 17, 18, 7;
EXEC insertar_mediciones '2024-04-20', '10:15:40', 72, 24, 14, 21, 8;
EXEC insertar_mediciones '2024-09-19', '13:30:55', 66, 28, 18, 17, 9;
EXEC insertar_mediciones '2024-07-18', '11:45:10', 70, 25, 15, 20, 10;
EXEC insertar_mediciones '2024-12-17', '14:00:25', 77, 19, 9, 26, 6;

----Insertar expediente----
CREATE OR ALTER PROCEDURE insertar_expediente (@idCliente INT)
AS
BEGIN
	INSERT INTO TExpediente VALUES(@idCliente)
END

----Insertar expediente----
EXEC insertar_expediente 6
EXEC insertar_expediente 7
EXEC insertar_expediente 8
EXEC insertar_expediente 9
EXEC insertar_expediente 10

----Insertar rutina----
CREATE OR ALTER PROCEDURE insertar_rutina (@ejercicion VARCHAR(45), @repeticiones INT, @idExpediente INT)
AS
BEGIN
	INSERT INTO TRutina VALUES(@ejercicion, @repeticiones, @idExpediente)
END

----Insertar rutina----
EXEC insertar_rutina 'Sentadillas', 12, 1
EXEC insertar_rutina 'Flexiones de brazos', 15, 2
EXEC insertar_rutina 'Plancha abdominal', 30, 3
EXEC insertar_rutina 'Dominadas', 8, 4
EXEC insertar_rutina 'Curl de bíceps', 12, 5
EXEC insertar_rutina 'Fondos en paralelas', 10, 1
EXEC insertar_rutina 'Mountain climbers', 20, 2
EXEC insertar_rutina 'Elevación de piernas', 15, 3
EXEC insertar_rutina 'Press militar', 10, 4
EXEC insertar_rutina 'Burpees', 20, 5
EXEC insertar_rutina 'Zancadas', 12, 1
EXEC insertar_rutina 'Crunches', 25, 2
EXEC insertar_rutina 'Remo con barra', 12, 3
EXEC insertar_rutina 'Peso muerto', 8, 4
EXEC insertar_rutina 'Hip thrust', 12, 5
EXEC insertar_rutina 'Prensa de piernas', 15, 1
EXEC insertar_rutina 'Elevación lateral de hombros', 12, 2
EXEC insertar_rutina 'Sentadilla sumo', 10, 3
EXEC insertar_rutina 'Elevación de talones', 20, 4
EXEC insertar_rutina 'Plancha lateral', 30, 5
EXEC insertar_rutina 'Escalador', 20, 1















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
