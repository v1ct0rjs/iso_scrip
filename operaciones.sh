#!/bin/bash

# Funcion para crear un usuario
function crear_usuario() {
    clear
    nombre_usuario=$(dialog --inputbox "Introduzca el nombre del usuario a crear: " 10 60 3>&1 1>&2 2>&3 3>&-)
    sudo useradd $nombre_usuario
    password=$(dialog --passwordbox "Introduzca la contraseña para el usuario: " 10 60 3>&1 1>&2 2>&3 3>&-)
    echo $password | sudo passwd --stdin $nombre_usuario
    dialog --msgbox "Usuario creado correctamente." 10 60
}

# Funcion para crear un grupo
function crear_grupo() {
    clear
    nombre_grupo=$(dialog --inputbox "Introduzca el nombre del grupo a crear: " 10 60 3>&1 1>&2 2>&3 3>&-)
    sudo groupadd $nombre_grupo
    dialog --msgbox "Grupo creado correctamente." 10 60
}

# Funcion para agregar un usuario a un grupo existente
function agregar_usuario_grupo() {
    clear
    nombre_usuario=$(dialog --inputbox "Introduzca el nombre del usuario: " 10 60 3>&1 1>&2 2>&3 3>&-)
    nombre_grupo=$(dialog --inputbox "Introduzca el nombre del grupo: " 10 60 3>&1 1>&2 2>&3 3>&-)
    sudo usermod -a -G $nombre_grupo $nombre_usuario
    dialog --msgbox "Usuario agregado al grupo correctamente." 10 60
}

# Funcion para agregar un usuario a un grupo no existente
function agregar_usuario_grupo_no_existente() {
    clear
    nombre_usuario=$(dialog --inputbox "Introduzca el nombre del usuario: " 10 60 3>&1 1>&2 2>&3 3>&-)
    nombre_grupo=$(dialog --inputbox "Introduzca el nombre del grupo para crear: " 10 60 3>&1 1>&2 2>&3 3>&-)
    sudo groupadd $nombre_grupo
    sudo usermod -a -G $nombre_grupo $nombre_usuario
    dialog --msgbox "Usuario agregado al nuevo grupo correctamente." 10 60
}

# Funcion para eliminar un usuario de un grupo
function borra_usuario_grupo() {
    clear
    nombre_usuario=$(dialog --inputbox "Introduzca el nombre del usuario: " 10 60 3>&1 1>&2 2>&3 3>&-)
    nombre_grupo=$(dialog --inputbox "Introduzca el nombre del grupo: " 10 60 3>&1 1>&2 2>&3 3>&-)
    sudo deluser $nombre_usuario $nombre_grupo
    dialog --msgbox "Usuario eliminado del grupo correctamente." 10 60
}

# Funcion para mostrar el listado de usuarios de un grupo específico
function lista_usuarios_grupo() {
    clear
    nombre_grupo=$(dialog --inputbox "Introduzca el nombre del grupo: " 10 60 3>&1 1>&2 2>&3 3>&-)
    usuarios=$(grep $nombre_grupo /etc/group | cut -d: -f4)
    dialog --msgbox "Usuarios en el grupo $nombre_grupo: $usuarios" 10 60
}

# Funcion para mostrar todos los grupos existentes en el sistema
function lista_grupos() {
    clear
    grupos=$(cat /etc/group | cut -d: -f1)
    dialog --msgbox "Grupos existentes en el sistema: $grupos" 10 60
}

# Funcion para eliminar un usuario
function eliminar_usuario() {
    clear
    nombre_usuario=$(dialog --inputbox "Introduzca el nombre del usuario a eliminar: " 10 60 3>&1 1>&2 2>&3 3>&-)
    respuesta=$(dialog --yesno "¿Está seguro de que desea eliminar el usuario $nombre_usuario?" 10 60 3>&1 1>&2 2>&3 3>&-)
    if [ $? -eq 0 ]; then
        sudo userdel -r $nombre_usuario
        dialog --msgbox "Usuario eliminado correctamente." 10 60
    else
        dialog --msgbox "Operación cancelada." 10 60
    fi
}