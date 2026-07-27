------ CUSTOMER OBJECT (DIMENSION) --------------------------------------
CREATE OR ALTER VIEW gold.dim_customers AS
SELECT
	ROW_NUMBER() OVER(ORDER BY ca.cst_id)	AS customer_key, -- Surrogate key
	ca.cst_id								AS customer_id,
	ca.cst_key								AS customer_number,
	ca.cst_firstname						AS first_name,
	ca.cst_lastname							AS last_name,
	la.cntry AS country,
	ca.cst_marital_status					AS marital_status,
	CASE 
		WHEN ca.cst_gndr != 'n/a' THEN ca.cst_gndr	-- CRM is the primary source for gender
		ELSE ISNULL(ci.gen, 'n/a')						-- Fallback to ERP data
	END										AS gender,
	ci.bdate								AS birthdate,
	ca.cst_create_date						AS create_date
FROM silver.crm_cust_info ca
LEFT JOIN silver.erp_cust_az12 ci
	ON ca.cst_key = ci.cid
LEFT JOIN silver.erp_loc_a101 la
	ON ca.cst_key = la.cid;
GO