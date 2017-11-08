% Matricula 1: A00368770
% Matricula 2: A01273613
%2.- Cliente del ejercicio
-module(clientes) .
-export([consulta/1, registro/2]) .

matriz() -> 'servidor@TAX240' . 

consulta(Quien) ->
	llama_servidor({consulta, Quien}) .
registro(Quien, PID) ->
	llama_servidor({registro, Quien, {X, Y}}}) .

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
				PID + 'Arribo' 
	end .

