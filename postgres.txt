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

# Change the password of the user
ALTER USER user_name WITH PASSWORD 'new_password';

# Log-in to a PostgreSQL-Database and execute a .sql script on a selected schema (password will be asked in the prompt)
psql -U <user_name> -d <db_name> -a -c "set schema '<yourschemaname>';" -h <db_endpoint> -f /path/to/your/sql/file/<yourfilename>.sql
