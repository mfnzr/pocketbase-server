FROM alpine:latest

WORKDIR /app

# Instalar dependências necessárias
RUN apk add --no-cache ca-certificates

# Copiar o executável Linux do PocketBase
COPY pocketbase /app/pocketbase

# Copiar dados e migrações
COPY pb_data /app/pb_data
COPY pb_migrations /app/pb_migrations

RUN chmod +x /app/pocketbase

EXPOSE 8090

CMD ["./pocketbase", "serve", "--http", "0.0.0.0:8090"]
