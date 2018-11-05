module HojasEjercicios.RepasoHoja2 where

{- A)
Implementa una funci�n en Haskell que elimine de una lista de enteros aquellos
n�meros m�ltiplo de x.
> cribar [0,5,8,9,-9,6,0,85,-12,15] 2
[5,9,-9,85,15]
Se piden diferentes versiones de la misma funci�n:
- Con definici�n de listas por comprensi�n
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
ejercicioA2 [] _ acum = acum
ejercicioA2 (l:ls) num acum = if (l `mod`num /= 0) then ejercicioA2 ls num (l:acum) else ejercicioA2 ls num acum

{- B)
 Dada la siguiente definici�n de funci�n
doble :: Int -> Int
doble x = x + x
�C�mo cambiar�a la definici�n utilizando expresiones lambda?
-}

doble :: Int -> Int
doble x = x + x

ejercicioB :: Int -> Int
ejercicioB x = (\n -> n*2) x 

{- C)
Se pide una funci�n en Haskell que dada una lista de n�meros enteros obtenga un
n�mero entero con el resultado de calcular el doble de cada uno de los elementos de la
lista original y sumarlos todos. Se piden diferentes versiones de la misma funci�n:
- Con recursividad no final
- Con recursividad final o de cola
- Utilizando expresiones lambda u orden superior (se puede hacer uso de la
funci�n predefinida de Haskell map). 
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
Implementa una funci�n que sume los cuadrados de los n�meros pares contenidos en
una lista de n�meros enteros. Se piden dos versiones:
a. Una versi�n que haga uso de las funciones de orden superior de listas map y
filter para definir la nueva funci�n.
b. Una versi�n que utilice la definici�n de listas por comprensi�n.

 -}
 
ejercicioDb :: [Int] -> Int
ejercicioDb l = foldr (+) 0 [(x^2) | x <- l , x `mod` 2 == 0] -- Right , de derecha a izq

ejercicioDa :: [Int] -> Int
ejercicioDa l = foldr (+) 0  (map (^2) (filter even l))

{- E)
Dada una lista de enteros, implementar una funci�n para devolver tuplas formadas por
los elementos (sin repetir) de la lista, junto con la primera posici�n en la que aparecen.
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
Implementar en Haskell una funci�n que calcule el n�mero de secuencias de ceros que
hay en una lista de n�meros.
-}

ejericicioF :: [Int] -> Int
ejericicioF [] = 0
ejericicioF [0] = 1
ejericicioF [x] = 0
ejericicioF (0:0:xs) = ejericicioF(0:xs)
ejericicioF (0:x:xs) = 1 + ejericicioF xs
ejericicioF (y:x:xs) = ejericicioF (x:xs)

{- G)
Implementar una funci�n en Haskell que reciba una lista de n�meros enteros y devuelva
dos listas: una con los elementos sin repetir y otra con los elementos que est�n
repetidos.
-}

-- Mirar Veces de Fold

ejercicioG :: [Int] -> ([Int],[Int])
ejercicioG [] = ([],[])
ejercicioG l = ejercicioGAux l [] [] []

ejercicioGAux :: [Int] -> [Int] -> [Int] -> [Int] -> ([Int],[Int])
ejercicioGAux [] vistos repetidos unicos = (repetidos,unicos)
ejercicioGAux (x:xs) vistos repetidos unicos = if esta vistos x then ejercicioGAux xs (vistos) (x:repetidos) unicos 
												else ejercicioGAux xs (x:vistos) repetidos (x:unicos)
												
eliminar :: [Int] -> Int -> [Int]
eliminar [] _ = []
eliminar (n:ns) e = if n == e then ns else  n:(eliminar ns e) 

{- H)
Dada una lista de n�meros enteros implementar una funci�n que devuelva una lista con
los n elementos mayores de la lista original. 
-}

-- Mirar MayorTres de Fold

ejercicioH :: [Int] -> Int -> [Int] 
ejercicioH [] _  = []

mayor :: [Int] -> Int
mayor [] = 0
mayor (l:ls) = if l > mayor ls then l else mayor ls

esMayor :: [Int] -> Int -> Bool
esMayor [] _ = False
esMayor (n:ns) e = if e > n then True else esMayor ns e

{- K
Implementa una funci�n polim�rfica en Haskell que reciba 2 listas y vaya cogiendo un
elemento de la primera y dos de la segunda, creando una lista final de ternas. En caso
de que una de las dos listas se acabe, mostrar� la lista de ternas construidas hasta ese
momento.
-}

ejercicioK :: [Int] -> [Int] -> [(Int,Int,Int)]
ejercicioK [] _ = []
ejercicioK _ [] = []
ejercicioK _ [x] = []
ejercicioK (x:xs)(y:y2:ys) = (x,y,y2):ejercicioK xs ys

{- L)
Se pide una funci�n polim�rfica en Haskell que dado un elemento y una lista a�ada
dicho elemento al final de la lista.
-}

ejercicioL :: [Int] -> Int -> [Int]
ejercicioL lista n = foldr (\x acum -> x:acum) [n] lista


