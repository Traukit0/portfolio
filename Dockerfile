# Imagen base oficial de Python
FROM python:3.11-slim

# Instalar dependencias del sistema
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    git \
    unzip \
    && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

# Crear directorio de trabajo
WORKDIR /app

# Copiar archivos del proyecto
COPY . .

# Copiar script de instalación de Bun
COPY bun_install.sh /usr/local/bin/bun_install.sh

# Dar permisos de ejecución al script
RUN chmod +x /usr/local/bin/bun_install.sh && \
    /usr/local/bin/bun_install.sh

# Instalar Reflex y dependencias del proyecto
RUN pip install --upgrade pip && \
    pip install reflex==0.7.5 && \
    pip install -r requirements.txt && \
    reflex init

# Exponer el puerto por defecto
EXPOSE 3001

# Ejecutar Reflex en modo producción
CMD ["reflex", "run", "--env", "prod"]
