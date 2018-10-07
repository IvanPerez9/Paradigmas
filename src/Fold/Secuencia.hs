module Fold.Secuencia where


-- Orden de creacion de la lista 
-- 1. Con map y recursividad
-- 2. Listas por compresion y flod 

-- Si la lista es una lista vacia, devolvemos una lista con una lista vacia 

-- Si le paso el [1,4,5,6,7] devolver como se crea, empieza [[]] , [[1]] , [[1,4]], [[1,4,5]]

secuencia :: [a] -> [[a]]
secuencia lista = foldl (\acum x -> acum ++ [last acum++[x]]) [[]] lista

secuencia2 :: [a] -> [[a]]
secuencia2 [] = [[]]
secuencia2 lista = secuencia2 (init lista) ++ [lista]
