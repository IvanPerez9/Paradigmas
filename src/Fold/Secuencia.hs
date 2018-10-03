module Fold.Secuencia where


-- Orden de creacion de la lista 
-- 1. Con map y recursividad
-- 2. Listas por compresion y flod 

-- Si la lista es una lista vacia, devolvemos una lista con una lista vacia 

-- Si le paso el [1,4,5,6,7] devolver como se crea, empieza [[]] , [[1]] , [[1,4]], [[1,4,5]]
secuencia :: [a] -> [[a]]
secuencia lista = foldl (\acum x -> acum ++ [last acum++[x]]) [[]] lista


-- n Mayor 3 [1,3,4,5,7] la lista con los 3 mayores -- Con recursividad normal 