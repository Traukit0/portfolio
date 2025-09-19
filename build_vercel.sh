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

# Exportar como sitio estático sin prerender
reflex export --frontend-only --no-zip --no-prerender

# Limpiar archivos temporales
deactivate

echo "✅ Build completado exitosamente"
