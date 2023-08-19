#!/bin/bash

# -f es para archivos
# -d direcotiro exsite?
# -e existe

imprimirTitulo(){
    printf "\t  _____                 _           _         \n" # Rectangles 
    printf "\t |     |___ ___ ___ ___|_|___ ___ _| |___ ___ \n"
    printf "\t |  |  |  _| . | .'|   | |- _| .'| . | . |  _|\n"
    printf "\t |_____|_| |_  |__,|_|_|_|___|__,|___|___|_|  \n"
    printf "\t           |___|                              \n"
}

imprimirLinea(){
    printf "\n\t --------------------------------------------- \n"
}

solicitarNombreCarpeta(){
    printf "\n\t Carpeta que desea organizar: "
    read carpeta
}

borrarCache(){
    rm -r ~/.cache/pip/
}

# función que trabaja con una bandera para saber si existe 
# la carpeta y con esto poder seguir con elflujo del programa
buscarCarpeta(){
    # Se quiere buscar la carpeta a organizar

    # 1. Primero obtenemos la ubicación de la carpeta
    ubiCarpeta=$(find ~/ -name "$carpeta")
    echo $ubiCarpeta

    # 2. Valisamos que esa ubicación exista en el SO
    if [ -d "$ubiCarpeta" ] # La carpeta existe
    then
        bandera=1 # Bandera para saber si existe
    else # La carpeta no existe en el So
        bandera=0 # Para decir que no existe
    fi
}

# Función que crea las carpetas en donde se irán
# moviendo los documentos a organizar
# Nota: aún falta hacer la versión en inglés del SO

# Verifica si ya existen las carpetas en el sistema
validarCarpetaOrganizada(){
    ubiCarpetaOrganizada=$(find ~/ -name "Archivos_organizados")
    #echo $ubiCarpetaOrganizada asdfasd
    printf "\t Verificando información...\n"
    sleep 1.5
    if [ -d "$ubiCarpetaOrganizada" ]
    then # Carpeta organizada existe
        printf "\n\t Ya existe la carpeta\n"
    else # Carpeta organizada no existe
        printf "\t Crando carpetas...\n"
        sleep 0.5
        #mkdir ~/Documentos/Archivos_organizados
        printf "\t Se creó la carpeta organizada"        
    fi
}

main(){
    imprimirTitulo
    imprimirLinea
    #borrarCache

    solicitarNombreCarpeta
    buscarCarpeta
    printf "$bandera \n"
    
    validarCarpetaOrganizada
    
}

main