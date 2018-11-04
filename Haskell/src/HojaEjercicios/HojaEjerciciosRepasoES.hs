module HojasEjercicios.HojaEjerciciosRepasoES where

{-
Función que dado un listado de nombres lo muestre por pantalla en forma de tabla.
> escribeTabla ["pepe","caramelo","lluvia"]
1: pepe
2: caramelo
3: lluvia
-}

escribeTabla :: [String] -> IO ()
escribeTabla s =  escribeTablaAux s 1
						
escribeTablaAux :: [String] -> Int -> IO ()
escribeTablaAux [] cont = return()
escribeTablaAux (x:xs) cont = do
							  print(show cont ++ ":" ++ x)
							  escribeTablaAux xs (cont+1)
							  

{-
Definir una función que sea capaz de leer dos líneas de la entrada estándar y las
compare, escribiendo una cadena por pantalla que indique si son iguales o no.
> comparaCadenas
Introduce la primera linea: linea1
Introduce la segunda linea: hola
Las cadenas son diferentes
-}

compararCadenas::String->String->Bool
compararCadenas [ ] [ ]= True
compararCadenas [ ] _ = False
compararCadenas _ [ ] = False
compararCadenas (s1:xs1) (s2:xs2) = (s1==s2)&&(compararCadenas xs1 xs2)

comparaCadenas::IO( )
comparaCadenas = do
                   s1<-getLine;
                   s2<-getLine;
                   let result=compararCadenas s1 s2
                   if result then print "La cadenas son iguales" else print "Las cadenas son diferentes"

{- 3
Definir una función que lea el contenido de un fichero de texto, lo procese
invirtiendo todo el contenido y lo escriba de nuevo sobre el mismo fichero de
entrada. (u otro)
-}
invertir :: [a] -> [a]
invertir = foldr (\x acum -> acum ++ [x]) []

main :: IO ()
main = do
		print "Nombre del archivo origen"
		archivoO <- getLine
		print "Nombre de larchivo destino"
		archivoD <- getLine
		contenido <- readFile archivoO
		let invertido = foldr (\c acum->acum ++[c])[] contenido
		writeFile archivoD invertido
		
		
{- 4
 Definir una funcion que sea capaz de ir leyendo lineas de la entrada estandar y las
va imprimiendo junto con el numero de caracteres que tienen. Se ira ejecutando
mientras no se encuentra una linea vacia. Un ejemplo del resultado de la ejecución
de la funcion puede ser:
> leerLineas
Introduce una linea: hola
La linea tiene 4 caracteres
Introduce una linea: casita
La linea tiene 6 caracteres
Introduce una linea:
-}

numeroLista :: IO()
numeroLista = do -- Meter más de una cosa, lo compacta
				print "Introduce una linea: "
				linea <- getLine
				if linea == [] then 
					return() -- Devuelve lo que haya arriba
					else do
					print ("Tiene: " ++ (show(length linea)) ++ "caracteres" ) 
					-- Meto 'show' porque length es tipo int y lo otro string
					numeroLista
				

-- 5. Definir una funcion que sea capaz de copiar el contenido de un fichero en otro. 

copiarFichero :: IO ()
copiarFichero = do
				print "Nombre del fichero de entrada"
				archivoO <- getLine
				print "Nombre archivo de salida"
				archivoS <- getLine
				contenido <- readFile archivoO
				writeFile archivoS contenido 
				
-- 6. Calculadora dos digitos y un operador 

calculadora :: IO()
calculadora = do 
			  print "El primer digito es: "
			  num1 <- readLn -- Por se un numero 
			  --read(a):: Int Casteo a lo que te de la gana
			  print "El segundo digito es: "
			  num2 <- readLn
			  print "La operacion que se realiza es: (+) (-) (/) (*) "
			  operacion <- getChar
			  let resultado = case operacion of 
			  									'+' -> num1 + num2 
			  									'-' -> num1 - num2 
			  print resultado
			  
			  -- If operacion == "+" then print(show(num1+num2)) else return ()
