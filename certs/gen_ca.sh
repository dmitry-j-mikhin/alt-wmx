set -ex

openssl genpkey -algorithm RSA -out ca.key
openssl req -new -x509 -days 365 -key ca.key -out ca.cer \
  -subj "/C=RU/ST=Russia/L=Moscow/O=Example/OU=Example CA/CN=Example CA Root"
