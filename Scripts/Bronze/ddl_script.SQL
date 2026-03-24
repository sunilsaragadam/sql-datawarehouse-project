---------------------------------------------
-  DDL Script:- created for bronze layer    -
-                                           -
--------------------------------------------- 
  
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
     DECLARE @start_time DATETIME, @end_time DATETIME,@start_batchtime DATETIME,@end_batchtime DATETIME
   BEGIN TRY

     SET @start_batchtime = GETDATE()
        PRINT '===========================';
        PRINT  'Loading bronze table';
        PRINT '===========================';

        PRINT '----------------------------';
        PRINT 'LOADING CRM TABLE';
        PRINT '----------------------------';

        SET @start_time = GETDATE()
        PRINT '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>';
        PRINT 'Truncating table;bronze.crm_cust_info';
        TRUNCATE TABLE bronze.crm_cust_info;
        PRINT '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>';
        PRINT 'Inserting data table:bronze.crm_cust_info';
        BULK INSERT bronze.crm_cust_info
        FROM 'C:\Data\source_crm\cust_info.csv'
        WITH(
            FIRSTROW = 2,
            FIELDTERMINATOR=',',
            TABLOCK
        );
        SET @end_time = GETDATE()
        PRINT ('>>Load duration  ='+ CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' NSeconds');


        SET @start_time = GETDATE()
        PRINT '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>';
        PRINT 'Truncating table;bronze.crm_prd_info';
        TRUNCATE TABLE bronze.crm_prd_info;
        PRINT '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>';
        PRINT 'Inserting data table:bronze.crm_prd_info';
        BULK INSERT bronze.crm_prd_info
        FROM 'C:\Data\source_crm\prd_info.csv'
        WITH(
            FIRSTROW = 2,
            FIELDTERMINATOR=',',
            TABLOCK
        );
        SET @end_time = GETDATE()
        PRINT '>>Load duration  ='+ CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' Seconds';


        SET @start_time = GETDATE()
        PRINT '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>';
        PRINT 'Truncating table;bronze.crm_sales_details';
        TRUNCATE TABLE bronze.crm_sales_details;
        PRINT '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>';
        PRINT 'Inserting data table:bronze.crm_sales_details';
        BULK INSERT bronze.crm_sales_details
        FROM 'C:\Data\source_crm\sales_details.csv'
        WITH(
            FIRSTROW = 2,
            FIELDTERMINATOR=',',
            TABLOCK
        );
        SET @end_time = GETDATE()
        PRINT '>>Load duration  ='+ CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' Seconds';


        PRINT '----------------------------';
        PRINT 'LOADING CRM TABLE';
        PRINT '----------------------------';

        SET @start_time = GETDATE()
        PRINT '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>';
        PRINT 'Truncating table;bronze.erp_cust_az12';
        TRUNCATE TABLE bronze.erp_cust_az12;
        PRINT '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>';
        PRINT 'Inserting data table:bronze.erp_cust_az12';
        BULK INSERT bronze.erp_cust_az12 
        FROM 'C:\Data\source_erp\cust_az12.csv'
        WITH(
            FIRSTROW = 2,
            FIELDTERMINATOR=',',
            TABLOCK
        );
        SET @end_time = GETDATE()
        PRINT '>>Load duration  ='+ CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' Seconds';


        SET @start_time = GETDATE()
        PRINT '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>';
        PRINT 'Truncating table;bronze.erp_loc_a101';
        TRUNCATE TABLE bronze.erp_loc_a101;
        PRINT '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>';
        PRINT 'Inserting data table:bronze.erp_loc_a101';
        BULK INSERT bronze.erp_loc_a101
        FROM 'C:\Data\source_erp\loc_a101.csv'
        WITH(
            FIRSTROW = 2,
            FIELDTERMINATOR=',',
            TABLOCK
        );
        SET @end_time = GETDATE()
        PRINT '>>Load duration  ='+ CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' Seconds';


        SET @start_time = GETDATE()
        PRINT '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>';
        PRINT 'Truncating table;bronze.erp_px_cat_g1v2';
        TRUNCATE TABLE bronze.erp_px_cat_g1v2;
        PRINT '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>';
        PRINT 'Inserting data table:bronze.erp_px_cat_g1v2';
        BULK INSERT bronze.erp_px_cat_g1v2
        FROM 'C:\Data\source_erp\px_cat_g1v2.csv'
        WITH(
            FIRSTROW = 2,
            FIELDTERMINATOR=',',
            TABLOCK
        );
        SET @end_time = GETDATE()
        PRINT '>>Load duration  ='+ CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' Seconds';
     SET @end_batchtime = GETDATE()
     PRINT '>>Total load duration: ' + CAST( DATEDIFF(second,@start_batchtime,@end_batchtime) AS NVARCHAR  ) +' Seconds'
   END TRY
   BEGIN CATCH
   PRINT 'NO ERROR FOUND'
   END CATCH
END;
