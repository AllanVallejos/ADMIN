FROM nginx:alpine

# Instalar OpenSSL para generar certificados
RUN apk add --no-cache openssl

# Crear directorio para certificados
RUN mkdir -p /etc/nginx/ssl

# Generar certificado autofirmado
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx.key \
    -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=CL/ST=Maule/L=Curico/O=Utalca/CN=localhost"

# Copiar configuración de nginx
COPY config/nginx.conf /etc/nginx/nginx.conf

# Exponer puertos HTTP y HTTPS
EXPOSE 80 443

# Comando por defecto
CMD ["nginx", "-g", "daemon off;"] 