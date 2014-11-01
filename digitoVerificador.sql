
create FUNCTION [dbo].[Fn_CalcularDigitoVerificador] (@RUC VARCHAR(20),
             @p_basemax NUMERic(5,0) = 11)
           RETURNs numeric(20,0) 

begin


/*
    Calcula Digito Verificador numérico con entrada alfanumérica y basemax 11
*/
declare @v_total NUMERic(20,0), @p_numero varchar(20)
declare @v_resto NUMERic(20,0), @k NUMeRic(20,0), @v_numero_aux NUMeRic(20,0)
declare @v_numero_al VARCHAR(20), @v_caracter VARCHAR(5), @v_digit NUMERic(20,0)
declare @i int

set @p_numero = @RUC
set @v_numero_al = ''
set @i = 1
-- Cambia la ultima letra por ascii en caso que la cedula termine en letra
while  @i < LEN(@p_numero) + 1
begin
	set @v_caracter = UPPER(SUBSTRing(@p_numero,@i,1))
	IF ASCII(@v_caracter) NOT BETWEEN 48 AND 57 
	begin
		-- de 0 a 9 
		set @v_numero_al = @v_numero_al + convert(varchar(20),ASCII(@v_caracter))
	end
	ELSE
	begin
		set @v_numero_al = @v_numero_al +  @v_caracter
	end
	
	set @i = @i + 1
END
-- Calcula el DV 
set @k = 2
set @v_total = 0
set @i = LEN(@v_numero_al)

while @i > 0
begin
    IF (@k > @p_basemax)
	begin
		set @k = 2
	end
   
    set @v_numero_aux = convert(numeric(20,0),SUBSTRing(@v_numero_al,@i,1))
    set @v_total = @v_total + (@v_numero_aux * @k)
    set @k = @k + 1
	set @i = @i - 1
end

set @v_resto = (@v_total % 11)
IF @v_resto > 1
begin
	set @v_digit = 11 - @v_resto
end
ELSE
begin
	set @v_Digit = 0
eND

RETURN @v_Digit

end
