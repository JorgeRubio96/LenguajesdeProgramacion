#lang racket

;1.- programa que calcule la suma
;dada la formula de la serie

(define (serie n)
  (if (= n 1)
      3
      (+ (serie (- n 1)) (+ 1 (/ 2 n)))))

;2.-programa para obtener el residuo
; de forma recursiva
(define (cociente a b)
  (if (< a b)
      0
      (+ 1 (cociente (- a b) b))))
(define (residuo a b)
  (- a (* b (residuo a b))))

;3.- programa para obtener el n-esimo elemento de la serie
; de fibonacci, usando recursividad
(define (fibo n)
  (if (<= n 2)
      1
      (+ (fibo (- n 1)) (fibo (- n 2)))))

;4.- obtener la version terminal del programa anterior
(define (fibiter a b cont)
  (if (= cont 0)
      b
      (fibiter (+ a b) a (- cont 1))))
(define (fibot n)
  (fibiter 1 0 n))

