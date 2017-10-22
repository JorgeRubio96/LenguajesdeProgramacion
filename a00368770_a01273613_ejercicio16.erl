% Matricula 1: A00368770
% Matricula 2: A01273613

% 1.- formula_general resuelve ecuaciones cuadraticas 
% tipo ax^2+bx+c=0, a partir de sus coeficientes
-module(act).
-export([menores/2, secuencia/1, secaux/2, mapea/2, formula_general/3]).

formula_general(A, B, C) ->
		D = B*B - 4*A*C,
		if(D == 0) -> io:format("x = ~f~n", [-B*0.5/A]);
			true ->
				if(D > 0) ->
					SQ = math:sqrt(D),
					io:format("{ ~f~n, ~f}", [(-B+SQ)/2/A, (-B-SQ)/2/A]);
					true -> SQ = math:sqrt(-D),
						io:format("x1 = {~f,~f}~nx2 = {~f,~f}", [-0.5*B/A, 0.5*SQ/A, -0.5*B/A, -0.5*SQ/A]);
				end
		end

% 2.- secuencia crea una lista con numeros naturales del 1 a N
% En este caso la implementacion que utilizamos es crear una lista
% y cuando llegue a 1 voltearla... para hacer más fácil la solución
secuencia (N) when N > 0 -> secaux(1, N).

secaux (X, N) when X < N -> [X] ++ secaux(X+1, N);
secaux (X, N) when X == N -> [X].


% 3.- mapea es la funcion que implmeenta map
% sin utilizarla
%

mapea (_, []) -> [];
mapea (F, [H|T]) -> [F (H) |  mapea (F, T)].


% 4.- menores es una funcion que sin utilizar recursividad explicita
% regresa los elementos menores de una lista de sublistas que sean
% menores que su segundo argumento



