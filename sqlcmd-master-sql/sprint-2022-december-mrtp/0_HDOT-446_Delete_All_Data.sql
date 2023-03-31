
EXEC sp_msforeachtable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL'  -- Uncheck all constraints
EXEC sp_msforeachtable 'DELETE FROM ?'                         -- Delete data from all tables
EXEC sp_MSForEachTable 'ALTER TABLE ? CHECK CONSTRAINT ALL'    -- Check all constraints