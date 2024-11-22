#!/bin/bash

# Configuración
ORIGEN="/ruta/al/directorio/origen"  # Ruta del directorio de origen
DESTINO="/ruta/al/directorio/destino"  # Ruta base del backup
LOGFILE="/ruta/al/directorio/logs/backup.log"  # Archivo de log

# Fecha actual para el directorio incremental
FECHA=$(date +"%Y-%m-%d_%H-%M-%S")
DEST_INCREMENTAL="$DESTINO/incremental-$FECHA"

# Crear el directorio de destino si no existe
mkdir -p "$DESTINO"
mkdir -p "$(dirname "$LOGFILE")"

echo "[$(date)] Iniciando backup incremental" >> "$LOGFILE"

# Ejecutar rsync con opciones para backup incremental
rsync -av --delete \
    --link-dest="$DESTINO/latest" \
    "$ORIGEN/" "$DEST_INCREMENTAL/" >> "$LOGFILE" 2>&1

# Actualizar el enlace simbólico "latest" al backup más reciente
if [ $? -eq 0 ]; then
    rm -f "$DESTINO/latest"
    ln -s "$DEST_INCREMENTAL" "$DESTINO/latest"
    echo "[$(date)] Backup completado exitosamente en $DEST_INCREMENTAL" >> "$LOGFILE"
else
    echo "[$(date)] Error durante el backup" >> "$LOGFILE"
fi

