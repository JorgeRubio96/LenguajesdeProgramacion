% Matricula 1: A00368770
% Matricula 2: A01273613
-module(servidor_taxis).
-export([inicio/0, servidor/1 ]).
 
 %1.- Servidor de registro de usuarios
 servidor(Datos) ->
 	receive
 		{De, {solicitar, PID, Quien, {X, Y}}}} ->
 			De ! {servidor_taxis, ok},
 			servidor(registra(PID, Quien, {X, Y}));
 		{De, {consulta, Quien}} ->
 			De ! {servidor_taxis, busca(Quien, Datos)},
 			servidor(Datos);
 	end .

inicio() ->
	register(servidor_taxis,
			spawn(servidor_taxis, servidor, [[]])) .

busca(Quien, [{Quien, Valor} | _]) ->
		PID + '... Sigue Vivo';
busca(Quien, [_|T]) ->
		busca(Quien, T);
busca(_,_) ->
		indefinido .

%registrar un cliente que desea un taxi
registra(PID, Quien, {X, Y}) ->
		[{PID, Quien, {X, Y}}];
