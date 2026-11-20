# Imagen base oficial de Python 3.12 versión liviana (slim)
FROM python:3.12-slim

# Definir /app como carpeta de trabajo
WORKDIR /app

# Copiar solo requirements.txt e instalar dependencias sin guardar caché
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar las carpetas que necesita la app
COPY app/ ./app/
COPY frontend/ ./frontend/
COPY models/ ./models/

# Exponer el puerto 8000
EXPOSE 8000

# Comando de arranque del servidor uvicorn
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
