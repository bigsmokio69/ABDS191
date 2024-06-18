--T-SQL
/*
--Declarar una variable
declare @idCliente int 
--inicializar o asignar un valor
set @idCliente=8
--if
--IF @idCliente=8
--	SELECT * FROM Clientes WHERE id_cliente=@idCliente
--segundo if
declare @edad int
set @idCliente=8

IF @idCliente=8
 BEGIN
	set @edad=25
	SELECT * FROM Clientes WHERE id_cliente=@idCliente
	print @edad

	IF EXISTS(SELECT * FROM Clientes where id_cliente=10)
	print 'si existe'
 END

ElSE
 BEGIN
	 print 'Error'
	 print 'id no autorizado para la consulta' 
 END
 */

 --WHILE
/* declare @contador int=0
 WHILE @contador <=10
  BEGIN
		print @contador
		set @contador=@contador+1
  END */
--Return
 declare @contador int=0
 WHILE @contador <=10
  BEGIN
		print @contador
		set @contador=@contador+1
		IF @contador=3
			BREAK
		print('hola')
  END
  print('continua el flujo')
BEGIN TRY 
	set @contador='memi'
END TRY
BEGIN CATCH
	print('la variable contador solo acepta enteros')
END CATCH

  print ('soy otra consulta')
  print('yo tambien')