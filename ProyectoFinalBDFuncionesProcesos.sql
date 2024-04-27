--Calcular IMC de una persona fn_calcular_imc--
CREATE FUNCTION fn_calcular_imc ( @estatura float, @peso float )
RETURNS int
AS
BEGIN
    DECLARE @IMC float
    SET @IMC = @peso /  POWER(@estatura, 2) 
    RETURN @IMC
END

--Ejecucion fn_calcular_imc--
SELECT dbo.fn_calcular_imc(5.2,10) AS Resultado

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
CREATE OR ALTER PROCEDURE obtener_medidas_ideales(@estatura FLOAT, @sexo VARCHAR(1), @imc FLOAT, @grasaCorporal FLOAT, @grasaViseral FLOAT)
AS
BEGIN
	---select de la pasada medicion para saber si mejoro---
	DECLARE @resultadoIMC VARCHAR(15)
	DECLARE @resultadoGrasaCorporal VARCHAR(45)
	DECLARE @resultadoGrasaViseral VARCHAR(45)

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
END


------Procedimiento Creacion de Rutina-----


------Vista de reporte de cliente------
CREATE OR ALTER VIEW ReporteCliente 

-----Trigger Alto Riesgo-----