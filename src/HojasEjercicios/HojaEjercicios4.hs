module HojasEjercicios.HojaEjercicios4 where

{-
Listado de ejercicios para poner en pr�ctica los conocimientos adquiridos sobre definici�n de tipos
sin�nimos y nuevos tipos, tipos recursivos y tipos recursivos polim�rficos. Y tambi�n sobre el
manejo de clases de tipos en Haskell.
-}

--  Se quiere ordenar los elementos de una lista (cuyos elementos son comparables) mediante el algoritmo del quicksort.

ejercicioA :: Ord a => [a] -> [a]
ejercicioA [] = []
ejercicioA (x:xs) = ejercicioA [z | z <- xs, z<x] ++ [x] ++ ejercicioA [y | y <- xs, y>=x]

{-
Ejercicio B
Se pide implementar una funcion que dado un numero (de cualquier tipo que
soporte la operacion de division) y una lista de numeros del mismo tipo,
divida a ese numero por cada uno de los elementos contenidos en la lista y
devuelva una lista con el resultado.
-}

ejercicioB :: Float ->  [Float] -> [Float]
ejercicioB _ [] = []
ejercicioB num lista = foldl (\acum x -> [num/x] ++ acum) [] lista

{-

Dado un nuevo tipo de datos para representar un �rbol binario de cualquier tipo, definido
como sigue:
data Arbol a = AV | Rama (Arbol a) a (Arbol a)
Se pide definir una funci�n que visualice el �rbol por pantalla de una determinada forma:
separando cada hijo izquierdo y derecho por �|�, la ra�z entre guiones y cada nivel diferente
del �rbol por �( )�.

 mostrarArbol (Rama AV 5 (Rama AV 4 AV))
"()|-5-|(4)"


-}

data Arbol a = AV | Rama (Arbol a) a (Arbol a)

ejercicioC :: (Show a) => Arbol a -> String
ejercicioC AV = ""
ejercicioC (Rama AV r AV) = "|-" ++ show r ++ "-|" 
-- Rama es el constructor de tipo 
ejercicioC (Rama der r izq) = "(" ++ ejercicioC (der) ++ ") |- " ++ show r ++ " |- (" ++ ejercicioC (izq) ++ ")" 


-- Se pide definir una funci�n que calcule el espejo de un �rbol. 

data ArbolD a = AVD | RamaD (ArbolD a) a (ArbolD a) deriving Show
ejercicioD :: (Show a) => ArbolD a -> ArbolD a
ejercicioD AVD = AVD
ejercicioD (RamaD AVD r AVD) = (RamaD AVD r AVD)
ejercicioD (RamaD izq r der) = RamaD (ejercicioD der) r (ejercicioD izq) -- Ojo los parentesis 

{- Ejercicio I 
Se pide crear una nueva CLASE de tipos, llamada Coleccion, para representar
colecciones de datos de cualquier tipo, donde los tipos pertenecientes a
esta clase tendr�n el siguiente comportamiento:

	esVacia: funci�n para saber si la colecci�n est� vac�a.
	insertar: insertar� un nuevo elemento en la colecci�n.
	primero: devolver� el primer elemento de la colecci�n.
	eliminar: eliminar� un elemento de la colecci�n.
	size: devolver� el n�mero de elementos de la colecci�n.
	
Algunas de las funciones anteriores variar�n su implementaci�n en funci�n
del tipo de colecci�n particular que sea instancia de la clase Coleccion. Por
ello, se pide crear dos instancias diferentes de esta clase para los dos
nuevos tipos de datos que se presentan a continuaci�n:
data Pila a = Pil [a] deriving Show
data Cola a = Col [a] deriving Show
-}

data Pila a = Pil [a] deriving Show
data Cola a = Col [a] deriving Show

-- Poner la "Collecion" "c" y luego "El tipo de Dato" "a" 

class Collection c where 
				 esVacia :: c a -> Bool
				 insertar :: c a -> a -> c a
				 primero :: c a -> a
				 eliminar :: c a -> c a
				 size :: c a -> Int

-- Siempre que se toque la pila/cola o lo que sea, poner el constructor
instance Collection Pila where
				 esVacia (Pil a) = length a == 0
				 insertar (Pil a) b = Pil (a ++ [b]) -- Se inserta por el final
				 primero (Pil a) = last a
				 eliminar (Pil a) = Pil (init a)
				 size (Pil a) = length a


