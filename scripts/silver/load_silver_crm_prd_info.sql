----------Clean and load crm_prd_info from bronze to silver--------------------

TRUNCATE TABLE silver.crm_prd_info;
GO

INSERT INTO silver.crm_prd_info(
	prd_id,
	cat_id,
	prd_key,
	prd_nm,
	prd_cost,
	prd_line,
	prd_start_dt,
	prd_end_dt
)

SELECT 
	prd_id,
	REPLACE(SUBSTRING(prd_key,1,5),'-','_') AS cat_id, -- Extract category id
	SUBSTRING(prd_key,7,LEN(prd_key)) AS prd_key,	   -- Extract product key
	prd_nm,
	ISNULL(prd_cost,0) AS prd_cost, -- Replacing Null values of product cost with 0
	CASE UPPER(TRIM(prd_line))
		WHEN 'M' THEN 'Mountain'
		WHEN 'R' THEN 'Road'
		WHEN 'S' THEN 'Other Sales'
		WHEN 'T' THEN 'Touring'
		ELSE 'n/a'
	END prd_line,  -- Mapping product line codes to descriptive value
	prd_start_dt,
	DATEADD(
		DAY,-1,
		LEAD(prd_start_dt) OVER ( PARTITION BY prd_nm ORDER BY prd_start_dt )
		) AS prd_end_dt  -- Calculate the end date as 1 day before the next start date
FROM bronze.crm_prd_info

--------------------------------------------------------------------------------