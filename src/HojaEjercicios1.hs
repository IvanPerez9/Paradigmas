module HojaEjercicios1 where

-- a) Implementar una funci�n en Haskell que dados tres n�meros enteros determine si est�n
--    ordenados de menor a mayor. 

ejercicioA :: Int -> Int -> Int -> Bool 
ejercicioA x y z = if x<y && y<z then True else False