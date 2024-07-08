# Change owner of the tables in a db script
DO $$DECLARE
    my_table_name text;
BEGIN
    FOR my_table_name IN
        SELECT table_schema || '.' || table_name
        FROM information_schema.tables
        WHERE table_schema = '<schema_name>' AND table_type = 'BASE TABLE'
    LOOP
        IF my_table_name IS NOT NULL THEN
            EXECUTE 'ALTER TABLE ' || my_table_name || ' OWNER TO <new_user>';
        END IF;
    END LOOP;
END$$;

# Grant all rights to the user in a certain PostgreSQL-Database
grant all privileges on database <database_name> to <user_name>;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA <schema_name> TO <user_name>;
GRANT ALL ON SCHEMA <schema_name> TO <user_name>;

# Change owner of the Database
ALTER DATABASE db_name OWNER TO new_owner_name;

# Change the password of the user
ALTER USER user_name WITH PASSWORD 'new_password';

# Log-in to a PostgreSQL-Database and execute a .sql script on a selected schema (password will be asked in the prompt)
psql -U <user_name> -d <db_name> -a -c "set schema '<yourschemaname>';" -h <db_endpoint> -f /path/to/your/sql/file/<yourfilename>.sql

# Take dump from a remote postgresql-db
PGPASSWORD=<your_remote_db_pass_here> pg_dump -h <your_db_adress_here> -p 5432 -U <your_user_name_here> <your_db_name_here> > <some_dump_name>.dump
PGPASSWORD=<your_remote_db_pass_here> psql -h <your_db_adress_here> -p 5432 -U <your_user_name_here> -d <your_db_name_here> < <some_dump_name>.dump

# Drop a Database forcefully
SELECT pg_terminate_backend(pg_stat_activity.pid)
   FROM pg_stat_activity
   WHERE pg_stat_activity.datname = '<db_name_here>'
   AND pid <> pg_backend_pid();
   DROP DATABASE <db_name_here>;


# Delete data from a table
DELETE FROM <table_name> WHERE <some_integer_coloumn> > <some_number>;


# Take a schema and count all the rows from all tables (count_schema_entries.sql)
-- Create a temporary table to store the results
CREATE TEMP TABLE schema_table_counts (
    table_name TEXT,
    row_count BIGINT
);

DO $$
DECLARE
    rec RECORD;
    schema_name TEXT := '<schema_name_here>';
    table_count BIGINT;
BEGIN
    FOR rec IN
        SELECT table_name
        FROM information_schema.tables
        WHERE table_schema = schema_name
          AND table_type = 'BASE TABLE'
    LOOP
        EXECUTE format('SELECT count(*) FROM %I.%I', schema_name, rec.table_name) INTO table_count;
        INSERT INTO schema_table_counts (table_name, row_count) VALUES (rec.table_name, table_count);
    END LOOP;
END $$;

-- Select the results with headers as a single output
COPY (
    SELECT 'table_name' AS table_name, 'row_count' AS row_count
    UNION ALL
    SELECT table_name, row_count::TEXT FROM schema_table_counts
    ORDER BY 1
) TO STDOUT WITH CSV HEADER;
