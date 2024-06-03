#!/bin/bash

# Funcion para crear un usuario
function menu() {
    while true                                                          # Bucle para mostrar el menú
    do
        clear                                                           # Limpiamos la pantalla
        echo
        echo "Bienvenido al script de gestión de usuarios y grupos"
        echo "----------------------------------------------------"
        echo
        echo "Menú de opciones:"
        echo "1. Crear un usuario nuevo"
        echo "2. Crear un grupo nuevo"
        echo "3. Agregar un usuario existente a un grupo existente"
        echo "4. Agregar un usuario existente a un grupo no existente"
        echo "5. Eliminar un usuario de un grupo"
        echo "6. Mostrar el listado de usuarios de un grupo específico"
        echo "7. Mostrar todos los grupos existentes en el sistema"
        echo "8. Eliminar Usuario"
        echo "9. Salir del script"
        echo
        echo "Por favor, seleccione una opción: "
        read opcion
        case $opcion in                                                   # Switch para seleccionar una opción
            1)
                crear_usuario                                             # Llamamos a la función crear_usuario
                ;;
            2)
                crear_grupo                                               # Llamamos a la función crear_grupo
                ;;
            3)
                agregar_usuario_grupo                                      # Llamamos a la función agregar_usuario_grupo
                ;;
            4)
                agregar_usuario_grupo_no_existente
                ;;
            5)
                borra_usuario_grupo                                         # Llamamos a la función borra_usuario_grupo
                ;;
            6)
                lista_usuarios_grupo                                        # Llamamos a la función lista_usuarios_grupo
                ;;
            7)
                lista_grupos                                                # Llamamos a la función lista_grupos
                ;;
            8)
                eliminar_usuario                                            # Llamamos a la función eliminar usuario
                ;;
            9)
                echo "Saliendo del script..."                               # Salimos del script
                exit 0
                ;;
            *)                                                              # Opción por defecto
                echo "Opción inválida. Por favor, seleccione una opción válida." # Mensaje de error si la opción no es válida
                echo
                echo "Pulse una tecla para continuar..."
                read -n 1
                ;;
        esac
    done
}

function main() {
    source operaciones.sh # Importamos el script operaciones.sh
    clear
    echo
    echo          # Mostramos un mensaje de bienvenida
    echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++"
    echo "+                                                   +"
    echo "+          Examen Practico 3º Evaluación            +"
    echo "+             IES Suarez de Figueroa                +"
    echo "+              Autor: Víctor Jiménez                +"
    echo "+                                                   +"
    echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++"
    echo
    echo "Pulse una tecla para continuar..."
    read -n 1
    menu # Llamamos a la función menu
}

main # Llamamos a la función main