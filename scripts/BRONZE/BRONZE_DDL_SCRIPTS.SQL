/*

===============================================================================
DDL Script: Create Bronze Tables
===============================================================================

Script Purpose:

    This script creates tables in the 'bronze' schema.
    
===============================================================================

*/

--CRM SOURCE SYSTEM DDL'S

CREATE OR REPLACE TABLE  DATA_WAREHOUSE.BRONZE.CRM_CUST_INFO (
    cst_id              INT,
    cst_key             VARCHAR(50),
    cst_firstname       VARCHAR(50),
    cst_lastname        VARCHAR(50),
    cst_marital_status  VARCHAR(50),
    cst_gndr            VARCHAR(50),
    cst_create_date     DATE
);

CREATE OR REPLACE TABLE DATA_WAREHOUSE.BRONZE.CRM_PRD_INFO
(
    prd_id       INT,
    prd_key      VARCHAR(50),
    prd_nm       VARCHAR(50),
    prd_cost     INT,
    prd_line     VARCHAR(50),
    prd_start_dt DATE,
    prd_end_dt   DATE
);

CREATE OR REPLACE TABLE DATA_WAREHOUSE.BRONZE.CRM_SALES_DETAILS (
    sls_ord_num  VARCHAR(50),
    sls_prd_key  VARCHAR(50),
    sls_cust_id  INT,
    sls_order_dt INT,
    sls_ship_dt  INT,
    sls_due_dt   INT,
    sls_sales    INT,
    sls_quantity INT,
    sls_price    INT
);

--ERP SOURCE SYSTEM DDL'S

CREATE OR REPLACE TABLE DATA_WAREHOUSE.BRONZE.ERP_LOC_A101 (
    cid    VARCHAR(50),
    cntry  VARCHAR(50)
);

CREATE OR REPLACE TABLE DATA_WAREHOUSE.BRONZE.ERP_CUST_AZ12 (
    cid    VARCHAR(50),
    bdate  DATE,
    gen    VARCHAR(50)
);

CREATE OR REPLACE TABLE DATA_WAREHOUSE.BRONZE.ERP_PX_CAT_G1V2 (
    id           VARCHAR(50),
    cat          VARCHAR(50),
    subcat       VARCHAR(50),
    maintenance  VARCHAR(50)
);
