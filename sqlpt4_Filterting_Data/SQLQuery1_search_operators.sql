-- NOTE: Search Operators Section (LIKE)
-- LIKE: search for a pattern in text

-- NOTE: LIKE (Pattern search)-->( % (Anything: 0, 1, Many)) or( _ (Exact 1)) 
--		% anything -->  0, 1, Many (character or number)
--		% with _ (Exact 1 thing) (character or number)

-- Pattern Match (YES/NO)

-- FOR BEGINNING:[ (M/1) (%/any)]
-- [ (M/1) (%/any)] Maria		-> (M/1) (aria/any) -	YES
-- [ (M/1) (%/any)] Ma			-> (M/1) (a/any) -		YES
-- [ (M/1) (%/any)] M			-> (M/1) (0/any) -		YES
-- [ (M/1) (%/any)] Emma		-> (E/1) (mma/any) -	NO

-- FOR ENDING:[ (%/any) (in/)]
-- [ (%/any) (in/)] Martin		-> (%/any) (in/) -		YES
-- [ (%/any) (in/)] Vin			-> (%/any) (in/) -		YES
-- [ (%/any) (in/)] in			-> (%/any) (in/) -		YES
-- [ (%/any) (in/)] Jasmine		-> (%/any) (ne/) -		NO

-- FOR ANYWHERE: [ (%r%) ]
-- [ (%r%) ] Maria			-> (%r%) Ma[r]ia -	YES
-- [ (%r%) ] Peter			-> (%r%) Pete[r] -	YES
-- [ (%r%) ] Rayn			-> (%r%) [R]ayn -	YES
-- [ (%r%) ] R				-> (%r%) [R] -		YES
-- [ (%r%) ] Alice			-> (%r%) Alice -	NO

-- FOR 3rd position: [ (__b%/any) ]
-- [ (__b%/any) ] Albert	-> (__b%/any) _A_l[b]%/ert -	YES
-- [ (__b%/any) ] Rob		-> (__b%/any) _R_o[b]%/ -		YES
-- [ (__b%/any) ] Abel		-> (__b%/any) ABEL -			NO
-- [ (__b%/any) ] An		-> (__b%/any) An -				NO

-- Find all customers whose first name STARTS with 'M'
SELECT *
FROM MyDatabase.dbo.customers
WHERE first_name LIKE 'M%'

-- Find all customers whose first name ENDS with 'n'
SELECT *
FROM MyDatabase.dbo.customers
WHERE first_name LIKE '%n'

-- Find all customers whose first name CONTAINS 'r'
SELECT *
FROM MyDatabase.dbo.customers
WHERE first_name LIKE '%r%'

-- Find all customers whose first name has 'r' in the 3rd position
SELECT *
FROM MyDatabase.dbo.customers
WHERE first_name LIKE '__r%'

-- Find all customers whose first name has 'a' in the 2rd position
SELECT *
FROM MyDatabase.dbo.customers
WHERE first_name LIKE '_a%'

-- Find all customers whose first name not 'a' in the 2rd position
SELECT *
FROM MyDatabase.dbo.customers
WHERE first_name NOT LIKE '_a%'



