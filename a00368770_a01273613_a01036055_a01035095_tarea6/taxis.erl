% Matricula 1: A00368770
% Matricula 2: A01273613
% Matricula 3: A01036055
% Matricula 4: A01035095

%4.- TAXI del ejercicio
matriz() -> 'servidor@TAX241' . 
matriz2() -> 'servidor@TAX240' . 

%llamada que realiza un taxi cuando llega a la central
llegue(PID, Tipo, Placa ) ->
	io:format("Taxi llego a central!! ~n"),
	llama_servidor({arrived, PID, Tipo, Placa}) .
%llamada para terminar la comunicacion, la cual se genera cuando
% un taxi llega a su destino con el cliente
arribo(Mensaje) ->
	io:format("Taxi llego a destino!! ~n"),
	llama_servidor({destination, Mensaje}) .

%TAXI
llama_servidor(Mensaje) ->
	Matriz = matriz(),
	monitor_node(Matriz, true),
	{central_taxi, Matriz} ! {self(), Mensaje},
	receive
		{centr, Respuesta} ->
			monitor_node(Matriz, false),
			Respuesta;
		{nodedown, Matriz} ->
				PID + 'Fin' 
	end .

%TAXI
llama_servidor2(Mensaje) ->
	Matriz = matriz2(),
	monitor_node(Matriz, true),
	{central_taxi, Matriz} ! {self(), Mensaje},
	receive
		{centr, Respuesta} ->
			monitor_node(Matriz, false),
			Respuesta;
		{nodedown, Matriz} ->
				PID + 'Fin' 
	end .
