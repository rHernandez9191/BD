USE ProyectoGymnasio

--Calcular IMC de una persona fn_calcular_imc--
CREATE OR ALTER FUNCTION fn_calcular_imc ( @estatura float, @peso float )
RETURNS FLOAT
AS
BEGIN
    DECLARE @IMC float
    SET @IMC = @peso/POWER(@estatura, 2) 
    RETURN @IMC
END

--Ejecucion fn_calcular_imc--
SELECT dbo.fn_calcular_imc(1.7,70) AS Resultado

--Clasificar IMC--
CREATE or ALTER FUNCTION fn_clasificar_imc ( @IMC FLOAT )
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

--Ejecucion fn_clasificar_imc--
SELECT dbo.fn_clasificar_imc(35) AS Resultado

-- Calcular la edad --
CREATE OR ALTER FUNCTION fn_edad ( @fechaNacimiento DATE )
RETURNS INT
AS
BEGIN
	DECLARE @fechaEntero INT;
	DECLARE @fecHa INT
	DECLARE @resultado INT
	
	SET @fechaEntero = CONVERT(INT, YEAR(@fechaNacimiento));

	SET @fecha = YEAR(GETDATE())

	SET @resultado = @fecha - @fechaEntero;

	RETURN @resultado
END 

-- Ejecucion de fn_edad --

SELECT dbo.fn_edad ('09-03-2002')

-- Calcular vasos de agua -- 
CREATE OR ALTER FUNCTION fn_vasos_agua ( @peso INT )
RETURNS INT
AS
BEGIN
	DECLARE @cantVasos INT

	SET @cantVasos = @peso / 7;

	RETURN @cantVasos
END

SELECT dbo.fn_vasos_agua(70)

----Cantidad de proteina----
CREATE OR ALTER FUNCTION fn_cant_proteina(@sexo VARCHAR(1), @peso INT)
RETURNS INT 
AS
BEGIN
	DECLARE @resultado INT
	IF (@sexo = 'H')
		SET @resultado = @peso * 2.5
	ELSE IF (@sexo = 'M')
		SET @resultado = @peso * 1.8
	RETURN @resultado
END

----Cantidad de proteina----
SELECT dbo.fn_cant_proteina('M', 70)

----Medidas ideales----
CREATE OR ALTER PROCEDURE medidas_ideales(@estatura FLOAT, @sexo VARCHAR(1), @imc FLOAT, @grasaCorporal FLOAT, @grasaViseral FLOAT)
AS
BEGIN
	---select de la pasada medicion para saber si mejoro---
	DECLARE @resultadoIMC VARCHAR(45)
	DECLARE @resultadoGrasaCorporal VARCHAR(45)
	DECLARE @resultadoGrasaViseral VARCHAR(45)

	CREATE TABLE TResultados (IMC VARCHAR(45), GrasaCorporal VARCHAR(45), GrasaViseral VARCHAR(45))

	IF (@sexo = 'H')
		IF (@estatura  >= 160 AND @estatura < 190)
			IF (@imc < 18.5)
				SET @resultadoIMC = 'Bajo'
			ELSE IF (@imc > 18.5 AND @imc <24.9)
				SET @resultadoIMC = 'Dentro del rango'
			ELSE IF (@imc > 24.9)
				SET @resultadoIMC = 'Alto'
	ELSE IF (@sexo = 'M')
		IF (@estatura >= 150 AND @estatura < 180)
			IF (@imc < 18.5)
				SET @resultadoIMC = 'Bajo'
			ELSE IF (@imc > 18.5 AND @imc <24.9)
				SET @resultadoIMC = 'Dentro del rango'
			ELSE IF (@imc > 24.9)
				SET @resultadoIMC = 'Alto'

	IF (@sexo = 'H')
		IF (@estatura >= 160 AND @estatura < 190)
			IF (@grasaCorporal < 10)
				SET @resultadoGrasaCorporal = 'Bajo'
			ELSE IF (@grasaCorporal >= 10 AND @grasaCorporal < 20)
				SET @resultadoGrasaCorporal = 'Dentro del rango'
			ELSE IF (@grasaCorporal > 20)
				SET @resultadoGrasaCorporal = 'Alto'
	ELSE IF (@sexo = 'M')
		IF (@estatura >= 150 AND @estatura < 180)
			IF (@grasaCorporal < 18)
				SET @resultadoGrasaCorporal = 'Bajo '
			ELSE IF (@grasaCorporal >18 AND @grasaCorporal < 28)
				SET @resultadoGrasaCorporal = 'Dentro del rango'
			ELSE IF (@grasaCorporal > 28)
				SET @resultadoGrasaCorporal = 'Alto'

	IF (@sexo = 'H')
		IF(@estatura > 160 AND @estatura < 190)
			IF (@grasaViseral < 10)
				SET @resultadoGrasaViseral = 'Bajo'
			IF (@grasaViseral = 10)
				SET @resultadoGrasaViseral = 'Dentro del rango'
			IF (@grasaViseral > 10)
				SET @resultadoGrasaViseral = 'Alto'
	IF (@sexo = 'M')
		IF (@estatura > 150 AND @estatura < 180)
			IF (@grasaViseral < 15)
				SET @resultadoGrasaViseral = 'Bajo'
			IF (@grasaViseral = 15)
				SET @resultadoGrasaViseral = 'Dentro del rango'
			IF (@grasaViseral > 15)
				SET @resultadoGrasaViseral = 'Alto'

		INSERT INTO TResultados VALUES(@resultadoIMC, @resultadoGrasaCorporal, @resultadoGrasaViseral)
		SELECT * FROM TResultados
		DROP TABLE TResultados

END

----Mostrar medidas ideales---
EXEC medidas_ideales 170,'H',20,15,10

----Mostrar evolucion---- 

--Esta funcion resuelve el caso en que se inserten las medidas al reves, refiriendose a fechas--

CREATE OR ALTER PROCEDURE evolucion_medidas (@idMedicion1 INT, @idMedicion2 INT)
AS
BEGIN
	DECLARE @idPrmed INT
	DECLARE @idSegmed INT
	DECLARE @fecha DATE
	DECLARE @peso FLOAT 
	DECLARE @porcentajeGrasa FLOAT 
	DECLARE @porcentajeGViseral FLOAT
	DECLARE @IMC FLOAT
	DECLARE @R1 VARCHAR(45)
	DECLARE @R2 VARCHAR(45)
	DECLARE @R3 VARCHAR(45)
	DECLARE @R4 VARCHAR(45)

	CREATE TABLE TResultados (ID INT IDENTITY (1,1) PRIMARY KEY, peso VARCHAR(45), porcentajeGrasa VARCHAR(45), porcentajeGrasaViseral VARCHAR(45), IMC VARCHAR(45))
	
	--Verifica que sean del mismo cliente antes que todo--
	IF ((SELECT idCliente FROM TMediciones WHERE idMedicion = @idMedicion1) = (SELECT idCliente FROM TMediciones WHERE idMedicion = @idMedicion2))
		BEGIN

		--Asigna segun antiguedad y resuelve si se insertaron las mediciones al reves--
		IF ((SELECT fecha FROM TMediciones WHERE idMedicion = @idMedicion1) > (SELECT fecha FROM TMediciones WHERE idMedicion = @idMedicion2))
			BEGIN
				SET @idPrmed = @idMedicion2
				SET @idSegmed = @idMedicion1
			SET @peso = (SELECT peso FROM TMediciones WHERE idMedicion = @idPrmed) - (SELECT peso FROM TMediciones WHERE idMedicion = @idSegmed)
			SET @porcentajeGrasa = (SELECT porcentajeGrasa FROM TMediciones WHERE idMedicion = @idPrmed) - (SELECT porcentajeGrasa FROM TMediciones WHERE idMedicion = @idSegmed)
			SET @porcentajeGViseral = (SELECT porcentajeGViceral FROM TMediciones WHERE idMedicion = @idPrmed) - (SELECT porcentajeGViceral FROM TMediciones WHERE idMedicion = @idSegmed)
			SET @IMC = (SELECT IMC FROM TMediciones WHERE idMedicion = @idPrmed) - (SELECT IMC FROM TMediciones WHERE idMedicion = @idSegmed)
					IF (@peso < 0)  
					BEGIN
						SET @R1 = 'Aumento ' + CAST(ABS(@peso) AS nvarchar)
					END
					ELSE IF (@peso > 0)
					BEGIN
						SET @R1 = 'Disminuyo ' + CAST(@peso AS nvarchar)
					END
					IF (@porcentajeGrasa < 0) 
					BEGIN
						SET @R2 = 'Aumento ' + CAST(ABS(@porcentajeGrasa) AS nvarchar)
					END
					ELSE IF (@porcentajeGrasa > 0)
					BEGIN
						SET @R2 = 'Disminuyo ' + CAST(@porcentajeGrasa AS nvarchar)
					END
					IF (@porcentajeGViseral < 0)
					BEGIN
						SET @R3 = 'Aumento ' + CAST(ABS(@porcentajeGViseral) AS nvarchar)
					END
					ELSE IF (@porcentajeGViseral > 0)
					BEGIN
						SET @R3 = 'Disminuyo ' + CAST(@porcentajeGViseral AS nvarchar)
					END
					IF (@IMC < 0)
					BEGIN
						SET @R4 = 'Aumento ' + CAST(ABS(@IMC) as nvarchar)
					END
					ELSE IF (@IMC > 0)
					BEGIN
						SET @R4 = 'Disminuyo ' + CAST(@IMC as nvarchar)
					END
			INSERT INTO TResultados VALUES(@R1, @R2, @R3, @R4)
			SELECT*FROM TResultados
			DROP TABLE TResultados
			END
		ELSE
			BEGIN
					SET @idPrmed = @idMedicion1
					SET @idSegmed = @idMedicion2
			SET @peso = (SELECT peso FROM TMediciones WHERE idMedicion = @idPrmed) - (SELECT peso FROM TMediciones WHERE idMedicion = @idSegmed)
			SET @porcentajeGrasa = (SELECT porcentajeGrasa FROM TMediciones WHERE idMedicion = @idPrmed) - (SELECT porcentajeGrasa FROM TMediciones WHERE idMedicion = @idSegmed)
			SET @porcentajeGViseral = (SELECT porcentajeGViceral FROM TMediciones WHERE idMedicion = @idPrmed) - (SELECT porcentajeGViceral FROM TMediciones WHERE idMedicion = @idSegmed)
			SET @IMC = (SELECT IMC FROM TMediciones WHERE idMedicion = @idPrmed) - (SELECT IMC FROM TMediciones WHERE idMedicion = @idSegmed)
					IF (@peso < 0)  
					BEGIN
						SET @R1 = 'Aumento ' + CAST(ABS(@peso) AS nvarchar)
					END
					ELSE IF (@peso > 0)
					BEGIN
						SET @R1 = 'Disminuyo ' + CAST(@peso AS nvarchar)
					END
					IF (@porcentajeGrasa < 0) 
					BEGIN
						SET @R2 = 'Aumento ' + CAST(ABS(@porcentajeGrasa) AS nvarchar)
					END
					ELSE IF (@porcentajeGrasa > 0)
					BEGIN
						SET @R2 = 'Disminuyo ' + CAST(@porcentajeGrasa AS nvarchar)
					END
					IF (@porcentajeGViseral < 0)
					BEGIN
						SET @R3 = 'Aumento ' + CAST(ABS(@porcentajeGViseral) AS nvarchar)
					END
					ELSE IF (@porcentajeGViseral > 0)
					BEGIN
						SET @R3 = 'Disminuyo ' + CAST(@porcentajeGViseral AS nvarchar)
					END
					IF (@IMC < 0)
					BEGIN
						SET @R4 = 'Aumento ' + CAST(ABS(@IMC) as nvarchar)
					END
					ELSE IF (@IMC > 0)
					BEGIN
						SET @R4 = 'Disminuyo ' + CAST(@IMC as nvarchar)
					END
			INSERT INTO TResultados VALUES(@R1, @R2, @R3, @R4)
			SELECT*FROM TResultados
			DROP TABLE TResultados
			END
		END
	ELSE 
		PRINT 'Las mediciones no son del mismo cliente'
END

EXEC evolucion_medidas 7,2

SELECT *FROM TMediciones

------Procedimiento Creacion de Rutina-----
CREATE OR ALTER PROCEDURE CrearRutina (@ejercicion VARCHAR(45), @repeticiones INT, @idExpediente INT)
AS
BEGIN
	INSERT INTO TRutina VALUES(@ejercicion, @repeticiones, @idExpediente)
END

------Vista de reporte de cliente------
CREATE OR ALTER VIEW ReporteCliente
AS 
SELECT TPersona.nombre, TPersona.fechaNacimiento, TCliente.estatura, TCliente.altoRiesgo, 
TCliente.sexo, TMediciones.peso, TMediciones.fecha, TMediciones.IMC, TMediciones.porcentajeGrasa, TMediciones.porcentajeGViceral
FROM TPersona
INNER JOIN TCliente ON TPersona.idPersona = TPersona.idPersona
INNER JOIN TMediciones ON TCliente.idCliente = TMediciones.idCliente

SELECT * FROM ReporteCliente

-----Trigger Alto Riesgo-----
