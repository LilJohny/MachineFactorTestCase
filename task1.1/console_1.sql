-- task 1.1 1.
WITH all_symbols AS (SELECT COUNT(DISTINCT symbol) as all_symbols
                     FROM bars_1),
     filtered_symbols AS (SELECT COUNT(DISTINCT symbol) as filtered_symbols
                          FROM (SELECT symbol,
                                       "date",
                                       adj_close,
                                       AVG(adj_close)
                                       OVER (PARTITION BY symbol ORDER BY "date" ROWS BETWEEN 39 PRECEDING AND CURRENT ROW) as avg_adj_close_40
                                FROM bars_1
                                WHERE "date" BETWEEN '2019-01-01' AND '2019-12-31'
                                  and adj_close is not null) sub
                          WHERE adj_close > avg_adj_close_40)
SELECT (filtered_symbols * 1.0 / all_symbols) * 100 as percentage
FROM all_symbols,
     filtered_symbols;


-- task 1.1 2.
SELECT AVG(adj_close * volume) as avg_dollar_volume
FROM bars_1
WHERE "date" BETWEEN '2019-02-01' AND '2019-02-28';

-- task 1.1 3.
WITH positive_volume AS (SELECT symbol,
                                "date",
                                CASE
                                    WHEN adj_close >= lag(adj_close) OVER (PARTITION BY symbol ORDER BY "date")
                                        THEN volume
                                    ELSE 0
                                    END as positive_volume
                         FROM bars_1
                         WHERE "date" BETWEEN '2015-01-01' AND '2015-12-31')
SELECT symbol, SUM(positive_volume) as total_positive_volume
FROM positive_volume
GROUP BY symbol
ORDER BY total_positive_volume;

-- task 1.1 4.
WITH daily_pct_change AS (SELECT symbol,
                                 "date",
                                 (adj_close - lag(adj_close) OVER (PARTITION BY symbol ORDER BY "date")) /
                                 lag(adj_close) OVER (PARTITION BY symbol ORDER BY "date") as pct_change
                          FROM bars_1)
SELECT symbol, AVG(ABS(pct_change)) as avg_abs_daily_pct_change
FROM daily_pct_change
GROUP BY symbol;





