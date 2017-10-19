#lang racket
;matricula 1: a00368770
;matricula 2: a01273613

;1.- par-mayor
;se busca imprimir la suma de los dos numeros mayores
;dados una lista
(define (suma-max x y)
  (+ x y))

(define (max-dos a b c)
  (if (>= a b)
      (if (>= b c)
          (list a b)
          (list a c))
      (if (>= a c)
          (list b a)
          (list b c))))

(define (par-mayor a b c d e)
  (suma-max (max-dos (max-dos (max-dos a b c) d 0) e 0)))

;2.- triangulo de pascal
;el siguiente codigo imprime el triangulo de pascal dependiendo el numero ingresado de nivels
;para este ejercicio se implementaron 2 funciones, una que realiza el proceso y otra que
;imprime el triangulo
(define (pascal-proc x y) 
  (if (or (zero? y) (= x y)); caso base
      1
      (+ (pascal-proc (sub1 x) y)
         (pascal-proc (sub1 x) (sub1 y)))))

;funcion para imprimir, tuvimos que investigar
;e implmenetar cosas que todavia no vemos pero meramente con objetivo
;de imprimir de acuerdo a la tarea
(define (pascal n)
  (for ([x (in-range 0 n)])
    (for ([y (in-range 0 (add1 x))])
      (printf "~a " (pascal-proc x y)))
    (newline)))

;4.- mueve-ceros
; este programa se va a enfocar en agrupar los ceros dados una lista
; y colocarlos al final de todos los elementos
(define (quita-ceros lst)
  (if (null? lst) ; caso base
      '()
      (if (zero? (car lst))  ; se modifica aqui
          (quita-ceros (cdr lst)) ; y aqui
          (cons (car lst)
                (quita-ceros (cdr lst))))))

(define (cuenta-zeros lst)
  (cond
    [(empty? lst) 0]
    [(zero? (car lst)) (+ 1 (cuenta-zeros (cdr lst)))]
    [else (cuenta-zeros (cdr lst))]))

(define (agregar x)
  (cond
    [(zero? x) '()]; caso base
    [(>= x 1) (append '(0) (agregar (- 1 x)))]
    [else '()]))
;cuenta zeros ayuda a saber cuantos ceros se van a anexar
;agregar ayuda a crear una lista de ceros, que se junta
;con la lista a la cual se le eliminaron los ceros y de ese modo
;agregarlos al final
(define (mueve-ceros lista)
  (append (quita-ceros lista) (cons (agregar (cuenta-zeros lista)) empty)))



;5.- mueve ceros t
;este programa implementa la version terminal del problema
;anterior
(define (quita-cerosT lst)
  (if (null? lst) ; caso base
      '()
      (if (zero? (car lst))  ; se modifica aqui
          (quita-ceros (cdr lst)) ; y aqui
          (cons (car lst)
                (quita-ceros (cdr lst))))))

(define (cuenta-zerosT lst)
  (cond
    [(empty? lst) 0]
    [(zero? (car lst)) (+ 1 (cuenta-zeros (cdr lst)))]
    [else (cuenta-zeros (cdr lst))]))

(define (agregarT x)
  (cond
    [(zero? x) '()]; caso base
    [(>= x 1) (append '(0) (agregar (- 1 x)))]
    [else '()]))
;cuenta zeros ayuda a saber cuantos ceros se van a anexar
;agregar ayuda a crear una lista de ceros, que se junta
;con la lista a la cual se le eliminaron los ceros y de ese modo
;agregarlos al final
(define (mueve-cerosT lista)
  (append (quita-cerosT lista) (cons (agregarT (cuenta-zerosT lista)) empty)))


;6.- distintos
; el programa dada una lista encuentra la secuencia de numeros
;consecutivos mas grande formada con numeros distintos que el de la lista
;original
(define (distintos lst)
  (if (null? lst) ; caso base
      '()
      (if (member (car lst) (cdr lst))  ; se modifica aqui
          (distintos (cdr lst)) ; y aqui
          (cons (car lst)
                (distintos (cdr lst))))))
;en caso de que se requiera ordenada la salida llamo a esta funcion
(define (ordenar-distintos lst)
  (sort (distintos lst) <))

;7.- suma-cero
;dada una lista despliega todas las secuencias de numeros consecutivos
; que suman cero
(define (suma-cero lst)
  (if (null? lst)
      '()
      (if (zero? (+ (car lst) (cadr lst)))
          (append (car lst) (append (cadr lst) (suma-cero (cddr lst))))
          (suma-cero (cdr lst)))))


;8.- elimina
;se elimina el n-esimo elemento dada una lista y la
;posicion del elemento que se desea eliminar
(define (index e lst)
    (cond [(eqv? e (car lst)) 0];caso base
          [else (+ (index e (cdr lst)) 1)]))

(define (borrar x lst)
  (if (null? lst)
      '()
      (if (eq? x (index (car lst) lst))
          (borrar x (cdr lst))
          (cons (car lst)
                (borrar x (cdr lst))))))
;borrar es la funcion que me ayuda a eliminar el elemento de la lista
;mientras que index es la funcion que me ayuda a indentificar la posicion
;del elemento que deseo borrar
(define (elimina x lista)
  (borrar x lista))

;9.- combinaciones
;a partir de una lista, genere y regrese una lista con todas las
;combinaciones de elementos distintos de una longitud N dada

;falta