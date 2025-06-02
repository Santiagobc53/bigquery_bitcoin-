
SELECT
  DATE(block_timestamp) AS fecha,
  SUM(size) AS total_bytes
FROM
  `bigquery-public-data.crypto_bitcoin.transactions`
GROUP BY
  fecha
ORDER BY
  fecha DESC
LIMIT 30
