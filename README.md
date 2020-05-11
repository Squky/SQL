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
  Prevents **invalid data** from being inserted into the foreign key column, because it has to be one of hte values contained in the table it points to.\
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
DCL - Permissions:\
GRANT\
REVOKE
#### Transaction Control Language
TCL:\
COMMIT\
ROLLBACK\
SAVEPOINT

### Data Types
#### VARCHAR
Variable length character/s. Records MAX size.
Will only use the necessary amount of space for characters
#### CHARACTER or CHAR
Fixed length character/s. Will count empty spaces as part of the data input. **MEMORY IN-EFFICIENT** BUT is 50% faster in retrieving data.
#### INT
A whole number. Can also be bigint, smallint and tinyint
#### DATE or TIME or DATETIME
Stores Date, Time or Both.
#### Decimal or Numeric

#### Binary
Used to store binary data such as image or file

#### Float
Scientific use (very large number)

#### BIT
Acts as a boolean
Equivalent to binary (0, 1 or NULL)
