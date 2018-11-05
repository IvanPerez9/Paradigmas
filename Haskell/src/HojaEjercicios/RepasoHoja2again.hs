module HojaEjercicios.RepasoHoja2again where

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

cribar :: [Int] ->Int -> [Int]
cribar lista n = [x | x <- lista , x `mod` n /=0 ]

cribar' :: [Int] -> Int -> [Int]
cribar' [] _ = []
cribar' (x:xs) n = if x `mod` n /= 0 then x:cribar' xs n else cribar xs n

cribar'' :: [Int] -> Int -> [Int]
cribar'' []_ = []
cribar'' lista n = cribarAux lista n []

cribarAux :: [Int]-> Int -> [Int] -> [Int]
cribarAux []_ acum = acum
cribarAux (x:xs) n acum = if x `mod` n /=0 then cribarAux xs n (acum++[x]) else cribarAux xs n acum

{- B)
 Dada la siguiente definici�n de funci�n
doble :: Int -> Int
doble x = x + x
�C�mo cambiar�a la definici�n utilizando expresiones lambda?
-}

doble :: Int -> Int
doble x = x + x

doble' :: Int -> Int
doble' x = (\n -> n*2) x

{- C)
Se pide una funci�n en Haskell que dada una lista de n�meros enteros obtenga un
n�mero entero con el resultado de calcular el doble de cada uno de los elementos de la
lista original y sumarlos todos. Se piden diferentes versiones de la misma funci�n:
- Con recursividad no final
- Con recursividad final o de cola
- Utilizando expresiones lambda u orden superior (se puede hacer uso de la
funci�n predefinida de Haskell map). 
-}

dobleLista :: [Int] -> Int
dobleLista [] = 0
dobleLista [x] = 2*x
dobleLista (x:xs) = (2*x) + dobleLista xs

ejercicioC :: [Int] -> Int
ejercicioC lista = ejercicioCaux lista 0

ejercicioCaux :: [Int] -> Int -> Int
ejercicioCaux [] _ = 0
ejercicioCaux (x:xs) cont = ejercicioCaux xs (cont + 2*x)

ejerC :: [Int] -> Int
ejerC lista = foldl (+) 0 (map (2*) lista)

{- D)
Implementa una funci�n que sume los cuadrados de los n�meros pares contenidos en
una lista de n�meros enteros. Se piden dos versiones:
a. Una versi�n que haga uso de las funciones de orden superior de listas map y
filter para definir la nueva funci�n.
b. Una versi�n que utilice la definici�n de listas por comprensi�n.
 -}
 
sumaCuadrado :: [Int] -> Int
sumaCuadrado lista = foldl (+) 0 (map (^2) (filter even lista))

sumaCuadradoB :: [Int] -> Int
sumaCuadradoB lista = foldl (+) 0 [x^2 | x <- lista , x `mod` 2 == 0]

{- E)
Dada una lista de enteros, implementar una funci�n para devolver tuplas formadas por
los elementos (sin repetir) de la lista, junto con la primera posici�n en la que aparecen.
-}

ejercicioE :: [Int] -> [(Int,Int)]
ejercicioE lista = ejercicioEaux lista 1 [] []

pertenece :: [Int] -> Int -> Bool
pertenece (x:xs) n = if n == x then True else pertenece xs n

ejercicioEaux :: [Int] -> Int -> [Int] -> [(Int,Int)] ->[(Int,Int)]
ejercicioEaux [] pos repetidos resultado = resultado
ejercicioEaux (l:ls) pos repetidos resultado = if pertenece repetidos l then 
												ejercicioEaux ls (pos+1) repetidos resultado
												else ejercicioEaux ls (pos+1) (repetidos++[l]) ((l,pos):resultado)


{- F)
Implementar en Haskell una funci�n que calcule el n�mero de secuencias de ceros que
hay en una lista de n�meros.
-}

ejercicioF :: [Int] -> Int
ejercicioF [] = 0
ejercicioF [0] = 1
ejercicioF [x] = 0
ejercicioF (0:0:xs) = ejercicioF(0:xs)
ejercicioF (0:x:xs) = 1 + ejercicioF xs
ejercicioF (y:x:xs) = ejercicioF (x:xs)

{- G)
Implementar una funci�n en Haskell que reciba una lista de n�meros enteros y devuelva
dos listas: una con los elementos sin repetir y otra con los elementos que est�n
repetidos.
-}

ejercicioG :: [Int] -> ([Int],[Int])
ejercicioG lista = ejercicioGaux lista [] [] [] 

ejercicioGaux :: [Int] -> [Int] -> [Int] -> [Int] -> ([Int],[Int])
ejercicioGaux [] vistos repetidos unicos = (unicos, repetidos)
ejercicioGaux (x:xs) vistos repetidos unicos = if pertenece vistos x then 
												ejercicioGaux xs vistos (repetidos++[x]) unicos
												else ejercicioGaux xs (vistos++[x]) repetidos (x:unicos)


{- H)
Dada una lista de n�meros enteros implementar una funci�n que devuelva una lista con
los n elementos mayores de la lista original. 
-}

ejercicioH :: [Int] -> Int -> [Int]
ejercicioH lista n = ejercicioHaux lista n 0 []

ejercicioHaux :: [Int] -> Int -> Int -> [Int] -> [Int]
ejercicioHaux [] n cont salida = salida
ejercicioHaux (x:xs) n cont salida = if cont<n then ejercicioHaux xs n (cont+1) (x:salida)
									 else let a = menor salida in
									 if x < a then ejercicioHaux xs n cont salida
									 else ejercicioHaux xs n cont (intercambiar salida a x)

menor::[Int]->Int
menor [x]= x
menor (x:xs) = menorAux xs x

menorAux::[Int] ->Int->Int
menorAux [ ] x = x
menorAux (y:ys) x = if y<x then menorAux ys y else menorAux ys x 

intercambiar:: [Int] -> Int -> Int -> [Int]
intercambiar [] _ _ = []
intercambiar (x:xs) y z = if x==y then z:xs else x:(intercambiar xs y z) 

{- L)
Se pide una funci�n polim�rfica en Haskell que dado un elemento y una lista a�ada
dicho elemento al final de la lista.
-}

ejercicioL :: [a] -> a -> [a]
ejercicioL lista n = foldr (\x acum -> x:acum) [n] lista
