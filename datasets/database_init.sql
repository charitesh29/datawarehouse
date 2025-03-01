/*

=============================================================
Create Database and Schemas
=============================================================

Script Purpose:

    This script creates a new database named 'DataWarehouse' after checking if it already exists. 
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas 
    within the database: 'bronze', 'silver', and 'gold'.

*/

CREATE DATABASE IF NOT EXISTS DATA_WAREHOUSE;

CREATE SCHEMA IF NOT EXISTS BRONZE;

CREATE SCHEMA IF NOT EXISTS SILVER;

CREATE SCHEMA IF NOT EXISTS GOLD;
