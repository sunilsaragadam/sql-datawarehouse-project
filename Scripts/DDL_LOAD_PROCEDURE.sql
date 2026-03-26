CREATE OR ALTER PROCEDURE Silver.load_silver AS 
BEGIN

 PRINT 'Truncating table:Silver.crm_cust_info';
        TRUNCATE TABLE Silver.erp_cust_az12;
 PRINT '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>';

INSERT INTO Silver.erp_cust_az12 (cid,bdate,gen)
SELECT
CASE WHEN cid LIKE 'NAS%' THEN SUBSTRING(cid,4,LEN(CID))
ELSE 'cid'
end cid,
CASE WHEN bdate> GETDATE() THEN NULL 
ELSE bdate
END bdate,
CASE 
WHEN UPPER(TRIM(gen)) IN ( 'FEMALE','F') THEN 'Female'
WHEN UPPER(TRIM(gen)) IN ( 'MALE','M') THEN 'Male'
ELSE 'N/A'
END AS gen
FROM bronze.erp_cust_az12

PRINT 'Truncating table:Silver.erp_loc_a101';
        TRUNCATE TABLE Silver.erp_loc_a101;
PRINT '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>';

INSERT INTO Silver.erp_loc_a101(cid,cntry)
SELECT  
      REPLACE (cid,'-','') AS cid,
            CASE WHEN TRIM(cntry) = 'DE' THEN 'Germany'
                 WHEN TRIM(cntry) IN ('US', 'USA') THEN 'United States'
                 WHEN TRIM(cntry) = '' OR cntry IS NULL THEN 'n/a'
                 ELSE TRIM(cntry)
            END AS cntry
  FROM bronze.erp_loc_a101

PRINT 'Truncating table:silver.erp_px_cat_g1v2';
        TRUNCATE TABLE silver.erp_px_cat_g1v2;
PRINT '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>';

  INSERT INTO silver.erp_px_cat_g1v2(id,cat,subcat,maintenance)
SELECT id,
      cat,
      subcat,
      maintenance
  FROM bronze.erp_px_cat_g1v2

END
