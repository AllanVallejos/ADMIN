#!/bin/bash

# Script para generar certificados SSL personalizados
# Uso: ./generate-certs.sh [dominio]

DOMAIN=${1:-localhost}
CERT_DIR="/etc/nginx/ssl"

echo "Generando certificados SSL para: $DOMAIN"

# Crear directorio si no existe
mkdir -p $CERT_DIR

# Generar certificado autofirmado
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout $CERT_DIR/nginx.key \
    -out $CERT_DIR/nginx.crt \
    -subj "/C=ES/ST=Madrid/L=Madrid/O=Microservices/OU=IT/CN=$DOMAIN"

echo "Certificados generados en: $CERT_DIR"
echo "Certificado: $CERT_DIR/nginx.crt"
echo "Clave privada: $CERT_DIR/nginx.key"

# Mostrar información del certificado
echo ""
echo "Información del certificado:"
openssl x509 -in $CERT_DIR/nginx.crt -text -noout | grep -E "(Subject:|Issuer:|Not Before|Not After)" 