% Matricula 1: A00368770
% Matricula 2: A01273613
-module(servidor_taxis).
-export([inicio/0, servidor/1, busca/2, registra/3, server_logon/4]).
 
 %1.- Servidor de registro de usuarios
 servidor(Datos) ->
 	receive
 		{De, {solicitar, PID, Quien, {X, Y}}}} ->
 			De ! {servidor_taxis, ok},
 			servidor(registra(PID, Quien, {X, Y}));
 		{De, {consulta, Quien}} ->
 			De ! {servidor_taxis, busca(Quien, Datos)},
 			servidor(Datos);
 		{De, PID, Quien, {X, Y}} ->
 			New_User_List = server_logon(De, Quien, {X, Y}, User_List),
 			servidor(New_User_List);
 		{De, logoff} ->
			New_User_List = server_logoff(De, User_List),
			servidor(New_User_List); 
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

%eliminar cliente de lista, esto puede ser despues de cancelar un viaje
server_logoff(De, User_List) ->
	lists:keydelete(De, 1, User_List).


%Funcion para agregar usuarios en el servidor de taxis
server_logon(De, Quien, {X, Y}, User_List) ->
	case lists:keymember(Quien, 2, User_List) of
		true ->
			De ! {messenger, stop, user_exists_at_other_node}, %reject logon
			User_List;
		false ->
			De ! {messenger, logged_on},
			[{De, Quien} | User_List] %add user to the list
	end.
