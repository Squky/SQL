# SQL Lectures

## Monday 11/05/2020 Intro to SQL Databases-
### Database Terminologies-
Database: A structured set of data held in a computer, accessible in various ways.

We must be able to structure tables to contain the right type of info, so that it can be queried.

**Relational Database**: Uses 'Normalisation' to retrieve data efficiently.

**Table** - Predefined format of rows and columns that define an entity. Also known as a File

  Table consists of Columns(**Attributes** of Entity) and Rows(**Records** or **Tuples**)

**DBMS** - A **D**ata**B**ase **M**anagement **S**ystem allows a computer to perform database functions.

**Primary Key \
Foreign Key**:
  Ensures that the row of info in Table A corresponds to the correct row of info in Table B.\
  Prevents **invalid data** from being inserted into the foreign key column, because it has to be one of the values contained in the table it points to.\
  Cannot delete the primary key version of this while it is being used as a foreign key.

#### Types of Databases
**Flat-file Database:**
  Stores everything in one table.\
  Good for small numbers of records related to a single topic.

**Relational Database:**
  Gives you the ability to spearate masses of data into numerous tables.\
  They are linked to each other through the use of keys.

**Big Data:**
  MongoDb, Vertica etc.
  Used for Data Analytics and Business intellgience.\
  Digital Age and Internet of Things.

**Entity Relationship diagrams**/ Relations between Attributes:\
    **One-to-One** - An employee can only have one id\
    **One-to-Many** - A customer can buy multiple things\
    **Many-to-One** - Many students can take many courses.\
    Avoid redundancy by having a junction table; turning it into **One-to-Many**.\
    **Junction Table:**
      Contains the primary keys from the 2 other tables that it is combining.\
      Allowing each table to use the other's key to retrieve the information from that table.\
      Has a composite primary key, not its own.\
      **Composite primary key**: A combination of 2 foreign keys.
      **Candidate Keys**: Keys which are eligible candidates to become the primary key for a table.

### Structured Query Language
#### Data Manipulation Language
**DML:**\
SELECT\
INSERT\
UPDATE\
DELETE

#### Data Definition Language
**DDL:**\
CREATE\
ALTER\
DROP\
TRUNCATE- delete all the data from the table and the table is now empty. No in between (UNLIKE **DELETE**)
#### Data Control Language
**DCL - Permissions:**\
GRANT\
REVOKE
#### Transaction Control Language
TCL:\
COMMIT\
ROLLBACK\
SAVEPOINT

### Data Types
#### VARCHAR
- Variable length character/s. Records MAX size.
- Will only use the necessary amount of space for characters
#### CHARACTER or CHAR
- Fixed length character/s. Will count empty spaces as part of the data input. **MEMORY IN-EFFICIENT** BUT is 50% faster in retrieving data.
#### INT
- A whole number. Can also be bigint, smallint and tinyint
#### DATE or TIME or DATETIME
- Stores Date, Time or Both.
#### Decimal or Numeric

#### Binary
- Used to store binary data such as image or file

#### Float
- Scientific use (very large number)

#### BIT
- Acts as a boolean
- Equivalent to binary (0, 1 or NULL)


# Tuesday 12/05/2020

#### Variations on INSERT
**Changing the Order of the columns**
- If you've already created a table, the order in which you add the data doesn't have to be the same as the original column order as long as the values match the order you are now inserting.

**Omitting column names**
- You don't have to put the column names in, but the values have to be in the same order as the original columns

**Leaving some columns out**
- You can leave some info out, it doesn't have to be inserted with the rest.
- For this you will have to specify the column names the values are going into.

**VARCHAR, CHAR AND DATE** ALL use quotes for their **VALUES**
- Not Decimal and int

**Common errors:**
- Missing VALUE.
- Missing column.
- Missing single quote mark.

**NULL is an undefined value - similar to absence of other data**
- NULL =!= NULL
- **NULL** is written without \' \'

**Identity(0,1)**
- auto increments column and treats it as id

#### DataBase Considerations
**Data Security**
- Protect key data info.
- PCI (Payment Card Industry Data Standard) compliance.
**Data Recovery**
- Failsafes must be implemented
**Data Integrity**
- Ensure data does not get corrupted or is incomplete.
**Normal Form**
- Data formats


### Normalisation
- **1NF**
 - Each cell should only have one value
 - There should be no redundancy
 - Split table into 2
- **2NF**
 - MUST be in **1NF**
 - All non-key attribute are fully functionally dependent on the Primary Key
 - i.e. splitting a table into 2 tables where in one table, one of the attributes is fully dpendent on the primary key in that table.

- **3NF**
 - MUST be in **2NF**
 - There is **NO** transitive functional dependency
 - i.e. A transitive Functional Dependency is when a non-key column is Functionally Dependent on another non-key column, which is Functionally Dependent on the Primary key.



**WILD CARD characters**
- Wildcards can be used as a substitute for any other characters in a string when using the LIKE operator
- **%** A substitute for zero **or** more characters
- **_** A sub for a single character
- [charlist] : Sets and ranges of characters to match.
 - For example:
 ```SQL
 LIKE [ABC]%

- [^charlist]: Sets and ranges of characters that don't match.
  - For example:
  ```SQL
  LIKE[^ABC]%

  - This will bring back anything that does not start with those letters



**ON DELETE CASCADE**

- Check COMMANDS.md

# Wedesnday 13/05/2020

### Continuing with Data-base querying
**Arithmetic Operators**
- +
- -
- *
- /
- %: Modulus

**Gross Total vs Net Total**

**ORDER BY:**
``` SQL
SELECT UnitPrice, Quantity, Discount, UnitPrice * Quantity AS "Gross Total"
FROM [Order Details]
ORDER BY "Gross Total" DESC
```
GROUP BY does not have this functionality!
Also the columns being GROUP BY'd must also be mentioned in the SELECT section.


### String Functions
- SUBSTRING:
```SQL
SUBSTRING(expression, start, length)
SUBSTRING(name,1,1) for the initial
```
- CHARINDEX:
```SQL
CHARINDEX('a'.'text') --to search for a string e.g. find 'a' in a column called 'text'
returns '0' if not found
```
- LEFT or RIGHT:
LEFT(name,5) -- for the first (or last) 5 characters

- LTRIM or RTRIM
 - Used to remove spaces at the beginning or end of a string

- LEN
  - returns length of string

- REPLACE
 -REPLACE(name,' ','_') to replace 2nd parameter with the 3rd parameter.

- UPPER or LOWER
 - Converts to upper/lower case

### Escaping
- Using Apostrophe to escape (not \\)
  - i.e. LIKE '%''%'
  - or ''''

### DATE Functions
- GETDATE
- SYSDATETIME
- DATEADD
```SQL
SELECT DATEADD(d,5,OrderDate) AS "Due Date",
DATEDIFF(d,OrderDate,ShippedDate) AS "Ship Days"
FROM Orders

- - DATEADD has 3 arguments:
  - d or dd means day, m or mm month etc
  - Date to be added to
  - How many units to addd

- DATEDIFF
- YEAR
- MONTH
- DAY

### SELECT CASE
```SQL
SELECT DATEDIFF(d,OrderDate,ShippedDate) AS "Days for Delivery",
CASE
WHEN DATEDIFF(d,OrderDate,ShippedDate) <10
THEN 'On Time'
ELSE 'Overdue'
END AS 'Status'
FROM Orders
```
### JOINS
- INNER JOIN
  - ONLY returns rows that have matching columns in the other table
- LEFT JOIN
  - Returns ALL the rows from the left table and only MATCHING ones from the right.
- RIGHT JOIN
  - Returns ALL the rows from the RIGHT table and only MATCHING ones from the left.


### Join sub queries


### GROUP BY- HAVING in detail
**Aggregate Functions:**
- SUM
- AVG
- MIN
- MAX
- COUNT

### union and union all
- Used to combine 2 columns from 2 different tables
- **Union** is distinct
- **Union all** is not

### String methods

### -
