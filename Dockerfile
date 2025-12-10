FROM alpine:latest

RUN apk add --no-cache ca-certificates

WORKDIR /app

# Copiar o binário Linux
COPY pocketbase ./pocketbase
COPY pb_data ./pb_data
COPY pb_migrations ./pb_migrations

# Permitir execução
RUN chmod +x /app/pocketbase

EXPOSE 8090

CMD ["./pocketbase", "serve", "--http", "0.0.0.0:8090"]
