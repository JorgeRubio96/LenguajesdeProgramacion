% Matricula 1: A00368770
% Matricula 2: A01273613
-module(servidor_taxis).
-export([inicio/0, servidor/1 ]).
 
 %1.-  Servidor de registro de usuarios
 servidor(Datos) ->
 	receive
 		{De, {registra, Quien, {X, Y}}}} ->
 			De ! {servidor_registro, ok},
 			servidor(registra(Quien, PID, Datos));
 		{De, {consulta, Quien}} ->
 			De ! {servidor_registro, busca(Quien, Datos)},
 			servidor(Datos);
 	end .

inicio() ->
	register(servidor_registro,
			spawn(servidor_registro, servidor, [[]])) .

busca(Quien, [{Quien, Valor} | _]) ->
		PID + '... Sigue Vivo';
busca(Quien, [_|T]) ->
		busca(Quien, T);
busca(_,_) ->
		indefinido .

registra(Quien, PID) ->
		[{Quien, PID}];
