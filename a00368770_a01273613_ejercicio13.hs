-- matricula 1 a00368770
-- matricula 2 a01273613

-- Problema 1 promedio de alumnos
-- funcion que regresa el promedio de los alumnos
promedio :: Integer -> [(Integer, [Char], [Double])] -> [(Integer, [Double])]

promedio _ [] = [( "", [0.0])] -- caso base
-- obtener el promedio
promedio mat1 ((mat2, _, parcialista) :resto) = 
	if mat1 == mat2 then   --obtener el promedio por alumno
		sum parcialista /
			fromIntegral (length parcialista)
		else promedio mat1 resto  --seguir buscando por el arbol

--Problema 2 hojas
--Funcion que regresa todas las hojas de un arbol binario
data BinTree a = Empty | Node (BinTree a) a (BinTree a) deriving (Eq, Show)

hojas :: BinTree a -> [a]
hojas Empty = [] --caso base
hojas (Node left current right) = [current]++hojas left++hojas right --agregamos el elemento al final de la lista
-- mientras siga encontrando hijos, busca en su lado derecho e izquierdo
--hasta regresar solo los hijos


--Problema 3 binariza
--funcion que cambia numeros impares por 0 y pares por 1's

binariza :: Integer -> [(Char, [Integer])]