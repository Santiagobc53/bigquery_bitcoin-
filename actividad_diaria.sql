SELECT
  DATE(block_timestamp)      AS fecha,
  COUNT(*)                   AS num_transacciones,
  SUM(size)                  AS total_bytes
FROM
  `bigquery-public-data.crypto_bitcoin.transactions`
WHERE
  block_timestamp IS NOT NULL
  AND block_timestamp >= TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 30 DAY)
GROUP BY
  DATE(block_timestamp)
ORDER BY
  fecha DESC
-- No LIMIT needed: la ventana de 30 días retorna ~30 filas
