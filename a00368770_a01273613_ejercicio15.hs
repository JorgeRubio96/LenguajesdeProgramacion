
--1.-
cuenta_signo :: [Int] -> (Int, Int)
cuenta_signo [] = []
cuenta_signo (x:xs)
	| x < 0 = (1 + cuenta_signo xs, cuenta_signo xs) 
	| x > 0 = (cuenta_signo xs, 1 + cuenta_signo xs)

--2.-
separa :: Int -> [Int] -> ([Int],[Int])
separa [] = []
separa e l = 
	(lt , ge)
	where
		lt = [y | y <- l, y < e]
		ge = [y | y <- l, y >= e]

-- 3.- 
fexp :: Float -> Int -> Float
fexp [] = []
fexp x n =
	if n < 0 then
		0
		else
		((x ^ n) / factorial n)	+ fexp x (n - 1)


factorial :: Int -> Int
factorial [] = []
factorial n = if n < 2 then 1 else n * factorial (n-1)