/*
========================================================
Quality Checks
========================================================
Script Purpose:
  This script performs various quality checks for data consistency, accuracy and standardisation across the Silver schema. 
  It includes checks for:
    - Null or duplicate primary keys.
    - Unwanted spaces in string fields.
    - Data standardisation and consistency.
    - Invalid date ranges and orders.
    - Data consistency between related fields.

Usage Notes:
    - Run these checks after data loading Silver layer.
    - Investigate and resolve any discrepancies found during these checks
========================================================
*/

-- ========================================================
-- Checking 'silver.crm_cust_info'
-- ========================================================
-- Check for NULLs or Duplicates in Primary Key
-- Expectation: No Result
SELECT  
cst_id,
COUNT(*)
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL;

-- Check for Unwanted Spaces
-- Expectation: No Result
SELECT cst_firstname
FROM silver.crm_cust_info
WHERE cst_firstname !=TRIM(cst_firstname)

SELECT cst_lastname
FROM silver.crm_cust_info
WHERE cst_lastname !=TRIM(cst_lastname)

-- Data Standardisation & Consistency
SELECT DISTINCT cst_gender
FROM silver.crm_cust_info

SELECT DISTINCT cst_marital_status
FROM silver.crm_cust_info

-- ========================================================
-- Checking 'silver.crm_prod_info'
-- ========================================================

-- Check for NULLs or Duplicates in Primary Key
-- Expectation: No Result
SELECT  
prd_id,
COUNT(*)
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL;

-- Check for Unwanted Spaces
-- Expectation: No Result
SELECT prd_nm
FROM silver.crm_prd_info
WHERE prd_nm !=TRIM(prd_nm)

-- Check for NULLS or Negative Numbers
-- Expectation: No Result


SELECT prd_cost
FROM silver.crm_prd_info
WHERE prd_cost IS NULL OR prd_cost < 0

-- Data Standardization & Consistency
SELECT DISTINCT prd_line
FROM silver.crm_prd_info

-- Check for Invalid Date Orders
-- Expectation: No Result
SELECT prd_id, prd_key, prd_nm,prd_start_dt, prd_end_dt
FROM silver.crm_prd_info
WHERE prd_start_dt > prd_end_dt

-- ========================================================
-- Checking 'silver.crm_sales_details'
-- ========================================================

-- Check for Invalid Dates
-- Expectation: No Result

SELECT
NULLIF(sls_order_dt,0) as sls_order_dt
FROM bronze.crm_sales_details
WHERE sls_order_dt <=0
OR LEN(sls_order_dt) !=8
OR sls_order_dt >20500101
OR sls_order_dt <19000101

SELECT
NULLIF(sls_ship_dt,0) as sls_ship_dt
FROM bronze.crm_sales_details
WHERE sls_ship_dt <=0
OR LEN(sls_ship_dt) !=8
OR sls_ship_dt >20500101
OR sls_ship_dt <19000101

SELECT
NULLIF(sls_due_dt,0) as sls_due_dt
FROM bronze.crm_sales_details
WHERE sls_due_dt <=0
OR LEN(sls_due_dt) !=8
OR sls_due_dt >20500101
OR sls_due_dt <19000101

SELECT
*
FROM silver.crm_sales_details
WHERE sls_order_dt > sls_ship_dt OR sls_order_dt > sls_due_dt

-- Check Data Consistency: Between Sales, Quantity and Price
-- >> Sales = Quantity * Price
-- >> Values must not be NULL, zero or negative

SELECT DISTINCT
sls_sales,
sls_quantity,
sls_price
FROM silver.crm_sales_details
WHERE sls_sales <=0
OR sls_quantity <=0
OR sls_price <=0
OR sls_sales != sls_quantity * sls_price
OR sls_sales IS NULL
OR sls_price IS NULL
OR sls_quantity IS NULL
ORDER BY sls_sales, sls_quantity, sls_price

-- ========================================================
-- Checking 'silver.erp_cust_az12'
-- ========================================================

-- Check for consistency in primary key values across related tables

SELECT 
CASE WHEN cid LIKE 'NAS%'
THEN SUBSTRING(cid, 4, LEN(cid))
ELSE cid
END AS cid
FROM silver.erp_cust_az12
WHERE CASE WHEN cid LIKE 'NAS%'
THEN SUBSTRING(cid, 4, LEN(cid))
ELSE cid
END 
NOT IN
(SELECT DISTINCT cst_key FROM Silver.crm_cust_info)

-- Identify Out-of-Range Dates

SELECT DISTINCT
bdate
FROM silver.erp_cust_az12
WHERE bdate < '1924-01-01' OR bdate > GETDATE()

-- Data Standardisation & Consistency

SELECT DISTINCT gen,
CASE WHEN UPPER(TRIM(gen)) IN ('M', 'MALE') THEN 'Male'
WHEN UPPER(TRIM(gen)) IN ('F', 'FEMALE') THEN 'Female'
ELSE 'n/a'
END AS gen
FROM silver.erp_cust_az12

-- ========================================================
-- Checking 'silver.erp_loc_a101'
-- ========================================================

-- Check for consistency in primary key values across related tables

SELECT
cid as cid_old,
REPLACE(cid, '-', '') as cid,
cntry
FROM silver.erp_loc_a101
WHERE REPLACE(cid, '-', '') NOT IN (SELECT DISTINCT cst_key FROM Silver.crm_cust_info)

-- Data Standardisation & Consistency

SELECT DISTINCT
cntry AS old_cntry,
CASE WHEN TRIM(cntry) = 'DE' THEN 'Germany'
WHEN TRIM(cntry) IN ('US', 'USA') THEN 'United States'
WHEN TRIM(cntry) = '' OR cntry IS NULL THEN 'n/a' 
ELSE TRIM(cntry)
END AS cntry
FROM silver.erp_loc_a101

-- ========================================================
-- Checking 'silver.erp_px_cat_glv2'
-- ========================================================

-- Check for Unwanted Spaces
-- Expectation: No Result

SELECT 
* 
FROM silver.erp_px_cat_g1v2
WHERE cat != TRIM(cat) 
OR subcat != TRIM(subcat) 
OR maintenance != TRIM(maintenance)

-- Data Standardisation & Consistency

SELECT DISTINCT cat FROM silver.erp_px_cat_g1v2

SELECT DISTINCT subcat FROM silver.erp_px_cat_g1v2

SELECT DISTINCT maintenance FROM silver.erp_px_cat_g1v2
