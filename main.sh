#!/bin/bash

function menu() {
    while true
    do
        clear
        exec 3>&1
        opcion=$(dialog --clear \
                --backtitle "Gestión de usuarios y grupos" \
                --title "Menú Principal" \
                --radiolist "Seleccione una opción:" 20 70 9 \
                    "1" "Crear un usuario nuevo" off \
                    "2" "Crear un grupo nuevo" off \
                    "3" "Agregar un usuario existente a un grupo existente" off \
                    "4" "Agregar un usuario existente a un grupo no existente" off \
                    "5" "Eliminar un usuario de un grupo" off \
                    "6" "Mostrar el listado de usuarios de un grupo específico" off \
                    "7" "Mostrar todos los grupos existentes en el sistema" off \
                    "8" "Eliminar Usuario" off \
                    "9" "Salir del script" off \
                2>&1 1>&3)
        exit_status=$?
        exec 3>&-
        if [ $exit_status = 0 ]; then
            case $opcion in
                1)
                    crear_usuario
                    ;;
                2)
                    crear_grupo
                    ;;
                3)
                    agregar_usuario_grupo
                    ;;
                4)
                    agregar_usuario_grupo_no_existente
                    ;;
                5)
                    borra_usuario_grupo
                    ;;
                6)
                    lista_usuarios_grupo
                    ;;
                7)
                    lista_grupos
                    ;;
                8)
                    eliminar_usuario
                    ;;
                9)
                    echo "Saliendo del script..."
                    exit 0
                    ;;
                *)
                    echo "Opción inválida. Por favor, seleccione una opción válida."
                    echo
                    echo "Pulse una tecla para continuar..."
                    read -n 1
                    ;;
            esac
        else
            echo "Saliendo del script..."
            exit 0
        fi
    done
}

function install_dialog() {
    if ! command -v dialog &> /dev/null; then
        echo "dialog no está instalado. Intentando instalar..."
        if [ -f /etc/os-release ]; then
            . /etc/os-release
            case $ID in
                debian|ubuntu)
                    sudo apt-get install -y dialog
                    ;;
                centos|fedora|rhel)
                    sudo yum install -y dialog
                    ;;
                arch|manjaro)
                    sudo pacman -Syu --noconfirm dialog
                    ;;
                *)
                    echo "Distribución no soportada. Por favor, instala dialog manualmente."
                    ;;
            esac
        else
            echo "No se pudo detectar la distribución. Por favor, instala dialog manualmente."
        fi
    fi
}

function main() {
    install_dialog
    source operaciones.sh
    clear
    dialog --title "Bienvenido" \
       --msgbox "Gestión de usuarios y grupos" 10 60
    menu
}

main