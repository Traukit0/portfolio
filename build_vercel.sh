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

# Verificar estructura de directorios y copiar archivos
if [ -d ".web/_static" ]; then
    echo "📁 Copiando desde .web/_static"
    cp -r .web/_static public
elif [ -d ".web" ]; then
    echo "📁 Copiando desde .web"
    cp -r .web public
else
    echo "❌ Error: No se encontró directorio de build"
    ls -la
    exit 1
fi

# Limpiar archivos temporales
rm -rf .web
deactivate

echo "✅ Build completado exitosamente"
echo "📂 Contenido del directorio public:"
ls -la public/
