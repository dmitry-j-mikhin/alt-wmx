set -ex

openssl genpkey -algorithm RSA -out localhost.key
openssl req -new  -key localhost.key -out localhost.csr -subj "/C=RU/L=Moscow/O=My site with TLS/CN=localhost"
openssl x509 -req -in localhost.csr -CA ca.cer -CAkey ca.key -CAcreateserial -out localhost.cer -days 3650
