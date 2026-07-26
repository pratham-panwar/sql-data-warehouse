------- CLEAN AND LOAD erp_cust_az12 FROM BRONZE TO SILVER ------------------
TRUNCATE TABLE silver.erp_cust_az12;
GO

INSERT INTO silver.erp_cust_az12(
	cid,
	bdate,
	gen
)
SELECT
	CASE
		WHEN cid LIKE 'NAS%' THEN SUBSTRING(cid,4,LEN(cid))
		ELSE cid
	END cid,
	CASE
		WHEN bdate > GETDATE() THEN NULL
		ELSE bdate
	END bdate,		-- Set future birth dates to NULL
	CASE
		WHEN UPPER(TRIM(gen)) IN ('M', 'MALE') THEN 'Male'
		WHEN UPPER(TRIM(gen)) IN ('F', 'FEMALE') THEN 'Female'
		ELSE 'n/a'
	END gen		-- Normalise gender values and handle unknown cases
FROM bronze.erp_cust_az12