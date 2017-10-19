#lang racket
;Matricula 1: a00368770
;Matricula 2: a01273613

;ejercicio1
;ejercicio para contar los 1 dentro de un arreglo
(define (unos arreglo)
  (cond
    [(empty? arreglo) 0]; condicion base
    [(eq? (car arreglo) 1) (+ 1 (unos (cdr arreglo)))]
    [else (unos (cdr arreglo))]))

;ejercicio 2
;invierte, se invierten los 1 y ceros detro de una matriz
(define (invierte matriz)
  (cond
    [(empty? matriz) '()]; condicion base
    [(zero? (caar matriz)) (append '(1) (append (invierte (cadr matriz))(invierte (cdr matriz))))]
    [(eq? (car matriz) 1) (append '(0) (append (invierte (cadr matriz))(invierte (cdr matriz))))]
    [else (append (invierte (cadr matriz)) (invierte (cdr matriz)))]))

;ejercicio 3
;parcial, dada una matriz se va a buscar la calificacion especificada
; correspoindiente al parcial requerido
(define (index n lista)
  (cond
    [(zero? n) 'NO]; Caso que no existe calificacion
    [(eq? n 1) lista]; caso base
    [else (index (- n 1) (cdr lista))])); regresa la calificacion dada la posicion

(define (parcial n matriz)
  (cond
    [(empty? matriz) '()]; caso base
    [else (append (caar matriz) (append (index n (caddar matriz)) (parcial n (cdr matriz))))]))


;ejercicio 4
;subarbol regresa un subarbol que se genera a partir del nodo especificado
(define (left arbol); regresa subarbol izquierdo
  (if (null? arbol) '()
      (cadr arbol)))

(define (right arbol); regresa subarbol derecho
  (if (null? arbol) '()
      (caddr arbol)))

(define (subarbol nodo arbol)
  (cond
    [(empty? arbol) '()]
    [(eq? nodo (car arbol)) arbol]
    [else (append (subarbol nodo (left arbol)) (subarbol nodo (right arbol)))]))


;ejercicio 5
;adyacentes regresa los nodos adyacentes al nodo especificado
(define (revisa arbol)
  (if (empty? arbol) '()
      arbol))
(define (adyacentes1 nodo arbol)
  (if (null? arbol)
      '()
      (if (eq? nodo (car arbol))
          (cadr arbol)
          (if (eq? nodo (cadr arbol))
              (append (car arbol) (revisa (caddr arbol)))
              (append (adyacentes1 nodo (left arbol)) (adyacentes1 nodo (right arbol)))))))

(define (adyacentes nodo arbol)
  (adyacentes1 nodo arbol))
