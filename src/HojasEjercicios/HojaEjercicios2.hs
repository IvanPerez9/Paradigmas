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
ejercicioC' l = ejercicioCAux l 0 -- Le paso la lista y la acumulacion de sumarlos 

ejercicioCAux :: [Int] -> Int -> Int
ejercicioCAux (n:ns) acum = ejercicioCAux ns (2*n + acum) 

-- Con expresion lamda
{-
ejercicioC'' :: [Int] -> Int 
ejercicioC'' lista = map ((*2) lista)
-}

{- Implementa una funci�n que sume los cuadrados de los n�meros pares contenidos en
una lista de n�meros enteros. Se piden dos versiones:
a. Una versi�n que haga uso de las funciones de orden superior de listas map y
filter para definir la nueva funci�n.
b. Una versi�n que utilice la definici�n de listas por comprensi�n.
-}

ejercicioD :: [Int] -> Int
ejercicioD l = [ t | t <- l , if t `mod` 2 == 0 then 
    
    
    
 