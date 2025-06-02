SELECT
  block_timestamp,
  `hash`,
  size
FROM
  `bigquery-public-data.crypto_bitcoin.transactions`
WHERE
  size > 1000000
ORDER BY
  size DESC
LIMIT 10
