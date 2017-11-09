% Matricula 1: A00368770
% Matricula 2: A01273613
-module(central_taxis).
-export([central/1 ]).
 
 %3.- Central de registro de taxis
 central(Datos) ->
 	receive
 		%para este caso y solucion el taxi, tambien tiene que enviar
 		%su ubicacion, para lograr un mejor registro adaptado a nuestra solucion
 		{De, {registra, PID, Tipo, Placas, {X, Y}}}} ->
 			De ! {central_taxi, ok},
 			central(registra(PID, Tipo, Placas, {X,Y}));
 		{De, {solicitar, PID, {X, Y}}}} ->
 			De ! {servidor_taxis, ok},
 			servidor(registra2(PID, {X, Y}));
 	end .

inicio() ->
	register(central_taxi,
			spawn(central_taxi, servidor, [[]])) .

%funcion que registra los taxis
registra(PID, Tipo, Placas, {X,Y}) ->
		[{PID, Tipo, Placas, {X,Y}}];

%funcion que registra los clientes
registra2(PID, {X,Y}) ->
		[{PID, {X,Y}}];