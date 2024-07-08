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
