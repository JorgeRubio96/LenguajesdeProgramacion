% Matricula 1: A00368770
% Matricula 2: A01273613
-module(act).
-export([hola/2, calcula/3 ]).

prueba_hola() ->
   H = spawn(hola, hola,[]),
   prueba_hola (10, H).
prueba_hola(N, H) when N > 0 ->
   H ! {hola, self()},
   receive
       {reply, C} ->
           io:format("Recibido ~w~n", [C]),
           prueba_hola(N-1, H)
   end;
prueba_hola(_, _) ->
    io:format("Mi trabajo está hecho").
