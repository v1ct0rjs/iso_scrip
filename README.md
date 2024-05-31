# iso_shell_script
Repositorio para la asignatura de Implantación de sistemas operativos

# README.md

Script creado para la Tercera evalucación de la asignatura de Implantación de sistemas operativos.
Escrito en bash por Víctor Manuel Jiménez Sánchez.
IES Suarez de Figueroa, Zafra, Badajoz.

Aquí adjunto la explicación del funcionamiento de mi script de bash. Esté escrip está subid a mi repositorio de GitHub, 
en la siguiente dirección: https://github.com/v1ct0rjs/iso_shell_scripts

El motivo de subir este scrips es para poder compartirlo en mi portfolio personal 
https://v1ct0r.dev/ y para poder tenerlo disponible en cualquier momento, para hacerle mejoras o para poder consultarlo.


## Clona el repositorio
```bash
$ git clone git@github.com:v1ct0rjs/iso_shell_scripts.git
```
## Introducción

Este repositorio contiene un conjunto de scripts de shell para la gestión de usuarios y grupos en un sistema Linux. Los scripts están diseñados para ser fáciles de usar, con un sistema de menús claro que guía al usuario a través de las opciones disponibles.

## Scripts

Hay dos scripts principales en este repositorio:

1. `main.sh`: Este es el script principal que proporciona un sistema de menús para el usuario. Importa funciones de `operaciones.sh` y proporciona una interfaz amigable para la gestión de usuarios y grupos.

2. `operaciones.sh`: Este script contiene un conjunto de funciones para la gestión de usuarios y grupos. Estas funciones son utilizadas por `main.sh` para realizar las operaciones reales.

## Funciones

El script `operaciones.sh` contiene las siguientes funciones:

- `crear_usuario`: Esta función crea un nuevo usuario. Pide el nombre de usuario y luego crea el usuario.

- `crear_grupo`: Esta función crea un nuevo grupo. Pide el nombre del grupo y luego crea el grupo.

- `agregar_usuario_grupo`: Esta función añade un usuario existente a un grupo existente. Pide el nombre de usuario y del grupo, verifica si existen, y luego añade el usuario al grupo.

- `agregar_usuario_grupo_no_existente`: Esta función añade un usuario existente a un nuevo grupo. Pide el nombre de usuario y del grupo, verifica si el usuario existe, crea el grupo, y luego añade el usuario al grupo.

- `borra_usuario_grupo`: Esta función elimina un usuario de un grupo. Pide el nombre de usuario y del grupo, verifica si existen, y luego elimina el usuario del grupo.

- `lista_usuarios_grupo`: Esta función lista todos los usuarios en un grupo específico. Pide el nombre del grupo, verifica si existe, y luego lista todos los usuarios en el grupo.

- `lista_grupos`: Esta función lista todos los grupos en el sistema.

## Uso

Este apartado se refiere a cómo se deben utilizar los scripts proporcionados en el repositorio. En este caso, los scripts son `main.sh` y `operaciones.sh`.

El script `main.sh` es el punto de entrada al programa. Este script importa las funciones definidas en `operaciones.sh` y proporciona un menú interactivo para que el usuario pueda seleccionar y ejecutar estas funciones.

Aquí hay un ejemplo de cómo se podría usar este script en un terminal de Linux:

```bash
# Otorga permisos de ejecución al script main.sh
$ chmod +x main.sh

# Ejecuta el script
$ ./main.sh
```

Una vez que el script se está ejecutando, se presentará un menú con varias opciones. Cada opción corresponde a una función específica definida en `operaciones.sh`. Aquí hay un ejemplo de cómo se vería este menú:

```bash
Bienvenido al script de gestión de usuarios y grupos
----------------------------------------------------

Menú de opciones:
1. Crear un usuario nuevo
2. Crear un grupo nuevo
3. Agregar un usuario existente a un grupo existente
4. Agregar un usuario existente a un grupo no existente
5. Eliminar un usuario de un grupo
6. Mostrar el listado de usuarios de un grupo específico
7. Mostrar todos los grupos existentes en el sistema
8. Salir del script

Por favor, seleccione una opción: 
```

El usuario puede entonces introducir el número de la opción que desea ejecutar y seguir las indicaciones proporcionadas por el script. Por ejemplo, si el usuario selecciona la opción 1, el script pedirá al usuario que introduzca un nombre de usuario y luego creará un nuevo usuario con ese nombre.