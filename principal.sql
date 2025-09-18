SOURCE /home/ubuntu/hospitales/hospitales-data.sql
SOURCE /home/ubuntu/hospitales/empleados-data.sql

SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE '/home/ubuntu/hospitales/empleados-data.csv'
INTO TABLE PERSONAL
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
