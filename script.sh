#!/bin/bash

# Configuración
ORIGEN="/ruta/a/tu/carpeta"      # Carpeta que deseas respaldar
DESTINO_BASE="/ruta/a/destino"   # Carpeta base donde se guardarán los respaldos

# Obtener la fecha actual en formato YYYY-MM-DD
FECHA=$(date +%F)

# Definir la carpeta de respaldo con la fecha actual
DESTINO="$DESTINO_BASE/backup_$FECHA"

# Crear la carpeta de respaldo si no existe
mkdir -p "$DESTINO"

# Realizar la copia con rsync
rsync -av "$ORIGEN/" "$DESTINO/"

# Verificar el éxito de la operación
if [ $? -eq 0 ]; then
    echo "Respaldo completado con éxito en $DESTINO"
else
    echo "Error al realizar el respaldo"
    exit 1
fi

