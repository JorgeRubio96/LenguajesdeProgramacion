% Matricula 1: A00368770
% Matricula 2: A01273613
% Matricula 3: A01036055
% Matricula 4: A01035095
-module(central_taxis).
-export([central/1, inicio/0, registra/4, registraClientes/2, server_logon_Taxis/4,server_disponibilidad_Taxis/4, cliente_disponiblidad_taxis/3
 ]).
 
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
 			servidor(registraClientes(PID, {X, Y}));
 		{De, PID, Quien, {X, Y}} ->
 			New_Cab_List = server_logon(De, Quien, {X, Y}, Cab_List),
 			central(New_Cab_List);
 		{De, {,PID, Quien, {X, Y}}} ->

 	end .

inicio() ->
	register(central_taxi,
			spawn(central_taxi, servidor, [[]])) .

%funcion que registra los taxis
registra(PID, Tipo, Placas, {X,Y}) ->
		[{PID, Tipo, Placas, {X,Y}}];

%funcion que registra los clientes
registraClientes(PID, {X,Y}) ->
		[{PID, {X,Y}}];

	
%Funcion para agregar taxis en la central de taxis
server_logon_Taxis(De, Quien, {X, Y}, Cab_List) ->
	case lists:keymember(Quien, 2, Cab_List) of
		true ->
			De ! {messenger, stop, user_exists_at_other_node}, %rechazar registro
			Cab_List;
		false ->
			De ! {messenger, logged_on},
			[{De, Quien} | Cab_List] %agregar taxi a la lista
	end.
%Funcion para avisar que no hay taxis
server_disponibilidad_Taxis(De, Quien, {X, Y}, Cab_List) ->
	case lists:keymember(Quien, 1, Cab_List) of
		true ->
			De ! "No hay taxis", [First | Rest] = Cab_List %rechazar registro
			First;
		false ->
			De ! [First | Rest] = Cab_List,
			First; %agregar taxi a la lista
	end.

%Funcion que llama el cliente para checar la disponibilidad en el servidor/central de taxis
cliente_disponiblidad_taxis(De, Quien, {X, Y}) ->
	server_disponibilidad_Taxis(De, Quien, {X, Y}, Cab_List);