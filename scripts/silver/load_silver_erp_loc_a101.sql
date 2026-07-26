-------- CLEAN AND LOAD erp_loc_a101 FROM BRONZE TO SILVER ---------------------
TRUNCATE TABLE silver.erp_loc_a101;
GO

INSERT INTO silver.erp_loc_a101(
	cid,
	cntry
)
SELECT
	REPLACE(cid, '-', '') AS cid,
	CASE 
		WHEN TRIM(cntry) = 'DE' THEN 'Germany'
		WHEN TRIM(cntry) IN ('US', 'USA')THEN 'United States'
		WHEN TRIM(cntry) = '' OR cntry IS NULL THEN 'n/a'
		ELSE TRIM(cntry)
	END cntry		-- Normalize and handle missing or blank country code
FROM bronze.erp_loc_a101