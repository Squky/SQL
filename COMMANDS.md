# WATCH THE SYNTAX!!!
```SQL
USE [DATABASE NAME];


CREATE TABLE [TABLE NAME]


SP_HELP [TABLE NAME]


DROP TABLE [TABLE NAME]


ALTER TABLE [TABLENAME]
ADD [Attribute] [type]


ALTER TABLE [TABLENAME]
DROP COLUMN [ColumnName]


INSERT INTO [Your Table] ( column_name1, ...)
VALUES ( 'value1', 'value2' )


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


INSERT INTO [TableName]
values
(
    'column1Value','column2Value'
)

ALTER TABLE [TableName]
ALTER COLUMN [columnName] VARCHAR(10) NOT NULL;

ALTER TABLE [TableName]
Add [ColumnName] [Type] [VALUE]


SELECT * FROM [TableName] WHERE [ColumnName] IS NULL
-- Not "WHERE [Column] = NULL"

-- BELOW IS JUST A QUERY FOR CREATING TABLES - NOT NOTES
CREATE TABLE customer
(
    cust_id  INT NOT NULL,
    f_name  VARCHAR(max),
    l_name  VARCHAR(max)
    PRIMARY KEY (cust_id)

)

CREATE TABLE item
(
    item_id INT NOT NULL,
    item_name VARCHAR(max),
    item_price DECIMAL(4,2)
    PRIMARY KEY (item_id)

)
drop

CREATE TABLE purchases
(
    purchase_id INT NOT NULL,
    purchase_date DATE,
    item_id INT,
    cust_id INT

    PRIMARY KEY (purchase_id)
    FOREIGN KEY (item_id) REFERENCES item(item_id),
    FOREIGN KEY (cust_id) REFERENCES customer(cust_id)
)

-- NOTES CONTINUE HERE

Update [TableName]
SET [Column]=[Value]
WHERE [Column]=[Value]


DELETE FROM [TableName]
WHERE [Column]=[Value]
