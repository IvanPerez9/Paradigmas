'''
Created on 27 dec. 2018

@author: IvanPerez9

'''
import re
# ¿Qué cadena evalúa ‘ab*’?
# R: Evalua ab de 0 a N veces

# ¿Qué patrón evalúa la cadena ‘abab…ab’?
# R: ab* o ab+ si al menos tiene 1

# Dado el patrón ‘a.*c’ y la cadena ‘abcabc’ ¿qué evalúa?
# R: El primer abc y el segundo, a seguido de cualquier caracter y terminado en c . Sin $ no para

# ¿Qué patrón evalúa una ‘a’ seguida de 3 o más ‘b’?
r = re.match("abbb+" , "abbb")
print(r)

#¿Qué patrón evalúa la primera palabra de una cadena?
r2 = re.match("[^ ]+" , "Hola que tal")
print(r2)

#Las casillas del ajedrez están nombradas con letras(columnas) y
#números (filas). Escribe una expresión regular que evalúe si una
#cadena tiene sólo posiciones validas de ajedrez.
r3 = re.match("[a-hA-h][1-8]+?" , "h4")
print(r3)

"""
Search: busca el primer substring que cumpla el patrón.
• Findall: devuelve una lista con todos los substring.
• Sub: sustituye el substring que cumple el patrón por otro substring.
• Compile: permite preprocesar un patrón.
"""

#Numeros en hexadecimal. Comprobar una cadena tenga numeros en hexadecimal
#Puede tener solo letras o solo numeros

r4= re.match("[0-9a-fA-f]+$" , "8f3a")
r44= re.match("[0-9a-fA-f]+" , "8f3azzzz") #Diferencias, con si $ acaba o no
print(r4)

#Crea una función que devuelva si una cadena es un identificador valido para una variable
# Empieza por minuscula, sin _ ni simbolos, ni numero

r5 = re.match("[_]*[A-Za-z]+[_0-9a-zA-Z]*$" , "Vvarible")
print(r5)

#Crear una función que devuelva si una subcadena esta contenida en un string.

r6 = re.search("pene+" , "cadepenpenena")
print(r6)

#Crear una función que recibe una cadena y la devuelve
#eliminando los espacios duplicados.

r7 = re.sub("  ", " " , "Hola  que tal")
print(r7)

#Crear una función que devuelva cuantas veces aparece en una
#cadena la palabra “esta”

r8 = re.findall(r"\besta\b" , "esta estanteria esta atestada")
print(len(r8))

#Crear una función que dada una lista de números [1, 3, 10, 23]
#devuelva [‘001’, ‘003’, ‘010’, ‘023’]

def subprograma(lista):
    listaAux = []
    n = len(str(max(lista))) #Devuelve la longitud del numero maximo de la lista
    for e in lista:
        listaAux.append(str(e).zfill(n+1)) #zfill devuelve cadena de n ceros
    return listaAux

lista = [1,3,10,23]
n = len(str(max(lista))) #probar
print(subprograma([1,3,10,23]))

#Crear una función que devuelva texto entrecomillado dentro de una cadena.

r9 = re.findall(r" '.*? " , "Hola 'Ivan' que tal ")
print(r9)

#Crear una función que devuelve si una cadena es capicúa.
print("\n")

def capicua(cadena):
    print("Funcion capicua con: " + cadena)
    indice = -1
    contador = 0
    for e in range(0,len(cadena)):
        if cadena[e] == cadena[indice]:
            indice -= 1
            contador += 1
    if contador == (len(cadena)):
        return print("Es capicua")
    else:
        return print("No es capicua")
            
capicua("121")