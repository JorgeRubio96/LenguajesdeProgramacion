% A00368770
% A01273613
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%1.- Tortugas ninja
% funciones que modelan los enunciados dados
%respetando el orden de las clausulas
vivo(Leonardo).
comida(pollo).
comida(hamburguesa).
comida(X) :- vivo(_), come(_,X).
come(Abril, pollo).
come(Leonardo, pizza).
come(MiguelA, pizza).
come(Donatelo, X) :- comida(X).
come(Rafael, X) :- come(Donatelo, X), comida(X) =:= comida(pollo).
edad(Leonardo, X) :- edad(Rafael, X).
edad(MiguelA, X) :- edad(Leonardo, X).
edad(Donatelo, X) :- edad(MiguelA, X).
edad(Rafael, 15).
edad(Abril, 19).
adolescente(_,X) :- X > 12, X < 20;
TMNT(X) :- adolescente(X, edad(X,_)), come(X,pizza).

comeRafael(X) :- X is come(Rafael,_), !.
quienesPollo(X) :- X is come(_,pollo), !.
cosaComida(X) :- X is comida(_), !.
quienesAdolescentes(X) :- X is adolescente(_,_), !.
quienesTMNT(X) :- X is TMNT(_), !. 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%2.- serie
% funcion que suma los factoriales de un numero dado
% empezando por el factorial de 1
serie (0, R) :- R is 1.
serie(n, R) :- R is factorial(n) + serie(n-1);
factorial(0,1).
factorial(n, R) :- 
	n > 0, 
	X is N-1,
	factorial(X, W),
	R is n * W.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%3.- ultimo
% funcion que regresa el ultimo elemento de una lista
ultimo([X],X).
ultimo([_,H|rest], X) :- !, ultimo([H|rest], X).

	

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%4.- salta
% funcion que a partir de una lista plana genera otra lista
% con los elementos que se visiten saltando de N en N posiciones
% a partir del primer elemento
saltaAux([H|_], 0, H) :- !.
saltaAux([_|T], N, H) :- 
	N > 0,
	N1 is N-1,
	match(T, N1, H).
salta(0,[_|_],L) :- ! .
salta(n,[H|R], L) :- 
		n > 0,
		L is saltaAux([H|R], n, H), %Encontrar elemento en lista con el auxiliar, para ir creando lista
		salta(n,[R], L). %llamar recursivamente.



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%5.- consecutivos
% funcion que recibe dos elemento en una lista y regresa si son
% consecutivos o no
consecutivos([X,Y|_], X,Y, L) :- L is true.
consecutivos([_|rest], X, Y, L) :- consecutivos(rest, X, Y, L) .

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%6.- siguiente
% funcion que regresa el elemento que aparece despues 
% de otro en una lista
siguiente(X,[X,Y|_],Y).
siguiente(X,[X,Y|rest], Z) :- Z is Y, siguiente(X, [rest], Z) .

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%7.- duplicados
% funcion que recibe una lista y regresa el numero de atomos duplicados

duplicados([], X).
duplicados(L, X):-
	duplicadosAux(L,L,X).

duplicadosAux(_,[],_).
duplicadosAux(L1,[e|rest], count) :-
	member(e, L1),
	count = count + 1,
	duplicadosAux(L1, [rest], count), !.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%8.- mezcla
% funcion que intercala dos listas pre-ordenadas
%para obtener una lista ordentada sin usar sort
mezcla([], [], []).
mezcla(L1, [], L1).
mezcla([], L2, L2).
mezcla([H1|T1], [H2|T2], [L1,L2|X]) :-
	L1 is H1,
	L2 is H2,
	mezcla(T1, T2, X), !.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%9.- convierte
% funcion que a partir de la descripción de un arbol
% binario con funciones tipo arbol(r,ls,rs) regrese una lista 
%imbricada del tipo [r, ls, rs] donde los subarboles tambien son
%listas, menos los nodos hojas.
