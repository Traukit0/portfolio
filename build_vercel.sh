#!/bin/bash

# Script de build optimizado para Vercel (Linux/macOS)
echo "🚀 Iniciando build para Vercel..."

# Crear entorno virtual
python3 -m venv .venv
source .venv/bin/activate

# Actualizar pip e instalar dependencias
pip install --upgrade pip
pip install -r requirements.txt

# Inicializar Reflex
reflex init

# Exportar solo frontend (optimizado)
reflex export --frontend-only

# Descomprimir archivos estáticos
unzip frontend.zip -d public
rm -f frontend.zip

# Limpiar archivos temporales
deactivate

echo "✅ Build completado exitosamente"
