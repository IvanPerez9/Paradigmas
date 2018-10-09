module HojasEjercicios.HojaEjercicios1 where

import Data.Char

-- a) Implementar una funci�n en Haskell que dados tres n�meros enteros determine si est�n
--    ordenados de menor a mayor. ejercicioA 3 4 5 

ejercicioA :: Int -> Int -> Int -> Bool 
ejercicioA x y z = if (x<y) && (y<z) then True else False

-- b) Implementar una funci�n en Haskell que dados tres n�meros enteros los devuelva
--    ordenados de menor a mayor. 

ejercicioB :: Int -> Int -> Int -> (Int,Int,Int)
ejercicioB x y z  
				| z>x && z>y && y>x = (x,y,z)
				| y>x && y>z && z>x = (y,z,x)
				| x>y && x>z && y>z = (z,y,x)
				| z>x && z>y && x>y = (z,x,y)
				| y>x && y>z && z<x = (y,x,z)
				| x>y && x>z && z>y = (y,z,x)
			    | otherwise =(1,1,1)
			  
-- c)  Implementar en Haskell una funci�n que reciba un n�mero real y devuelva una tupla
--     con su parte entera y sus dos primeros decimales (como n�mero entero).

ejercicioC :: Double -> (Int,Int)
ejercicioC x = (truncate(x) , truncate( (x - fromInteger(truncate (x))) * 100))

-- d) Crear una funci�n que reciba el radio de una circunferencia y devuelva una 2-tupla con
--  la longitud de la circunferencia y con el �rea del c�rculo. Emplea una definici�n local con
-- la cl�usula where para almacenar el valor de Pi (Nota: no se debe utilizar la funci�n
-- predefinida pi). A continuaci�n crear una funci�n con el mismo cometido empleando la
-- definici�n local let.

ejercicioD :: Double -> (Double,Double)
ejercicioD x = (pi*x*x , pi * x*x) where pi = 3.14

ejercicioD' :: Double -> (Double,Double)
ejercicioD' x = let pi =3.14 in (pi*x*x, pi*x*x)

-- e) Implementar la funci�n predefinida de listas concat, que se llamar� concatenar,
-- utilizando la definici�n de listas por comprensi�n (no se puede utilizar recursividad).

--ejercicioE :: [Int] -> [Int] -> [Int]
--ejercicioE x:xs y:ys = 

-- f) Implementar una funci�n que dado un n�mero entero devuelva en una lista todos los
-- factores de dicho n�mero. Se debe utilizar la definici�n de listas por comprensi�n. 

ejercicioF :: Int -> [Int]
ejercicioF x = [ y | y <- [1..x] , x `mod` y == 0]

-- h) Implementar una funci�n que diga cu�ntos caracteres en may�scula est�n contenidos
-- en una frase dada. Se deber� utilizar la definici�n de listas por comprensi�n. 

ejercicioH :: String -> Int
ejercicioH s = length [c | c <- s, isUpper c]

-- i) Implementar una funci�n que dada una tupla de tres elementos, donde cada uno de
-- ellos es a su vez una tupla de dos elementos de tipo String e Int respectivamente,
--retorne el primer elemento de cada tupla interna. Se deber� utilizar ajuste de patrones. 

ejercicioI :: ((String,Int),(String,Int),(String,Int)) -> (String,String,String)
ejercicioI ((s,_),(d,_),(f,_)) = (s,d,f)

-- j)  Implementar una funci�n que devuelve True si la suma de los cuatro primeros
-- elementos de una lista de n�meros enteros es un valor menor a 10 y devolver� False
-- en caso contrario. Se deber� utilizar ajuste de patrones.

ejercicioJ :: [Int] -> Bool
ejercicioJ [x,y,z,t] = if (x+y+z+t) < 10 then True else False
ejercicioJ [] = False

-- k) Implementar una funci�n que dado un car�cter, que representa un punto cardinal,
-- devuelva su descripci�n. Por ejemplo, dado �N� devuelva �Norte�.

{- ejercicioK :: Char -> String
ejercicioK c
			| 'N' = "Norte"
			| 'S' = "Sur"
			| 'O' = "Oeste"
			| 'E' = "Este"
			| otherwise "MAL"  
			-}
			
			
-- l) Implementar una funci�n que dada una frase retorne un mensaje donde se indique cu�l
-- es la primera y �ltima letra de la frase original. Un ejemplo de aplicaci�n de la funci�n
-- podr�a ser
--  Se debe usar ajuste de patrones y se puede utilizar tambi�n patrones nombrados

{-
> procesarFrase "El perro de San Roque"
"La primera letra de la frase ''El perro de San Roque'' es 'E' y la
ultima letra es 'e'"
-}

ejercicioL :: String -> String
ejercicioL "" = "Cadena Vacia"
ejercicioL s = "La primera letra de la frase" ++ s ++ "es" ++ [head s] ++ "Y la ultima es: " ++ [last s]


-- m) Implementar una funci�n que dado un n�mero entero devuelva mensajes indicando en
-- qu� rango de valores se encuentra dicho n�mero (menor de 10, entre 10 y 20 o mayor
-- de 20). Se debe utilizar definiciones locales.

ejercicioM :: Int -> String
ejercicioM x
			| x< 10 = cad ++ "menor de 10"
			| x<= 20 = cad ++ "entre 10 y 20"
			| x >20 = cad ++ "mayor de 20"
			where cad = "El valor de entrada es "
			
-- n) Implementar una funci�n que dada una cadena de caracteres y un car�cter, indique el
-- n�mero de apariciones del car�cter en la cadena. No se debe utilizar recursividad, s�
-- ajuste de patrones. Pista: utilizar la definici�n de listas por comprensi�n.

ejercicioN :: String -> Char -> Int
ejercicioN ""_ = 0
ejercicioN s c = length [t | t <- s, t == c]