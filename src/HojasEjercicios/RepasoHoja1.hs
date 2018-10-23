module HojasEjercicios.RepasoHoja1 where

import Data.Char

-- a) Implementar una funci�n en Haskell que dados tres n�meros enteros determine si est�n
--    ordenados de menor a mayor. ejercicioA 3 4 5 

ejercicioA :: Int -> Int -> Int -> Bool
ejercicioA x y z = x<y && y>z

-- b) Implementar una funci�n en Haskell que dados tres n�meros enteros los devuelva
--    ordenados de menor a mayor

ejercicioB :: Int -> Int -> Int -> (Int,Int,Int)
ejercicioB x y z = if (x>y) then ejercicioB y x z
					else if (y>z) then ejercicioB x z y
					else (x,y,z)

-- c)  Implementar en Haskell una funci�n que reciba un n�mero real y devuelva una tupla
--     con su parte entera y sus dos primeros decimales (como n�mero entero).

ejercicioC :: Double -> (Int , Int)
ejercicioC num = (truncate num, truncate (num - fromInteger (truncate num))* 100)

-- d) Crear una funci�n que reciba el radio de una circunferencia y devuelva una 2-tupla con
--  la longitud de la circunferencia y con el �rea del c�rculo. Emplea una definici�n local con
-- la cl�usula where para almacenar el valor de Pi (Nota: no se debe utilizar la funci�n
-- predefinida pi). A continuaci�n crear una funci�n con el mismo cometido empleando la
-- definici�n local let.

ejercicioD :: Double -> (Double ,Double)
ejercicioD radio = (2*pi*radio,pi*radio*radio) where pi = 3.14

ejercicioD' :: Double -> (Double,Double)
ejercicioD' radio = let pi = 3.14 in (2*pi*radio,pi*radio*radio)

-- e) Implementar la funci�n predefinida de listas concat, que se llamar� concatenar,
-- utilizando la definici�n de listas por comprensi�n (no se puede utilizar recursividad).

ejercicioE :: [[Int]] -> [Int]
ejercicioE l = [x | y <- l , x <- y]

-- f) Implementar una funci�n que dado un n�mero entero devuelva en una lista todos los
-- factores de dicho n�mero. Se debe utilizar la definici�n de listas por comprensi�n. 

ejercicioF :: Int -> [Int]
ejercicioF num = [ y | y <- [1..num] , num `mod` y == 0]

{-
 g) Implementar una funcion que diga si un numero es primo. Para ello se debe
utilizar la funcion que calcula el numero de factores de un numero . Utilizando ejercicio F
-}

ejercicioG :: Int -> Bool
ejercicioG num = length (ejercicioF num) < 3

-- h) Implementar una funci�n que diga cu�ntos caracteres en may�scula est�n contenidos
-- en una frase dada. Se deber� utilizar la definici�n de listas por comprensi�n. 

ejercicioH :: String -> Int
ejercicioH s = length [x | x <- s , isUpper x]

-- i) Implementar una funci�n que dada una tupla de tres elementos, donde cada uno de
-- ellos es a su vez una tupla de dos elementos de tipo String e Int respectivamente,
--retorne el primer elemento de cada tupla interna. Se deber� utilizar ajuste de patrones. 

ejercicioI :: ((String,Int),(String,Int),(String,Int)) -> (String,String,String)
ejercicioI ((s,_),(t,_),(k,_)) = (s,t,k)

-- j)  Implementar una funci�n que devuelve True si la suma de los cuatro primeros
-- elementos de una lista de n�meros enteros es un valor menor a 10 y devolver� False
-- en caso contrario. Se deber� utilizar ajuste de patrones.

ejercicioJ :: [Int] -> Bool
ejercicioJ [x,y,z,t] = (x+y+z+t) > 10

-- k) Implementar una funci�n que dado un car�cter, que representa un punto cardinal,
-- devuelva su descripci�n. Por ejemplo, dado �N� devuelva �Norte�.

{-
ejercicioK :: Char -> String
ejercicioK c = 
			  |'N' = "Norte"
			  |'S' = "Sur" 
			  |'E' = "Este"
			  |'O' = "Oeste" 
			  |otherwise "MAL"
-}		  
ejercicioK' :: Char -> String
ejercicioK' 'N' = "Norte"
ejercicioK' 'S' = "Sur"
ejercicioK' 'E' = "Este"
ejercicioK' 'O' = "Oeste"
ejercicioK' ' ' = "Mal."


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
ejercicioL frase = "La primera letra es: " ++ [head frase] ++ "La ultima frase es: " ++ [last frase] 


-- m) Implementar una funci�n que dado un n�mero entero devuelva mensajes indicando en
-- qu� rango de valores se encuentra dicho n�mero (menor de 10, entre 10 y 20 o mayor
-- de 20). Se debe utilizar definiciones locales.

ejercicioM :: Int -> String
ejercicioM num 
				| num < 10 = "Es menor que 10" 
				| num < 20 = "Esta entre 10 y 20" 
				| num > 20 = "Es mayor de 20" 
				
-- n) Implementar una funci�n que dada una cadena de caracteres y un car�cter, indique el
-- n�mero de apariciones del car�cter en la cadena. No se debe utilizar recursividad, s�
-- ajuste de patrones. Pista: utilizar la definici�n de listas por comprensi�n.

ejercicioN:: String -> Char -> Int
ejercicioN s c = length [x| x<-s , c == x ]