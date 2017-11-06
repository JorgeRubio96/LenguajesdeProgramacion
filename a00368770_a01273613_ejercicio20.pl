%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  PROBLEMA 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

secuencia(N):-
	N>0,
	secuencia2(1,N).

%Secuencia 2. Itera desde It hasta Max, escribiendo It en pantalla.
secuencia2(It,Max):-    %Iteraciones
	It<Max,
	write(It), nl,
	It1 is It + 1,
	secuencia2(It1, Max).
secuencia2(It,Max):-     %Caso final
	It>=Max,
	write(Max),nl.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  PROBLEMA 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
multiplos(Mult,_,_) :-
	Mult < 0,
	write(error).
multiplos(0,_,_):-
	write(inf).
multiplos(Mult, Max, 0):-
	Mult > Max.
multiplos(Mult, Mult, 1).
multiplos(Mult, Max, M) :-
	X is Max-Mult,
	multiplos(Mult, X, W),
	M is 1+W.



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  PROBLEMA 4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
digitos(0, 0).
digitos(N, D) :-
	X is floor(N/10),
	digitos(X, W),
	D is 1+W.