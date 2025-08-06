### SELECT * ORDER BY ID QUERY EXPLAINS
1. v4: 1.233
1. v7: 0.692
1.  M: 0.787

```
uuid_app_development=# explain analyze select * from uuid_v4_records order by id limit 100;
                                                                        QUERY PLAN
-----------------------------------------------------------------------------------------------------------------------------------------------------------
 Limit  (cost=0.43..7.21 rows=100 width=46) (actual time=0.852..1.192 rows=100 loops=1)
   ->  Index Scan using uuid_v4_records_pkey on uuid_v4_records  (cost=0.43..711738.76 rows=10499961 width=46) (actual time=0.849..1.177 rows=100 loops=1)
 Planning Time: 0.596 ms
 Execution Time: 1.233 ms
(4 rows)

uuid_app_development=# explain analyze select * from uuid_v7_records order by id limit 100;
                                                                        QUERY PLAN
-----------------------------------------------------------------------------------------------------------------------------------------------------------
 Limit  (cost=0.43..4.41 rows=100 width=46) (actual time=0.620..0.669 rows=100 loops=1)
   ->  Index Scan using uuid_v7_records_pkey on uuid_v7_records  (cost=0.43..417357.85 rows=10499961 width=46) (actual time=0.618..0.660 rows=100 loops=1)
 Planning Time: 1.529 ms
 Execution Time: 0.692 ms
(4 rows)

uuid_app_development=# explain analyze select * from mixed_uuid_records order by id limit 100;
                                                                           QUERY PLAN
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
 Limit  (cost=0.43..7.55 rows=100 width=49) (actual time=0.046..0.765 rows=100 loops=1)
   ->  Index Scan using mixed_uuid_records_pkey on mixed_uuid_records  (cost=0.43..746973.76 rows=10499854 width=49) (actual time=0.044..0.755 rows=100 loops=1)
 Planning Time: 0.417 ms
 Execution Time: 0.787 ms
(4 rows)
```
