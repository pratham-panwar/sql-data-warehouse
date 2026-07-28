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

----------- DIMENSION PRODUCT VIEW --------------------------------
CREATE OR ALTER VIEW gold.dim_products AS
SELECT
	ROW_NUMBER() OVER(ORDER BY pn.prd_start_dt, pn.prd_key)	AS product_key,		-- Surrogate key
	pn.prd_id						AS product_id,
	pn.prd_key						AS product_number,
	pn.prd_nm						AS product_name,
	pn.cat_id						AS category_id,
	pc.cat							AS category,
	pc.subcat						AS subcategory,
	pc.maintenance,
	pn.prd_line						AS product_line,
	pn.prd_start_dt					AS start_date,
	pn.prd_cost						AS cost
FROM silver.crm_prd_info pn
LEFT JOIN silver.erp_px_cat_g1v2 pc
	ON pn.cat_id = pc.id
WHERE pn.prd_end_dt IS NULL;		-- Filter out historical data
GO

----------- FACT SALES VIEW -----------------------------------
CREATE OR ALTER VIEW gold.fact_sales AS
SELECT
	sd.sls_ord_num				AS order_number,
	pr.product_key,
	cu.customer_key,
	sd.sls_order_dt				AS order_date,
	sd.sls_ship_dt				AS shipping_date,
	sd.sls_due_dt				AS due_date,
	sd.sls_sales				AS sales_amount,
	sd.sls_quantity				AS quantity,
	sd.sls_price				AS price
FROM silver.crm_sales_details sd
LEFT JOIN gold.dim_products pr
	ON sd.sls_prd_key = pr.product_number
LEFT JOIN gold.dim_customers cu
	ON sd.sls_cust_id = cu.customer_id;
GO