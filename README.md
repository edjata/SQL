# SQL
SQL Full Course with BARAA

SQL Queries
These queries focus on the following:
[|=====|]
Database ->
[|=====|]
                  [TABLE_NAME: customers] 
                                         [column_names: | id | first_name | country    | score |]
                                         [row 1 ----->      | 1 | Maria          | Germany | 350|]
                                         [row 2 ----->      | 2 | John           | USA         | 900|]
                                         [row 3 ----->      | 3 | Georg         | UK           | 750|]
                                         [row 4 ----->      | 4 | Martin        | Germany | 500|]
                                         [row 5 ----->      | 5 | Peter          | USA         | 0|]
[SELECT] - retrieves all data (*) <- all columns or enter name of individual columns to select
                 SELECT * 
                 FROM customers
OR
                 SELECT 
                       first_name, 
                       country
                 FROM customers

[FROM] - Table name: tells SQL where to find data
                 SELECT * 
                 FROM customers

[WHERE] - filter data based on a condition
                 SELECT * 
                 FROM customers
                 WHERE score > 500  || WHERE score != 0 || WHERE score < 500
OR
                 SELECT 
                       first_name, 
                       country
                 FROM customers
                 WHERE country = 'Germeny'

[ORDER BY] - sorts data. ASC is default value. can be ASC or DESC. can nest ex: country column ASC, score DESC
                 SELECT * 
                 FROM customers
                 ORDER BY score DESC
OR 
                 SELECT * 
                 FROM customers
                 ORDER BY 
                      country ASC,
                      score DESC

[GROUP BY] - Aggregated data. combines rows with same value. Aggregates a column by another column. 
                 SELECT 
                        country, -- <--(category)
                        SUM(score) AS total_sum -- <--(aggregation)
                 FROM customers
                 GROUP BY country

[HAVING] - filter data after aggregation. can be used only with GROUP BY. 
                 SELECT 
                        country, -- <--(category)
                        SUM(score) AS total_sum -- <--(aggregation)
                 FROM customers
                 GROUP BY country
                 HAVING SUM(score) > 800
OR
                 SELECT 
                        country, -- <--(category)
                        SUM(score) AS total_sum -- <--(aggregation)
                 FROM customers
                 WHERE  score > 400
                 GROUP BY country
                 HAVING SUM(score) > 800

[DISTINCT] - remove duplicates (repeated values) each value appears only once.
                 SELECT DISTINCT
                        country
                 FROM customers
[TOP] - limit your data. restrict the number of rows returned
                 SELECT TOP 3 * 
                 FROM customers
OR
                 SELECT TOP 3 * 
                 FROM customers
                 ORDER BY (score) DESC
