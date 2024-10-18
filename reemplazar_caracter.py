def reemplazar_caracteres(texto, caracter_a_reemplazar, caracter_nuevo):
    # Reemplazar el caracter_a_reemplazar con el caracter_nuevo
    texto_modificado = texto.replace(caracter_a_reemplazar, caracter_nuevo)
    
    return texto_modificado

if __name__ == "__main__":
    # Leer el texto desde el archivo "texto_modificado.txt"
    try:
        with open("texto_modificado.txt", "r") as archivo:
            texto = archivo.read()
    except FileNotFoundError:
        print("El archivo 'texto_modificado.txt' no se encuentra en la carpeta.")
        exit()

    # Solicitar los caracteres a reemplazar y el nuevo al usuario
    caracter_a_reemplazar = input("Introduce el carácter que quieres reemplazar: ")
    caracter_nuevo = input("Introduce el nuevo carácter: ")
    
    # Llama a la función y modifica el texto
    texto_modificado = reemplazar_caracteres(texto, caracter_a_reemplazar, caracter_nuevo)
    
    # Imprime los textos
    print("Texto original (desde el archivo):", texto)
    print("Texto modificado:", texto_modificado)
    
    # Guardar el texto modificado en el archivo nuevamente
    with open("texto_modificado.txt", "w") as archivo:
        archivo.write(texto_modificado)
    
    print("El texto modificado ha sido actualizado en 'texto_modificado.txt'.")

