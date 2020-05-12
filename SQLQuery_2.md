CREATE DATABASE hussain_db

USE hussain_db

CREATE TABLE hussain_film_table
(
    film_id INT IDENTITY(0,1),
    film_name VARCHAR(max) NOT NULL ,
    film_type VARCHAR(max),
    release_date DATE,
    director VARCHAR(max),
    writer VARCHAR(max),
    Star VARCHAR(max),
    film_language VARCHAR(max),
    official_website VARCHAR(max),
    plot_summary VARCHAR(max)

    PRIMARY KEY (film_id)

)




ALTER TABLE hussain_film_table
DROP COLUMN release_date2

SP_HELP hussain_film_table

DROP TABLE hussain_film_table

INSERT INTO hussain_film_table
(
       film_name,film_type, release_date, director ,writer, Star, film_language, official_website, plot_summary
)
VALUES
(
    'Jaws','Thriller Horror','1975-12-26','Steven Spielberg','Peter Benchley','Roy Sheider','English','N/A', 'Big Shark in Litle town'
)


-- CREATING CUSTOMER TABLE
CREATE TABLE customer
(
    cust_id  INT NOT NULL,
    f_name  VARCHAR(max),
    l_name  VARCHAR(max)
    PRIMARY KEY (cust_id)

)


-- ADDING VALUES TO TABLE
INSERT INTO customer
VALUES
(
    123, 'Joseph', 'Joestar'
)

-- CUSTOMER CODE ENDS HERE



-- CREATING item TABLE
CREATE TABLE item
(
    item_id INT NOT NULL,
    item_name VARCHAR(max),
    item_price DECIMAL(4,2)
    PRIMARY KEY (item_id)

)

-- ADDING VALUES TO item TABLE
INSERT INTO item
VALUES
(
    456, 'A stone Mask', 18.99
)


-- Updating the values after deleting them FOR TESTING.
UPDATE item
SET item_id = 456
WHERE item_name = 'A stone Mask'


-- item TABLE  code ends here




CREATE TABLE employee
(
    empl_id INT NOT NULL,
    empl_fName VARCHAR(50),
    empl_Lname VARCHAR(50),
    PRIMARY KEY (empl_id)
)

INSERT INTO employee
VALUES
(
    789,'Bil','Bob'
)



-- Creating table 'purchases' 
CREATE TABLE purchases
(
    purchase_id INT NOT NULL,
    purchase_date DATE,
    item_id INT,
    cust_id INT,
    empl_id INT

    PRIMARY KEY (purchase_id)
    
    FOREIGN KEY (item_id) REFERENCES item(item_id) ON DELETE SET NULL,

    FOREIGN KEY (cust_id) REFERENCES customer(cust_id) ON DELETE CASCADE,

    FOREIGN KEY (empl_id) REFERENCES employee(empl_id) ON UPDATE CASCADE
)


-- ADDING values into 'purchases'
INSERT INTO purchases
VALUES
(
    000,'2020-12-15', 456,123,789
)





-- For testing 'ON DELETE' stuff
DELETE FROM item
WHERE item_id = 456

DELETE FROM customer
WHERE cust_id = 123

UPDATE employee
SET empl_id = 987
WHERE empl_id = 789







DROP TABLE purchases

SELECT * FROM purchases

SELECT * FROM hussain_film_table