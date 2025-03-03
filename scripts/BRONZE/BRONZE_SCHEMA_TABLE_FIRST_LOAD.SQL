/*

===============================================================================
Creating File format and Loading data using bulk load into bronze schema Tables
===============================================================================

Script Purpose:

    This script creates CSV file format  and load tables in the 'bronze' schema using bulk load feature 
    
===============================================================================

*/

--CSV FILE FORMAT CREATION

CREATE OR REPLACE FILE FORMAT CSV_FILE_FORMAT
TYPE=CSV
SKIP_HEADER=1;

-------------------------------------------------------------------------------------------------------------------

--CRM DATA LOADING

--LOADING DATA INTO CRM_CUST_INFO

COPY INTO DATA_WAREHOUSE.BRONZE.CRM_CUST_INFO
FROM
(
SELECT $1,$2,$3,$4,$5,$6,$7 
FROM @data_warehouse_modern/CRM/cust_info.csv
)
file_format='CSV_FILE_FORMAT';--18494 ROWS INSERTED


SELECT COUNT(1) FROM DATA_WAREHOUSE.BRONZE.CRM_CUST_INFO;--18494


--LOADING DATA INTO CRM_PRD_INFO

COPY INTO DATA_WAREHOUSE.BRONZE.CRM_PRD_INFO
FROM
(
SELECT $1,$2,$3,$4,$5,$6,$7 
FROM @data_warehouse_modern/CRM/prd_info.csv
)
file_format='CSV_FILE_FORMAT';--397 ROWS INSERTED

SELECT COUNT(1) FROM DATA_WAREHOUSE.BRONZE.CRM_PRD_INFO;--397


--LOADING DATA INTO CRM_SALES_DETAILS

COPY INTO DATA_WAREHOUSE.BRONZE.CRM_SALES_DETAILS
FROM
(
SELECT $1,$2,$3,$4,$5,$6,$7,$8,$9
FROM @data_warehouse_modern/CRM/sales_details.csv
)
file_format='CSV_FILE_FORMAT';--60398 ROWS INSERTED

SELECT COUNT(1) FROM DATA_WAREHOUSE.BRONZE.CRM_SALES_DETAILS;--60398

-------------------------------------------------------------------------------------------------------------------


--ERP DATA LOADING

--LOADING DATA INTO ERP_CUST_AZ12

COPY INTO DATA_WAREHOUSE.BRONZE.ERP_CUST_AZ12
FROM
(
SELECT $1,$2,$3
FROM @data_warehouse_modern/ERP/CUST_AZ12.csv
)
file_format='CSV_FILE_FORMAT';--18484 ROWS LOADED


SELECT COUNT(1) FROM DATA_WAREHOUSE.BRONZE.ERP_CUST_AZ12;--18484


--LOADING DATA INTO ERP_LOC_A101

COPY INTO DATA_WAREHOUSE.BRONZE.ERP_LOC_A101
FROM
(
SELECT $1,$2
FROM @data_warehouse_modern/ERP/LOC_A101.csv
)
file_format='CSV_FILE_FORMAT';--18484 ROWS LOADED

SELECT COUNT(1) FROM DATA_WAREHOUSE.BRONZE.ERP_LOC_A101;--18484


COPY INTO DATA_WAREHOUSE.BRONZE.ERP_PX_CAT_G1V2
FROM
(
SELECT $1,$2,$3,$4
FROM @data_warehouse_modern/ERP/PX_CAT_G1V2.csv
)
file_format='CSV_FILE_FORMAT';--37 ROWS LOADED

SELECT COUNT(1) FROM DATA_WAREHOUSE.BRONZE.ERP_PX_CAT_G1V2;--37
