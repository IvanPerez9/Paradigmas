module HojasEjercicios.HojaEjercicios2 where

import Data.Char


{- A)
Implementa una función en Haskell que elimine de una lista de enteros aquellos
números múltiplo de x.
> cribar [0,5,8,9,-9,6,0,85,-12,15] 2
[5,9,-9,85,15]
Se piden diferentes versiones de la misma función:
- Con definición de listas por comprensión
- Con recursividad no final
- Con recursividad final o de cola
-}

ejercicioA :: [Int] -> Int -> [Int]
ejercicioA lista num = [x | x <- lista , x `mod` num /= 0]

ejercicioA' :: [Int] -> Int -> [Int]
ejercicioA' [] _ = [] 
ejercicioA' (x:xs) num = if x `mod`num /=0 then x:ejercicioA' xs num else ejercicioA' xs num 

ejercicioA'' :: [Int] -> Int -> [Int]
ejercicioA'' (l:ls) num = ( ejercicioA2 (l:ls) num [])

ejercicioA2 :: [Int] -> Int -> [Int] -> [Int]
ejercicioA2 [] _ [] = []
ejercicioA2 (l:ls) num acum = if (l `mod`num /= 0) then ejercicioA2 ls num (l:acum) else ejercicioA2 ls num acum

{- B)
 Dada la siguiente definición de función
doble :: Int -> Int
doble x = x + x
¿Cómo cambiaría la definición utilizando expresiones lambda?
-}

doble :: Int -> Int
doble x = x + x

ejercicioB :: Int -> Int
ejercicioB x = (\n -> n*2) x -- PORQUÉ LA X POR FUERA

{- C)
Se pide una función en Haskell que dada una lista de números enteros obtenga un
número entero con el resultado de calcular el doble de cada uno de los elementos de la
lista original y sumarlos todos. Se piden diferentes versiones de la misma función:
- Con recursividad no final
- Con recursividad final o de cola
- Utilizando expresiones lambda u orden superior (se puede hacer uso de la
función predefinida de Haskell map). 
-}

ejercicioC :: [Int] -> Int
ejercicioC [] = 0
ejercicioC (l:ls) = (2*l) + ejercicioC ls 

ejercicioC' :: [Int] -> Int 
ejercicioC' (l:ls) = ejercicioCAux (l:ls) 0

ejercicioCAux:: [Int] -> Int -> Int
ejercicioCAux [] _ = 0
ejercicioCAux (l:ls) acum = ejercicioCAux ls (2*l + acum) 

ejercicioC'' :: [Int] -> Int
ejercicioC'' l = foldl (+) 0 (map (2*) l)

{- D)
Implementa una función que sume los cuadrados de los números pares contenidos en
una lista de números enteros. Se piden dos versiones:
a. Una versión que haga uso de las funciones de orden superior de listas map y
filter para definir la nueva función.
b. Una versión que utilice la definición de listas por comprensión.

 -}
 
ejercicioDb :: [Int] -> Int
ejercicioDb l = foldr (+) 0 [(x^2) | x <- l , x `mod` 2 == 0] -- Right , de derecha a izq

ejercicioDa :: [Int] -> Int
ejercicioDa l = foldr (+) 0  (map (*2) (filter even l))

{- E)
Dada una lista de enteros, implementar una función para devolver tuplas formadas por
los elementos (sin repetir) de la lista, junto con la primera posición en la que aparecen.
-}
-- Todos lo de contador con Aux ?

ejercicioE :: [Int] -> [(Int,Int)]
ejercicioE l = ejercicioEAux l 1 [] []

-- La lista inicial, posicion , lista vistos, resultado , resultado
ejercicioEAux :: [Int] -> Int -> [Int] -> [(Int,Int)] -> [(Int,Int)]
ejercicioEAux [] pos vistos resultado = resultado
ejercicioEAux (l:ls) pos vistos resultado = if esta vistos l then ejercicioEAux ls (pos+1) vistos resultado
											else ejercicioEAux ls (pos+1) (l:vistos) ((l,pos):resultado)
											
esta :: [Int] -> Int -> Bool
esta [] _ = False
esta (n:ns) e = if n == e then True else esta ns e
 
{- F)
Implementar en Haskell una función que calcule el número de secuencias de ceros que
hay en una lista de números.
-}

ejericicioF :: [Int] -> Int
ejericicioF [] = 0
ejericicioF [0] = 1
ejericicioF [x] = 0
ejericicioF (0:0:xs) = ejericicioF(0:xs)
ejericicioF (0:x:xs) = 1 + ejericicioF xs
ejericicioF (y:x:xs) = ejericicioF (x:xs)

{- G)
Implementar una función en Haskell que reciba una lista de números enteros y devuelva
dos listas: una con los elementos sin repetir y otra con los elementos que están
repetidos.
-}

-- Mirar Veces de Fold

ejercicioG :: [Int] -> ([Int],[Int])
ejercicioG [] = ([],[])
ejercicioG lista = foldl(\(unicos,repes) x -> if pertenece x repes then (unicos,repes)
										 else if pertenece x unicos then (borrar x unicos, repes ++[x])
										 else (unicos ++ [x],repes)) ([],[]) lista
										 
pertenece :: Int -> [Int] -> Bool
pertenece_[] = False
pertenece x(y:ys) = (x==y) || (pertenece x ys)

borrar :: Int -> [Int] -> [Int]
borrar _[] = []
borrar x (y:ys) = if x == y then ys else x:(borrar x ys)


{- H)
Dada una lista de números enteros implementar una función que devuelva una lista con
los n elementos mayores de la lista original. 
-}

-- Mirar MayorTres de Fold

ejercicioH :: [Int] -> Int -> [Int]
ejercicioH [] _ = []
ejercicioH l n = ejercicioHAux l n 0 []
-- El 0 como contador
ejercicioHAux :: [Int] -> Int -> Int -> [Int] -> [Int]
ejercicioHAux [] _ _ [] = []
ejerciciohaux (l:ls) n cont acum = if cont<n then 
				   ejercicioHAux ls n cont+1 l:acum
				   else let a = menor (acum) in
				   	if l<a then ejercicioHAux ls n cont acum
					else ejercicioHaux ls n cont intercambiar (acum a l)
menor :: [Int] -> Int
menor [x] = x
menor l:ls = menorAux ls l

menorAux :: [Int] -> Int -> Int
menorAux [] x = x
menorAux (l:ls) x = if l<x then menorAux ls l
		    else menorAux ls x
		    
intercambiar :: [Int]->Int->Int -> [Int]
intercambiar [] _ _ = []
intercambiar (l:ls) x y = if x == l then (y:ls) 
			  else l:intercambiar ls x y


{- I)
Implementa una función incluye en Haskell que reciba dos listas de números enteros y
nos diga si la primera de las listas está contenida en la segunda. Se dice que una lista
está contenida en otra si los elementos de la primera aparecen dentro de la segunda, en
el mismo orden y de forma consecutiva
-} 
 
secuencia :: (Eq a) => [a] -> [a] -> Bool
secuencia []_ = True
secuencia (x:xs) [] = False
secuencia (x:xs)(y:ys) = if x /= y then secuencia (x:xs) (ys)
 						  else comprobar (xs) (ys) || secuencia (x:xs) (ys)
 						  
comprobar:: (Eq a) => [a] -> [a] -> Bool
comprobar []_ = True
comprobar (x:xs) []  = False
comprobar (x:xs) (y:ys) = (x==y) && (comprobar xs ys)

{- K
Implementa una función polimórfica en Haskell que reciba 2 listas y vaya cogiendo un
elemento de la primera y dos de la segunda, creando una lista final de ternas. En caso
de que una de las dos listas se acabe, mostrará la lista de ternas construidas hasta ese
momento.
-}

ejercicioK :: [Int] -> [Int] -> [(Int,Int,Int)]
ejercicioK [] _ = []
ejercicioK _ [] = []
ejercicioK _ [x] = []
ejercicioK (x:xs)(y:y2:ys) = (x,y,y2):ejercicioK xs ys

{- L)
Se pide una función polimórfica en Haskell que dado un elemento y una lista añada
dicho elemento al final de la lista.
-}

ejercicioL :: [Int] -> Int -> [Int]
ejercicioL lista n = foldr (\x acum -> x:acum) [n] lista
