INSERT INTO silver.crm_cust_info(
      cst_id,
      cst_key,
      cst_firstname,
      cst_lastname,
      cst_marital_status,
      cst_gndr,
      cst_create_date
)

SELECT 
cst_id,
cst_key,
TRIM(cst_firstname) as cst_firstname,
TRIM(cst_lastname) as cst_lastName,
CASE WHEN UPPER(cst_marital_status) = 'S' THEN  'Single'
    WHEN UPPER(cst_marital_status) = 'M' THEN  'Married'
    ELSE 'N/A'
 END cst_marital_status,
CASE WHEN UPPER(cst_gndr) = 'F' THEN   'FEMALE'
      WHEN UPPER(cst_gndr) = 'M' THEN   'MALE'
      ELSE 'N/A'
END cst_gndr,
cst_create_date

FROM (
SELECT *,
ROW_NUMBER() OVER(PARTITION BY cst_id ORDER BY cst_create_date DESC) AS  flag_last
FROM bronze.crm_cust_info )t
WHERE flag_last = 1
