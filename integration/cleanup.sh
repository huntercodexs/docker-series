#!/usr/bin/env bash
set -e

BASE_DIR="$(pwd)"
CONF_DIR="${BASE_DIR}/messenger/kafka-7.6.0-SASL_SSL/security"
SECRETS_DIR="${CONF_DIR}/secrets"

echo "========================================================="
echo " 🧹 LIMPANDO CERTIFICADOS E ARQUIVOS GERADOS"
echo "========================================================="
echo "Base dir: ${BASE_DIR}"
echo "Conf dir: ${CONF_DIR}"
echo "Secrets dir: ${SECRETS_DIR}"
echo

if [ ! -d "${SECRETS_DIR}" ]; then
  echo "⚠️ Diretório ${SECRETS_DIR} não existe — nada para limpar."
  exit 0
fi

echo "🗑️  Removendo arquivos de CA..."
rm -f \
  "${SECRETS_DIR}/ca.key.pem" \
  "${SECRETS_DIR}/ca.cert.pem" \
  "${SECRETS_DIR}/ca.cert.srl" \
  2>/dev/null || true

echo "🗑️  Removendo arquivos do broker..."
rm -f \
  "${SECRETS_DIR}/broker.key.pem" \
  "${SECRETS_DIR}/broker.csr.pem" \
  "${SECRETS_DIR}/broker.cert.pem" \
  "${SECRETS_DIR}/broker.p12" \
  "${SECRETS_DIR}/broker.keystore.jks" \
  "${SECRETS_DIR}/broker.truststore.jks" \
  2>/dev/null || true

echo "🗑️  Removendo truststore do client..."
rm -f \
  "${SECRETS_DIR}/client.truststore.jks" \
  2>/dev/null || true

echo "🗑️  Removendo JAAS copiados..."
rm -f \
  "${SECRETS_DIR}/server_jaas.conf" \
  "${SECRETS_DIR}/client_jaas.conf" \
  "${SECRETS_DIR}/zookeeper_jaas.conf" \
  2>/dev/null || true

echo
echo "🗂️  Limpando arquivos temporários (se existirem)..."
rm -f "${SECRETS_DIR}"/*.tmp 2>/dev/null || true
rm -f "${SECRETS_DIR}"/*.bak 2>/dev/null || true

echo
echo "🧨 Removendo diretório secrets (se estiver vazio)..."
rmdir "${SECRETS_DIR}" 2>/dev/null || true

echo
echo "🧨 Removendo containers docker ..."
docker-compose down --volumes || true

echo
echo "========================================================="
echo " ✅ LIMPEZA CONCLUÍDA COM SUCESSO"
echo " Agora você pode executar novamente o generate-certs.sh"
echo "========================================================="
