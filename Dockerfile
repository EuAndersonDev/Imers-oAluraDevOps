FROM python:3.12.11-alpine3.22


# Define diretório de trabalho
WORKDIR /app
# Copia os arquivos de dependências
COPY requirements.txt .
# Instala as dependências do Python
RUN pip install --no-cache-dir -r requirements.txt
# Instala dependências do sistema
RUN apk add --no-cache gcc musl-dev libffi-dev







# Copia o restante da aplicação
COPY . .

# Expõe a porta padrão do FastAPI/Uvicorn
EXPOSE 8000

# Comando para rodar o servidor
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]