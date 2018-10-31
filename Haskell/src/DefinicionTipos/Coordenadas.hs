module DefinicionTipos.Coordenadas where

-- Ejercicio Hoja 3 b)

{- Funci�n que dado un punto de coordenadas y una direcci�n (Norte, Sur, Este u
Oeste) mueva el punto hacia la direcci�n indicada. Un ejemplo de aplicaci�n de la
funci�n ser�a:
-}

type CoordenadaX = Integer
type CoordenadaY = Integer
data Coordenadas = Punto CoordenadaX CoordenadaY deriving Show
data Direccion = Norte | Sur | Este | Oeste deriving Show

-- Porque punto
-- Es un constructor de datos

mover ::  Direccion -> Coordenadas -> Coordenadas 
mover Norte (Punto x y) = Punto x (y+1)
mover Sur (Punto x y) = Punto x (y-1)
mover Este (Punto x y) = Punto (x+1) y
mover Oeste (Punto x y) = Punto (x-1) y

-- Funci�n que dados dos puntos de coordenadas indique cu�l est� m�s al sur.

masAlSur :: Coordenadas -> Coordenadas -> Coordenadas
masAlSur (Punto x1 y1) (Punto x2 y2) = if (y1<y2) then (Punto x1 y1) else (Punto x2 y2)

-- Funci�n que calcule la distancia entre dos puntos:

distancia :: Coordenadas -> Coordenadas -> Float
distancia (Punto x1 y1) (Punto x2 y2) = sqrt(fromInteger((x1-x2)^2) + fromInteger((y1-y2)^2))