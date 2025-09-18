SOURCE /home/ubuntu/hospitales/hospitales-data.sql;
SOURCE /home/ubuntu/hospitales/personal-data.sql;
LOAD DATA LOCAL INFILE '/home/ubuntu/hospitales/personal-data.csv'
INTO TABLE PERSONAL
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
SOURCE /home/ubuntu/hospitales/administrativo-data.sql;
SOURCE /home/ubuntu/hospitales/sanitario-data-p1.sql;
SOURCE /home/ubuntu/hospitales/sanitario-data-p2.sql;
SOURCE /home/ubuntu/hospitales/medicos-data-p1.sql;
SOURCE /home/ubuntu/hospitales/medicos-data-p2.sql;
SOURCE /home/ubuntu/hospitales/enfermeros-data.sql;
SOURCE /home/ubuntu/hospitales/obrassociales-data.sql;
SOURCE /home/ubuntu/hospitales/pacientes-data.sql;
SOURCE /home/ubuntu/hospitales/enfermedades-data.sql;
