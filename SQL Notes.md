# SQL Notes

What are CTEs? 
- Common table expression
- Very similar to subquery
with <name of CTE> as (
    <query>
)
select *
from <name of CTE>
where ...;

Advantages of this over subquery
- more readable
- can be reused in the same query mutliple times

Note - performance for subquery and CTE should be the same

Window Functions
- Allows you to take aggregations or select records from a partition of the data and apply that to all rows
- Unike a group by statement, you aren't reducing the row count

And condition in join
- You can also filter one of the tables when joining using this syntax instead of a where clause
- If using a left join, using the and clause in the join condition will yield different results than the were condition after the join but in an inner join it should be the same
- Example
SELECT companies.permalink AS companies_permalink,
       companies.name AS companies_name,
       acquisitions.company_permalink AS acquisitions_permalink,
       acquisitions.acquired_at AS acquired_date
  FROM tutorial.crunchbase_companies companies
  LEFT JOIN tutorial.crunchbase_acquisitions acquisitions
    ON companies.permalink = acquisitions.company_permalink
   AND acquisitions.company_permalink != '/company/1000memories'
 ORDER BY 1

Joining on Multiple Keys
- In some cases may not add to the accuracy of the query but may increase the speed/performance of the query

Self Joining
- Sometimes it can be useful to join a table to itself. Let’s say you wanted to identify companies that received an investment from Great Britain following an investment from Japan.
SELECT DISTINCT japan_investments.company_name,
	   japan_investments.company_permalink
  FROM tutorial.crunchbase_investments_part1 japan_investments
  JOIN tutorial.crunchbase_investments_part1 gb_investments
    ON japan_investments.company_name = gb_investments.company_name
   AND gb_investments.investor_country_code = 'GBR'
   AND gb_investments.funded_at > japan_investments.funded_at
 WHERE japan_investments.investor_country_code = 'JPN'
 ORDER BY 1
 - Need to play with some examples to wrap my head around this a bit more

 Different rank functions for window functions
 - rank() - will just rank and will skip numbers for ties (e.g. 1,2,2,4)
 - dense_rank() - will rank and not skip numbers for ties (e.g. 1,2,2,3)
 - row_number() - will just count up even for ties (e.g. 1,2,3,4)

 Using min() in window function is same as using order by and then taking first value. Also same as ranking and getting first row

 Leaving the over() clause empty on a window function just takes an aggregation over the whole dataset
 e.g. max(order_count) OVER() AS max_order_count --> max order_count value for all rows will be the value for this column for all rows

 DDL syntax is different for different SQL dialects
 - for postgresql all column names are wrapped in double quotes, in mysql they aren't

 Information schema contains metadata for all tables in schema (e.g. column dtypes, table permissions, column permissions, etc.)