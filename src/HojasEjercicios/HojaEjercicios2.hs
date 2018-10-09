module HojasEjercicios.HojaEjercicios2 where

-- Implementa una funci�n en Haskell que elimine de una lista de enteros aquellos
-- n�meros m�ltiplo de x. Va con Listas por compresion (Forma de recorrer las listas)

ejercicioA :: [Int]-> Int -> [Int]
ejercicioA lista x = [c | c <- lista , c `mod` x /= 0 ]

-- Con recursividad no final 

ejercicioA' :: [Int] -> Int -> [Int]
ejercicioA' []_ = []
ejercicioA' (l:ls) x = if l `mod` x /= 0 then l:ejercicioA' ls x else ejercicioA' ls x

-- Con recursividad final o de cola
{-
ejercicioA'' :: [Int] -> Int -> [Int]
ejercicioA'' []_ = []
ejercicioA'' (l:ls) x = if
-}

{- Dada la siguiente definici�n de funci�n
doble :: Int -> Int
doble x = x + x
�C�mo cambiar�a la definici�n utilizando expresiones lambda?
-}

ejercicioB :: Int -> Int
ejercicioB x = x

{- Se pide una funci�n en Haskell que dada una lista de n�meros enteros obtenga un
n�mero entero con el resultado de calcular el doble de cada uno de los elementos de la
lista original y sumarlos todos. Se piden diferentes versiones de la misma funci�n:
- Con recursividad no final
- Con recursividad final o de cola
- Utilizando expresiones lambda u orden superior (se puede hacer uso de la
funci�n predefinida de Haskell map). -}

ejercicioC :: [Int] -> Int
ejercicioC [] = 0
ejercicioC (l:ls) = (2*l) + ejercicioC ls -- Porque no 2*l : ejercicioC ls 

ejercicioC' :: [Int] -> Int
ejercicioC' [] = 0
ejercicioC' l = ejercicioCAux l 0

ejercicio