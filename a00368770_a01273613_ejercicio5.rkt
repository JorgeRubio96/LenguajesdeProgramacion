#lang racket

;1.- calcula el numero de cuadrante
;dadas el par de coordenadas
(define (cuadrante x y)
  (cond [(and (= x 0)(= y 0)) '=>origen]
        [(and (= x 0)(> y 0)) '=>nada]
        [(and (= x 0)(< y 0)) '=>nada]
        [(and (> x 0)(= y 0)) '=>nada]
        [(and (< x 0)(= y 0)) '=>nada]
        [(and (> x 0)(> y 0)) '=>primer_cuadrante]
        [(and (> x 0)(< y 0)) '=>cuarto_cuadrante]
        [(and (< x 0)(> y 0)) '=>segundo_cuadrante]
        [(and (< x 0)(< y 0)) '=>tercer_cuadrante]
        [else '=>nada]))

;2.- calcula el clima
;dado la entrada

(define (clima a)
  (cond [ (< a 0) '=>congelado]
        [(and (>= a 0)(<= a 10)) '=>helado]
        [(and (> a 10)(<= a 19)) '=>frio]
        [(and (> a 20)(<= a 29)) '=>normal]
        [(and (> a 30)(<= a 39)) '=>caliente]
        [(>= a 40) '=>hirviendo]
        [else '=>invalido]))

;3.- programa que ordena
; una secuencia de 3 numeros
; a b c que imprime se refiere a como entraron los argumentos
(define (ordena a b c)
  (cond [(and (<= a c)(<= c b)) '(a c b)]
        [(and (<= b a)(<= a c)) '(b a c)]
        [(and (<= b c)(<= c a)) '(b c a)]
        [(and (<= c a)(<= a b)) '(c a b)]
        [(and (<= c b)(<= b a)) '(c b a)]
        [else '(a b c)]))