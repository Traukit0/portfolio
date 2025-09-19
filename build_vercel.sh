#!/bin/bash

# Script de build optimizado para Vercel (Linux/macOS)
echo "🚀 Iniciando build para Vercel..."

# Crear entorno virtual
python3 -m venv .venv
source .venv/bin/activate

# Actualizar pip e instalar dependencias
pip install --upgrade pip
pip install -r requirements.txt

# Limpiar directorio público anterior
rm -rf public

# Inicializar Reflex
reflex init

# Exportar solo frontend (optimizado)
reflex export --no-zip --frontend-only

# Mover archivos estáticos al directorio public
mv .web/_static public

# Limpiar archivos temporales
rm -rf .web
deactivate

echo "✅ Build completado exitosamente"
