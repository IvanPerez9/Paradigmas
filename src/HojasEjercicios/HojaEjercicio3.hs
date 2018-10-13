module HojasEjercicios.HojaEjercicio3 where

import Data.Char

{-
Se pide una funci�n que dada una lista de racionales, donde cada racional se define como
dos n�meros enteros (numerador y denominador), y un n�mero racional, devuelva otra
lista con todos los racionales equivalentes al dado. Realiza dos versiones del ejercicio:
1. Empleando type.
2. Empleando data. 
-}

type Numerador = Integer
type Denominador = Integer
type Racional = (Numerador, Denominador) 

ejercicioA :: [Racional] -> Racional -> [Racional]
ejercicioA [] _ = []
ejercicioA  lista (n1,y1) = foldr (\(n2,y2) acum -> if (n1*y2) == (n2*y1) then [(n2,y2)] ++ acum else acum) [] lista

-- Acum es toda la lista, x los elementos. Desde Right, derecha a izquierda
-- Con Data

--type Numerador = Integer
--type Denominador = Integer
data Fraccion = F Numerador Denominador deriving Show 

-- Definir por sus componentes para poder operar mejor 

ejercicioA' :: Fraccion -> Fraccion -> Bool 
ejercicioA' (F n1 d1) (F n2 d2) = n1 * d2 == n2 * d1 

{-
Funci�n que dado un punto de coordenadas y una direcci�n (Norte, Sur, Este u
Oeste) mueva el punto hacia la direcci�n indicada. 
-}

type CoordenadaX = Int
type CoordenadaY = Int
data Coordenadas = C CoordenadaX CoordenadaY deriving Show 
data Direccion = Norte | Sur | Este | Oeste

ejercicioB :: Coordenadas -> Direccion -> Coordenadas
ejercicioB (C x y) Norte = C (x+1) y
ejercicioB (C x y) Sur = C (x-1) y
ejercicioB (C x y) Este = C x (y+1)
ejercicioB (C x y) Oeste = C x (y-1)

-- Funci�n que dados dos puntos de coordenadas indique cu�l est� m�s al sur

ejercicioB' :: Coordenadas -> Coordenadas -> Coordenadas
ejercicioB' (C x1 y1) (C x2 y2) = if x1 < x2 then (C x2 y2) else (C x1 y1)

-- Funci�n que calcule la distancia entre dos puntos

--ejercicioB'' :: Coordenadas -> Coordenadas -> Float
--ejercicioB'' (C x1 y1) (C x2 y2) = sqrt(fromInteger((x1-x2)^2) + fromInteger((y1-y2)^2))

-- Funci�n que dado un punto y una lista de direcciones, retorne el camino que
--forman todos los puntos despu�s de cada movimiento sucesivo desde el punto original

ejercicioB''' :: Coordenadas -> [Direccion] -> [Coordenadas]
ejercicioB''' (C x1 y1) [] = []
--ejercicioB''' (C x1 y1) (l:ls) = (ejercicioB (C x1 y1) l : ejercicioB'''(ejercicioB ((C x1 y1) l ) ls))

{- 
Definir una funci�n que dado un d�a de la semana, indique si �ste es o no laborable. Para
representar el d�a de la semana se deber� crear un nuevo tipo enumerado. 
-}

data Dia = Lunes | Martes |  Miercoles | Jueves | Viernes | Sabado | Domingo
-- ejercicioC :: Dia -> Bool
-- ejercicioC x = if ((x == Sabado) || (x == Domingo)) then False else True

----------------------------------------


{- Ejercicio D
 La empresa RealTimeSolutions, Inc. est� trabajando en un controlador para una central
dom�tica. El controlador recibe informaci�n de termostatos situados en diferentes
habitaciones de la vivienda y bas�ndose en esta informaci�n, activa o desactiva el aire
acondicionado en cada una de las habitaciones. Los termostatos pueden enviar la
informaci�n sobre la temperatura en grados Celsius o Fahrenheit. A su vez, los aparatos de
aire acondicionado reciben dos tipos de �rdenes: apagar y encender (on y off). Se pide:
-}

-- Definir un tipo de datos para representar las temperaturas en ambos tipos de unidades
--type Fahrenheit = Float
--type Celsius = Float
data Temperatura = Celsius Float | Fahrenheit Float deriving Show -- Ojo con definir as�

{- Definir una funci�n convert que dada una temperatura en grados Celsius la
convierta a grados Fahrenheit y viceversa. (Conversi�n de C a F: f = c * 9/5 + 32;
conversi�n de F a C: c = (f � 32) * 5/9.)
-}

convert ::  Temperatura -> Temperatura 
convert (Celsius c) = Fahrenheit (c * (9/5) + 32)

-- Definir un tipo de datos para representar las �rdenes a los aparatos de aire acondicionado (aa)

data AA = Apagado | Encendido deriving Show 

{- 
Definir una funci�n action que dada una temperatura en cierta habitaci�n
determine la acci�n a realizar sobre el aparato de a/a de dicha habitaci�n. El
controlador debe encender el aparato si la temperatura excede de 28�C. 
-}

action :: Temperatura -> AA
action (Celsius c) = if c > 28 then Encendido else Apagado
--action (Fahrenheit f) = action (convert f) 

{- 
Definir un tipo moneda para representar euros y d�lares USA. Definir una funci�n que
convierta entre ambas monedas sabiendo que el factor de conversi�n de euros a d�lares
es 1.14

Ejercicio E
-}

data Moneda = Euros Float | Dolares Float deriving Show 
convertir :: Moneda -> Moneda
convertir (Euros e) = (Dolares (e/1.14))
convertir (Dolares d) = (Euros (d*1.14))


{-  Ejercicio F

Dada el siguiente tipo de datos recursivo que representa expresiones aritm�ticas:
data Expr = Valor Integer
|Expr :+: Expr
|Expr :-: Expr
|Expr :*: Expr deriving Show
e.1) Se pide una funci�n para calcular el valor de una expresi�n.
e.2) Se pide una funci�n para calcular el n�mero de constantes de una expresi�n
-}

data Expr = Valor Integer
	|Expr :+: Expr
	|Expr :-: Expr
	|Expr :*: Expr deriving Show
	
-- 1


