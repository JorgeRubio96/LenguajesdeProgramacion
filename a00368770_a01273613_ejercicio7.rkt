#lang racket
;1.- regresar la cantidad de numeros en una lista que son menores que
;un umbral
(define (menores x L1)
  (if < x (car L1))
      1 + (menores x (cdr L1))
      0 + (menores x (cdr L1)))

;2.- regresar una lista que contiene los digitos de su argumento
; como elementos
(define (digitos x)
  (append (car x) (digitos (cdr x))))

;3.- regresar una lista con los números pares de una lista
(define (pares L1)
  (pair? (car L1))
      (append (car L1) (pares (cdr L1)))
      (pares (cdr L1)))