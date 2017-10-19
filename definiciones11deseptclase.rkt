#lang racket

(define (ordena arreglo)
  (if (null? arreglo)
      arreglo
      (inserta (car arreglo)
               (ordena (cdr arreglo)))))

; inserta un numero dentro de un arreglo ordenado de numeros
(define (inserta num arreglo)
  (cond ((null? arreglo) (list num))
        ((<= num (car arreglo))
         (cons num arreglo))
        (else (cons (car arreglo)
                    (inserta num (cdr arreglo))))))

; determina si un valor se encuentra dentro de un arbol binario de busqueda
(define (busca num arbol)
  (cond ((null? arbol) #f)
        ((equal? num (car arbol)) #t)
        ((< num (car arbol)) (busca num (cadr arbol)))
        (else (busca num (caddr arbol)))))

; determina el maximo numero de adyacencias de los nodos de un grafo
(define (adyacencias grafo)
  (cond ((null? grafo) 0)
        (else (let ((maxp (length (cdar grafo)))
                    (maxr (adyacencias (cdr grafo))))
                (if (>= maxp maxr) maxp maxr)))))
