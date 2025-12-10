FROM alpine:latest

# add curl and unzip
RUN apk add --no-cache ca-certificates

# create working directory
WORKDIR /app

# copy pocketbase binary and data
COPY pocketbase ./pocketbase
COPY pb_data ./pb_data
COPY pb_migrations ./pb_migrations

# expose default pocketbase port
EXPOSE 8090

# run pocketbase
CMD ["./pocketbase", "serve", "--http", "0.0.0.0:8090"]
