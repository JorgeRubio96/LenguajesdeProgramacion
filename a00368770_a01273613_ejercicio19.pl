padece(Pedro, gripe).
padece(Pedro, gripe).
padece(Pedro, hepatitis).
padece(Juan, hepatitis).
padece(Maria, gripe).
padece(Maria, gripe).
enfermedad(fiebre, gripe).
enfermedad(cansancio, hepatitis).
enfermedad(diarrea, intoxicacion).
enfermedad(cansancio, gripe).
suprime(aspirina, fiebre).
suprime(lomotil, diarrea).
alivia(aspirina, gripe).
sugerencia(Pedro, aspirina, gripe, fiebre).

padece_enferemedad(X) :- padece(Y, X).
padece_gripa(X) :- padece(Y, X), X == 'gripe'.
padece_diarea(X) :- padece(Y, X), X == 'diarrea'.
sintomas_persona(X) :- padece(X, Y), enfermedad(Y, W).
cansado(X) :- enfermedad(X, Y), padece_enferemedad(Y).
farmaco(P) :- padece(P, Y), enfermedad(W,Y), suprime(Z, W).
sintomas_comp(X,Y) :- sintomas_persona(X) == sintomas_persona(Y).
 
