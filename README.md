
### Records Count
```sql
uuid_app_development=# select count(*) from uuid_v7_records;
  count
----------
 10500000
(1 row)

uuid_app_development=# select count(*) from uuid_v4_records;
  count
----------
 10500000
(1 row)
```

### SELECT * | V7 vs. V4
Consistent lower upper-end costs for UUIDv7 compared to UUIDv4, 4.93 vs. 7.68

```sql
uuid_app_development=# -- UUIDv4
EXPLAIN ANALYZE
SELECT * FROM uuid_v4_records
ORDER BY id
LIMIT 100;

-- UUIDv7
EXPLAIN ANALYZE
SELECT * FROM uuid_v7_records
ORDER BY id
LIMIT 100;
                                                                        QUERY PLAN
-----------------------------------------------------------------------------------------------------------------------------------------------------------
 Limit  (cost=0.43..7.68 rows=100 width=46) (actual time=0.029..0.245 rows=100 loops=1)
   ->  Index Scan using uuid_v4_records_pkey on uuid_v4_records  (cost=0.43..760595.86 rows=10500000 width=46) (actual time=0.027..0.231 rows=100 loops=1)
 Planning Time: 0.123 ms
 Execution Time: 0.277 ms
(4 rows)

                                                                        QUERY PLAN
-----------------------------------------------------------------------------------------------------------------------------------------------------------
 Limit  (cost=0.43..4.93 rows=100 width=46) (actual time=0.026..0.121 rows=100 loops=1)
   ->  Index Scan using uuid_v7_records_pkey on uuid_v7_records  (cost=0.43..471857.85 rows=10499961 width=46) (actual time=0.025..0.108 rows=100 loops=1)
 Planning Time: 0.079 ms
 Execution Time: 0.143 ms
(4 rows)
```


### Find Performance
```
bin/rails runner find_bm.rb
```