%modulo de ejemplos
-module(ejemplos23Oct).
-expor([ini/0, ping/2, pong/0, ciclo/0, inicio/0, di_algo/2]).

%regresa el doble de su argumento

di_algo(_, 0) ->
	hecho;
di_algo() ->
	io:format("~p~n", [Que]),
	di_algo(Que, Veces - 1).

inicio() ->
	spawn(habla, di_algo, [hola, 3]),
	spawn(habla, di_algo, [adios, 3]).

ciclo() ->
	receive
		{rectangulo, Anchura, Altura} ->
			io:format("Area del rectangulo = ~p~n" ,[Anchura * Altura]),
			ciclo();
		{circulo, R} ->
			io:format("Area del circulo es ~p~n" , [3.14159 * R * R]),
			ciclo();
		para -> fin;
		Otro ->
			io:format("Desconozco el area del ~p ~n" ,[Otro]),
			ciclo()
	end.

ping(0, Pong_PID) ->
Pong_PID ! terminado,
io:format("Ping termino~n", []);
ping(N, Pong_PID) ->
Pong_PID ! {ping, self()},
receive
pong -> io:format("Ping recibe pong~n", [])
end,
ping(N - 1, Pong_PID).
pong() ->
receive
terminado -> io:format("Pong termino~n", []);
{ping, Ping_PID} ->
io:format("Pong recibio ping~n", []),
Ping_PID ! pong,
pong()
end.
ini() ->
Pong_PID = spawn(pingpong, pong, []),
spawn(pingpong, ping, [3, Pong_PID]).