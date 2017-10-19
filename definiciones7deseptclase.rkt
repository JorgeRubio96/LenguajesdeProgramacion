#lang racket
;ejemplo lista -> atomo
; cuenta los atomos de una lista posiblemente imbricada
(define (cuenta-atomos lista)
  (cond((null? lista) 0)
       ((list? (car lista))
        (+ (cuenta-atomos (car lista))
           (cuenta-atomos (cdr lista))))
       (else(+ 1 (cuenta-atomos (cdr lista))))))


;ejemplo atomo->lista
;anida n veces el numero n

(define (anida-nveces n)
  (anida-aux n 0))

(define (anida-aux n veces)
  (if (= n veces)
      (list n)
      (list (anida-aux n (+ veces 1)))))

;ejemplo lista->lista
; incrementar los elementos de una lista imbricada
(define (incrementa lista)
  (cond ((null? lista) '()) ;caso base
        ; casos generales
        ((number? (car lista))
         (cons (+ (car lista) 1)
               (incrementa (cdr lista))))
        ((list? (car lista))
         (cons (incrementa (car lista))
               (incrementa (cdr lista))))
        (else (cons (car lista)
                    (incrementa (cdr lista))))))
