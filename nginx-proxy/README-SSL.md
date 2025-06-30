# Configuración SSL para Nginx Proxy

Este directorio contiene la configuración de nginx con certificados SSL autofirmados para tu aplicación de microservicios.

## Estructura

```
nginx-proxy/
├── Dockerfile          # Dockerfile personalizado con certificados SSL
├── config/
│   └── nginx.conf      # Configuración de nginx con soporte HTTPS
├── generate-certs.sh   # Script para generar certificados personalizados
└── README-SSL.md       # Esta documentación
```

## Características

- ✅ Certificados SSL autofirmados generados automáticamente
- ✅ Redirección automática de HTTP a HTTPS
- ✅ Configuración segura de SSL/TLS
- ✅ Soporte para HTTP/2
- ✅ Headers de seguridad configurados

## Uso

### 1. Construir y ejecutar con Docker Compose

```bash
# Desde el directorio raíz del proyecto
docker-compose up --build
```

### 2. Acceder a la aplicación

- **HTTP**: http://localhost (redirige automáticamente a HTTPS)
- **HTTPS**: https://localhost
- **Admin**: https://localhost/admin/
- **API Users**: https://localhost/api/users/
- **API Tasks**: https://localhost/api/tasks/

### 3. Aceptar el certificado autofirmado

Al acceder por primera vez a https://localhost, tu navegador mostrará una advertencia de seguridad porque el certificado es autofirmado. Para continuar:

1. Haz clic en "Avanzado" o "Advanced"
2. Haz clic en "Continuar a localhost (no seguro)" o "Proceed to localhost (unsafe)"

## Generar certificados personalizados

Si necesitas generar certificados con un dominio específico:

```bash
# Generar para un dominio específico
./generate-certs.sh mi-dominio.com

# Generar para localhost (por defecto)
./generate-certs.sh
```

## Configuración SSL

La configuración SSL incluye:

- **Protocolos**: TLSv1.2 y TLSv1.3
- **Cifrados**: ECDHE-RSA-AES128-GCM-SHA256, ECDHE-RSA-AES256-GCM-SHA384
- **Validez**: 365 días
- **Tamaño de clave**: 2048 bits

## Puertos

- **80**: HTTP (redirige a HTTPS)
- **443**: HTTPS

## Notas importantes

⚠️ **Advertencia**: Los certificados autofirmados son útiles para desarrollo y pruebas, pero NO deben usarse en producción. Para producción, usa certificados de una autoridad certificadora confiable (Let's Encrypt, etc.).

## Troubleshooting

### Error de certificado en el navegador
Es normal ver una advertencia de seguridad con certificados autofirmados. Simplemente acepta la excepción.

### Error de conexión
Verifica que los puertos 80 y 443 estén disponibles y no bloqueados por el firewall.

### Certificado expirado
Los certificados se regeneran automáticamente cada vez que construyes la imagen. Si necesitas renovar manualmente, reconstruye la imagen:

```bash
docker-compose build nginx-proxy
docker-compose up nginx-proxy
``` 