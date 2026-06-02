-- Transacciones grandes de Bitcoin
-- Consulta: últimas 10 transacciones más grandes por tamaño en bytes
-- Propósito: análisis de tendencias de volumen en transacciones
SELECT
  block_timestamp,
  `hash`,
  size,
  input_count,
  output_count,
  output_value                           -- satoshis (1 BTC = 100,000,000 sat)
FROM
  `bigquery-public-data.crypto_bitcoin.transactions`
WHERE
  block_timestamp IS NOT NULL
  AND size > 1048576                     -- > 1 MiB (1024 * 1024 bytes)
ORDER BY
  size DESC
LIMIT 20
