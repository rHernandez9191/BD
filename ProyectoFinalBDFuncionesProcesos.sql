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
CREATE OR ALTER FUNCTION fn_edad (
	@fechaNacimiento DATE
)
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



------Procedimiento Creacion de Rutina-----


------Vista de reporte de cliente------
CREATE OR ALTER VIEW ReporteCliente

-----Trigger Alto Riesgo-----