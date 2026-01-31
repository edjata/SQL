-- NOTE: Range Operators Section (BETWEEN)
-- Check if a value is within a range 
-- [lower:Boundary=100] <-- False |100-> TRUE <-500| False --> [Upper:Boundary=500]
-- <-False-|100(Inclusive)->True {BETWEEN} True<-500(Inclusive)|-False->


-- Retrieve all customers whose score falls in the range 
-- between 100 and 500

SELECT * 
FROM MyDatabase.dbo.customers
WHERE score BETWEEN 100 AND 500

-- Clear to understand between range
SELECT * 
FROM MyDatabase.dbo.customers
WHERE score >= 100
AND score <=500
