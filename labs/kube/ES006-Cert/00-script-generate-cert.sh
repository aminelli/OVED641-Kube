#!/bin/bash

echo "=== AVVIO CRAZIONE Certificati Self Signed ==="
echo ""

mkdir certificates && cd certificates

# 1. Genera chiave privata SENZA password (più semplice)
openssl genrsa -out tls.key 2048
cat tls.key 

# 2. Genera certificato (non chiede password)
openssl req -new -x509 -key tls.key -out tls.crt -days 365 -subj "/C=IT/ST=Milano/L=Milano/O=MyCompany/CN=api-service.default.svc.cluster.local"
cat tls.crt

# 3. Crea P12 - # In -passout pass la password che userai in Java (es: "changeit")
openssl pkcs12 -export -out tls.p12 -inkey tls.key -in tls.crt -name "tls-alias" -passout pass:changeit
cat tls.p12

echo ""
echo ""
echo ""
cat tls.key | base64 -w 0 && echo "" && echo ""
cat tls.crt | base64 -w 0 && echo "" && echo ""
cat tls.p12 | base64 -w 0 && echo "" && echo ""
# base64 keystore.p12 > keystore.p12.b64

cd ..

echo "=== FINE CRAZIONE Certificati Self Signed ==="
echo ""
