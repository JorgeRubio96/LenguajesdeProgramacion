% Matricula 1: A00368770
% Matricula 2: A01273613
-module(a00368770_a01273613_ejercicio18).
-export([inicio/0, servidor/1 ]).
 
 %1.-  Servidor de registro de usuarios
 servidor(Datos) ->
 	receive
 		{De, {registra, Quien, PID}} ->
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

%2.- Cliente del ejercicio
-module(cliente_registro) .
-export([consulta/1, registro/2]) .

matriz() -> 'servidor@REG240' . 

consulta(Quien) ->
	llama_servidor({consulta, Quien}) .
registro(Quien, PID) ->
	llama_servidor({registro, Quien, PID}) .

%CLIENTE
llama_servidor(Mensaje) ->
	Matriz = matriz(),
	monitor_node(Matriz, true),
	{servidor_registro, Matriz} ! {self(), Mensaje},
	receive
		{servidor_registro, Respuesta} ->
			monitor_node(Matriz, false),
			Respuesta;
		{nodedown, Matriz} ->
				PID + 'Fuera' 
	end .

