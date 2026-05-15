# 🧠 Consulta BigQuery - Transacciones más grandes de Bitcoin

Este script SQL consulta las transacciones más grandes (por tamaño en bytes) en la red de Bitcoin, usando el dataset público de Google BigQuery.

## 📌 Detalles

- Fuente: `bigquery-public-data.crypto_bitcoin.transactions`
- Criterio: transacciones con tamaño > 1.000.000 bytes
- Orden: desde la más grande hacia abajo
- Límite: 10 resultados

## 🚀 Tecnología utilizada

- Google BigQuery
- SQL estándar
- Datos reales de la red Bitcoin

## 🎯 Objetivo

Practicar consultas SQL avanzadas en BigQuery, enfocadas en extracción, filtrado y ordenamiento de datos reales.

---

📁 Archivo incluido: `transacciones_grandes.sql`


### 📊 Consulta 2: Actividad diaria en la red Bitcoin

Este análisis muestra la actividad diaria de los últimos 30 días en la red Bitcoin. Para cada día se calcula el número de transacciones (`COUNT(*)`) y el total de bytes procesados (`SUM(size)`). Los resultados se agrupan por fecha (`DATE(block_timestamp)`) y se filtran con `WHERE` para activar el partition pruning de BigQuery y reducir el costo de la consulta.

🔍 Tabla usada: `bigquery-public-data.crypto_bitcoin.transactions`
