use sales
select * from SalesAnalysis

/* Change Column name */

sp_rename 'SalesAnalysis.Order_ID', 'Order_ID', 'COLUMN';

sp_rename 'SalesAnalysis.Ship Date', 'Ship_Date', 'COLUMN'; 

sp_rename 'SalesAnalysis.ROw_ID', 'Row_ID', 'COLUMN';
sp_rename 'SalesAnalysis.Order Date', 'Order_Date', 'COLUMN';
sp_rename 'SalesAnalysis.Ship Mode', 'Ship_Mode', 'COLUMN';
sp_rename 'SalesAnalysis.Customer ID', 'Customer_ID', 'COLUMN';
sp_rename 'SalesAnalysis.Customer Name', 'Customer_Name', 'COLUMN';
sp_rename 'SalesAnalysis.Postal Code', 'Postal_Code', 'COLUMN';
sp_rename 'SalesAnalysis.Product ID', 'Product_ID', 'COLUMN';
sp_rename 'SalesAnalysis.Sub-Category', 'Sub_Category', 'COLUMN';
sp_rename 'SalesAnalysis.Product Name', 'Product_Name', 'COLUMN';
sp_rename 'SalesAnalysis.', 'new_column_name', 'COLUMN';

/* Change Cloumn Datetype */

alter table SalesAnalysis
alter column Order_Date Date;

alter table SalesAnalysis
alter column Ship_Date Date;

alter table SalesAnalysis
alter column Ship_mode varchar(50);

alter table SalesAnalysis
alter column Segment varchar(50);

alter table SalesAnalysis
alter column Country varchar(50);

alter table SalesAnalysis
alter column State varchar(50);

alter table SalesAnalysis

alter table SalesAnalysis
alter column Postal_Code int;

alter table SalesAnalysis
alter column Region varchar(50);

alter table SalesAnalysis
alter column Category varchar(50);

alter table SalesAnalysis
alter column Sub_Category varchar(50);

alter table SalesAnalysis
alter column Sales float;

alter table SalesAnalysis
alter column Quantity int;

alter table SalesAnalysis
alter column Discount float;

SELECT * FROM SalesAnalysis;

 /* Change Order_Date Format */

SELECT CONVERT(Date, Order_Date, 'YYYY-MM-DD') AS Order_date
FROM SalesAnalysis;

/* Change Ship_Date Format */

SELECT CONVERT(VARCHAR, Ship_Date, 110) AS formatted_date
FROM SalesAnalysis;

/* Change Currency Symbol in Price Cleaning*/

CAST(CONVERT(Price,'$','') AS UNSIGNED) AS price_clean

SELECT * from listings;


