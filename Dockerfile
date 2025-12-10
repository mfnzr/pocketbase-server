FROM alpine:latest

# Instalar dependências necessárias (certificados)
RUN apk add --no-cache ca-certificates

# Criar diretório de trabalho
WORKDIR /app

# Copiar o binário e os dados
COPY pocketbase ./pocketbase
COPY pb_data ./pb_data
COPY pb_migrations ./pb_migrations

# Garantir permissão de execução
RUN chmod +x ./pocketbase

# Expor a porta padrão do PocketBase
EXPOSE 8090

# Rodar o PocketBase no modo server
CMD ["./pocketbase", "serve", "--http", "0.0.0.0:8090"]
