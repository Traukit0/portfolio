# Imagen base oficial de Python
FROM python:3.11-slim

# Instalar dependencias del sistema
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    git \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Crear directorio de trabajo
WORKDIR /app

# Copiar archivos del proyecto
COPY . .

# Instalar Reflex y dependencias del proyecto
RUN pip install --upgrade pip && \
    pip install reflex==0.7.5 && \
    pip install -r requirements.txt

# Exponer el puerto por defecto
EXPOSE 3001

# Ejecutar Reflex en modo desarrollo
CMD ["reflex", "run"]