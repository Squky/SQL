USE hussain_db

CREATE TABLE hussain_film_table
(

    film_name VARCHAR(max),
    film_type VARCHAR(max),
    release_date DATE,
    direcctor VARCHAR,
    writer VARCHAR,
    Star VARCHAR,
    film_language VARCHAR,
    official_website VARCHAR,
    plot_summary VARCHAR(max)

)

ALTER TABLE hussain_film_table
DROP COLUMN release_date2

SP_HELP hussain_film_table

DROP TABLE hussain_film_table

INSERT INTO hussain_film_table
(
    film_name
)
VALUES
(
    'Jaws'
)

SELECT * FROM hussain_film_table