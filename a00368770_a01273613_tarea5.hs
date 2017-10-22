-- Matricula 1: A00368770
-- Matricula 2: A01273613

-- 1.- Medaiana calcula la mediana de 5 argumentos
-- que sean numeros enteros, regresa como valor el numero de en medio

--funcion principal
mediana :: Integer -> Integer -> Integer -> Integer -> Integer -> Integer
mediana a b c d e = medio (medio a b c) d e 

--numMedio ayuda a obtener el numero de la media de 3 elementos
numMedio :: Integer -> Integer -> Integer -> Integer 
numMedio x y z
  | medio y x z = x 
  | medio x y z = y
  | medio z y x = y 
  | otherwise = z 

-- medio nos regresa un valor bool si el valor central
-- corresponde a la posición o no
medio :: Integer -> Integer -> Integer -> Bool 
medio a b c = a <= b && b <= c

--2.- Tabla es una función recursiva que recibe 
-- argumentos que representan: filas, columnas y numero
-- en el cual va a empezar a enumerarse las celdas

tabla :: Integer -> Integer -> Integer -> [[Integer]]
tabla a b c =
	printRow a c ++ tabla (a-1) (b-1) (c+b)

--regresa una lista con los valores de la fila
printRow :: Integer -> Integer -> [Integer]
printRow x y = 
	if x == 1 then
		y:[] else
		y : printRow (x-1) (y+1)  

--3.- divide, funcion recursiva que recibe dos listas
-- para regresar una lista de tuplas que contiene 
-- el cociente y residuo de dividir elemento por elemento
-- de las dos litas

divide :: [Integer] -> [Integer] -> [(Integer, Integer)]
divide [] [] = [()]
divide (x:xs) (y:ys) = 
	((div x y), (mod x y)) : divide xs ys
	--zip ((div x y) : divide xs ys)  ((mod x y) : divide xs ys)


--4.- intercala recibe un entero y una lista que genera una lista
-- insertando un valor en todas las posiciones de una lista plana

intercala :: Integer -> [Integer] -> [[Integer]]
intercala xs [] = [xs]
intercala e (x:xs') =
	map (x : )(intercala e' xs)

-- 5.- Permutacion funcion que obtiene la lista de todas
-- las permutaciones generadas a partir de una lista
permutacion :: [Integer] -> [[Integer]]
permutacion [] = [[]] --caso base
permutacion xs = concatMap (\x -> map (x:) $ permutacion $ delete x xs) xs
-- en esta parte se utilizo concatMap debido al que el map nos daba errores al momento
--de compilar devido a unos errores


-- 6.- nivel, dado un arbol y un valor, regresa el nivel del Arbol
--si no regresa -1
data AB t = A (AB t) t (AB t) | V deriving Show
ab = A (A (A V 2 V) 
          5 
          (A V 7 V)) 
            8 
          (A V 
            9 
            (A (A V 11 V) 
            15 
            V))
nivel :: AB -> Integer -> Integer
nivel V e = []
nivel (A l v r) valor
	| v == valor = 1
	| v < valor = (1 + (nivel r valor))
	| otherwise = (1 + (nivel l valor))

--7.- rango dado un arbol binario y dos valores que describen un rango
-- regresa una lista ordenada que contenga todos los valore en el rango que 
-- se encuentran en el arbol
rango :: AB -> Integer -> Integer -> [Integer]
rango V valor1 valor2 = []
rango (A l v r) valUno valDos 
	| v >= valUno && v <= valDos = [v] ++ (rango l valUno valDos) ++ (rango r valUno valDos)
	| otherwise = (rango r valUno valDos)

--8.- valmat crea una matriz NxM con un valor
valmat :: Integer -> Integer -> Integer -> [Integer]


-- 9.- chess crea una matris cuadrada de NxN, donde la suma
-- de las coordenadas par sea 1's y las impar 0´s
chess :: Integer -> [Integer]

-- 10.- reducir es una funcion que a partir de una lista
-- genera una lista de listas, donde se vayan eliminado sus elementos
-- hasta que se vacie
reducir :: [Integer] -> [Integer]

