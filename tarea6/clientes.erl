% Matricula 1: A00368770
% Matricula 2: A01273613
% Matricula 3: A01036055
% Matricula 4: A01035095
%2.- Cliente del ejercicio
-module(clientes) .
-export([consulta/1, solicitar/2]) .

matriz() -> 'servidor@TAX240' . 
matriz2() -> 'servidor@TAX241' .



%Funcion para solicitar un taxi
solicitar(PID, Quien, {X, Y}) ->
	io:format("Se solicito un taxi! ~n"),
	llama_servidor({solicitar, PID, Quien, {X, Y}}}) .
%funcion para cancelar un taxi, el cual es directo con el taxi
cancelar() ->
	llama_servidor({terminar}) .
%Funcion para avisar que ya llego el taxi
taxi_llego() ->
	io:format("El taxi ya llego! ~n"),
	llama_servidor({terminar}) .
%Funcion para registrar el cliente en central de taxis
solicitar2(PID, {X, Y}) ->
	llama_servidor2({solicitar, PID, {X, Y}}) .

disponibilidad(PID, Quien, {X, Y}) ->
	llama_servidor2({cliente_disponiblidad_taxis, PID, Quien, {X, Y}}) .

%CLIENTE
llama_servidor(Mensaje) ->
	Matriz = matriz(),
	monitor_node(Matriz, true),
	{servidor_taxis, Matriz} ! {self(), Mensaje},
	receive
		{servidor_taxis, Respuesta} ->
			monitor_node(Matriz, false),
			Respuesta;
		{nodedown, Matriz} ->
				PID + 'Fin' 
	end .

llama_servidor2(Mensaje) ->
	Matriz = matriz2(),
	monitor_node(Matriz, true),
	{servidor_taxis, Matriz} ! {self(), Mensaje},
	receive
		{servidor_taxis, Respuesta} ->
			monitor_node(Matriz, false),
			Respuesta;
		{nodedown, Matriz} ->
				PID + 'Fin' 
	end .
