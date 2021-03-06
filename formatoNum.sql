
ALTER FUNCTION [dbo].[FormatoNumero] (@CantidadCaracteres as smallint,
@Cadena as varchar(30), @Caracter as varchar(1))
RETURNS varchar(30)
BEGIN 

	declare @vCadena varchar(30)

	if len(@Cadena) < @CantidadCaracteres
	begin
		
		set @vCadena = replicate(@Caracter, @CantidadCaracteres - len(@Cadena)) + @Cadena
	end
	else
	begin
		set @vCadena = @Cadena
	end


   return @vCadena
   
   
END
