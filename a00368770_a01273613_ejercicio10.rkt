#lang racket
;1.- aplica-listas que aplique una lista de funciones binarias a cada elemento correspondiente
;en dos listas del mismo tamaño ara obtener una lista de sublistas con los
;resultados de cada operador
(define funciones
  (lambda (op uno dos)
    (if (null? uno)
        '()
        (op (car uno) (car dos)))))

(define (aplica-listas lstop lstuno lstdos)
  (cond
    [(null? lstop) '()]
    [(null?)lstuno '()]
    [ else (funciones (car lstop) (car lstuno) (car lstdos)) ]))


;2.-alguno? programa que verifique si almenos un par de elementos correspondientes
;de dos listas cumplen con un predicado binario
(define cumple
  (lambda (op uno dos)
    (if (null? uno)
        '()
        (if (op (car uno) (car dos))
            #t
            #f))))
(define (alguno? op lstuno lstdos)
  (cond
    [(null? op) '()]
    [(null? lstuno) '()]
    [else (funciones op (car lstuno) (car lstdos))]))


;3.- verbosa genera un procedimiento unario
;que despliegue el valor de su argumento y su resultado
;ademas de regresarlo

(define (verbosa procedimientoUn)
  ())