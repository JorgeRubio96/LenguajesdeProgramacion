#lang racket
;matricula 1: a00368770
;matricula 2: a01273613

;1.- profundidad
;programa que determina el nivel maximo de anidacion
(define (profundidad lst)
  (if (not (pair? lst))
      0
      (max (+ 1 (profundidad (car lst)))
           (profundidad (cdr lst)))))

;2.- simetrico 
;construye una lista que describe un patron simetrico



;3.- elimina
;reduce una lista dada eliminando todos los elementos que coincidan
;con un dato especifico dado
(define (elimina item lst)
  (cond ((null? lst)
         '())
        ((equal? item (car lst))
         (cdr lst))
        (else
         (cons (car lst)
               (elimina item (cdr lst))))))

