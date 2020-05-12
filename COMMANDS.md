# WATCH THE SYNTAX!!!

#### USE [DATABASE NAME];
#### CREATE TABLE [TABLE NAME]
#### SP_HELP [TABLE NAME]
#### DROP TABLE [TABLE NAME]
#### ALTER TABLE [TABLENAME] \n ADD [Attribute] [type]

#### ALTER TABLE [TABLENAME] \N DROP COLUMN [ColumnName]

#### INSERT INTO [Your Table] ( column_name1, ...)  \n   VALUES ( 'value1', 'value2' )
```SQL
USE hussain_db

CREATE TABLE hussain_film_table
(
    film_id INT NOT NULL,
    film_name VARCHAR(10),
    film_type VARCHAR(6),
    release_date DATE,
    direcctor VARCHAR,
    writer VARCHAR,
    Star VARCHAR,
    film_language VARCHAR,
    official_website VARCHAR,
    plot_summary VARCHAR(max)

)

SP_HELP hussain_film_table

DROP TABLE hussain_film_table

PRIMARY KEY (film_id),
FOREIGN KEY (column name you want to put as a foreign key in this table) REFERENCES TableName(key)
