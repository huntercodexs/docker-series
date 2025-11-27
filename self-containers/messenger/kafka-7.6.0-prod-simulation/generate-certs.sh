#!/usr/bin/env bash
set -e

KEYTOOL_PATH=/home/jereelton/.jdks/jdk-21/bin
BASE_DIR="$(pwd)"
CONF_DIR="${BASE_DIR}/security"
SECRETS_DIR="${CONF_DIR}/secrets"

mkdir -p "${SECRETS_DIR}"

echo "🧨 Usando diretório base: ${BASE_DIR}"
echo "🧨 Usando diretório de conf: ${CONF_DIR}"
echo "🧨 Usando diretório de secrets: ${SECRETS_DIR}"

CA_KEY="${SECRETS_DIR}/ca.key.pem"
CA_CERT="${SECRETS_DIR}/ca.cert.pem"
BROKER_KEY="${SECRETS_DIR}/broker.key.pem"
BROKER_CSR="${SECRETS_DIR}/broker.csr.pem"
BROKER_CERT="${SECRETS_DIR}/broker.cert.pem"
BROKER_PKCS12="${SECRETS_DIR}/broker.p12"
BROKER_KEYSTORE="${SECRETS_DIR}/broker.keystore.jks"
BROKER_TRUSTSTORE="${SECRETS_DIR}/broker.truststore.jks"
CLIENT_TRUSTSTORE="${SECRETS_DIR}/client.truststore.jks"

PASSWORD="changeit"
BROKER_CN="kafka-7.6.0-prod-simulation"

echo "🧨 1) Gerando CA..."
openssl genrsa -out "${CA_KEY}" 2048
openssl req -x509 -new -nodes -key "${CA_KEY}" -sha256 -days 3650 \
  -subj "/CN=LocalKafkaCA" -out "${CA_CERT}"

echo "🧨 2) Gerando chave do broker e CSR..."
openssl genrsa -out "${BROKER_KEY}" 2048
openssl req -new -key "${BROKER_KEY}" \
  -subj "/CN=${BROKER_CN}" -out "${BROKER_CSR}"

echo "🧨 3) Assinando CSR com CA..."
openssl x509 -req -in "${BROKER_CSR}" -CA "${CA_CERT}" -CAkey "${CA_KEY}" \
  -CAcreateserial -out "${BROKER_CERT}" -days 3650 -sha256

echo "🧨 4) Criando PKCS12 do broker..."
openssl pkcs12 -export \
  -in "${BROKER_CERT}" -inkey "${BROKER_KEY}" -certfile "${CA_CERT}" \
  -name "${BROKER_CN}" -passout pass:${PASSWORD} -out "${BROKER_PKCS12}"

echo "🧨 5) Criando keystore do broker (JKS)..."
${KEYTOOL_PATH}/keytool -importkeystore \
  -deststorepass ${PASSWORD} -destkeypass ${PASSWORD} \
  -destkeystore "${BROKER_KEYSTORE}" \
  -srckeystore "${BROKER_PKCS12}" -srcstoretype PKCS12 -srcstorepass ${PASSWORD} \
  -alias "${BROKER_CN}"

echo "🧨 6) Criando truststore (broker)..."
${KEYTOOL_PATH}/keytool -import -trustcacerts -file "${CA_CERT}" -alias local-ca \
  -keystore "${BROKER_TRUSTSTORE}" -storepass ${PASSWORD} -noprompt

echo "🧨 7) Criando truststore (client)..."
cp "${BROKER_TRUSTSTORE}" "${CLIENT_TRUSTSTORE}"

echo "🧨 8) Copiando arquivos JAAS..."
cp "${CONF_DIR}/server_jaas.conf" "${SECRETS_DIR}/server_jaas.conf"
cp "${CONF_DIR}/client_jaas.conf" "${SECRETS_DIR}/client_jaas.conf"
cp "${CONF_DIR}/zookeeper_jaas.conf" "${SECRETS_DIR}/zookeeper_jaas.conf"

echo
echo "===================================================="
echo "✅ Certificados e JAAS gerados com sucesso!"
echo "Pasta final: ${SECRETS_DIR}"
echo "Conteúdo:"
ls -l "${SECRETS_DIR}"
echo "===================================================="
