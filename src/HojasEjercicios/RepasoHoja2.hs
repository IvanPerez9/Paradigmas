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
ejercicioA2 [] _ [] = []
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
ejercicioB x = (\n -> n*2) x -- PORQU� LA X POR FUERA

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
 
ejercicioDa :: [Int] -> Int
ejercicioDa l = foldr (+) 0 [(x^2) | x <- l , x `mod` 2 == 0] -- Right , de derecha a izq
