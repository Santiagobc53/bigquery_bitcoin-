# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

A collection of BigQuery SQL queries analyzing Bitcoin transaction data from the Google public dataset `bigquery-public-data.crypto_bitcoin.transactions`. The project is written in Spanish (aliases, comments, commit messages).

## Running Queries

Queries are run directly in the [BigQuery console](https://console.cloud.google.com/bigquery) or via the `bq` CLI:

```bash
bq query --use_legacy_sql=false < actividad_diaria.sql
bq query --use_legacy_sql=false < transacciones_grandes.sql
```

Before running, check the estimated bytes scanned using the BigQuery console's dry-run or:

```bash
bq query --use_legacy_sql=false --dry_run < actividad_diaria.sql
```

## SQL Conventions

- **Language**: Standard SQL (not Legacy SQL)
- **Naming**: Spanish aliases (`fecha`, `num_transacciones`, `total_bytes`)
- **Formatting**: 2-space indent; columns left-aligned; inline comments after `--`
- **Reserved words**: Backtick-escape BigQuery reserved words used as column names (e.g., `` `hash` ``)
- **Size constants**: Use binary units — `1048576` for 1 MiB, not `1000000` or `1000 * 1000`
- **Positional references**: Avoid `GROUP BY 1` / `ORDER BY 1`; use explicit column names or expressions
- **NULL guards**: Always add `column IS NOT NULL` before range filters on nullable timestamp columns

## Cost Optimization (BigQuery-specific)

- Filter on `block_timestamp` in every query to enable **partition pruning** — this is the primary cost control lever for this dataset
- Prefer time-window filters (`INTERVAL 30 DAY`) over `LIMIT`-only approaches for large tables
- Use `--dry_run` to verify byte estimates before executing

## Dataset Schema (key columns)

Table: `bigquery-public-data.crypto_bitcoin.transactions`

| Column | Type | Notes |
|---|---|---|
| `block_timestamp` | TIMESTAMP | Partition key — always filter on this |
| `` `hash` `` | STRING | Reserved word; must be backtick-escaped |
| `size` | INT64 | Transaction size in bytes |
| `input_count` | INT64 | Number of inputs |
| `output_count` | INT64 | Number of outputs |
| `output_value` | INT64 | Total output value in satoshis (1 BTC = 100,000,000 sat) |
