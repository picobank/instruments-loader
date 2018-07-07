
DO $$ 
DECLARE 
 expected_rows     integer := 36; -- 1 ignored because of MXP currency
 actual_rows       integer;
 source_id         integer;
 class_id          integer;
BEGIN 

    SELECT id INTO STRICT source_id FROM instrument_source 
        WHERE name = 'CSI/STOCKOPTION';

    -- TODO: check this one
    SELECT id INTO STRICT class_id FROM instrument_class 
        WHERE name = 'StockOption';

    INSERT INTO instrument (
        symbol,
        name,
        description,
        instrument_class_id,
        instrument_source_id,
        from_date, thru_date,
        created_at, created_by,
        updated_at, updated_by
    ) SELECT 
        etl.symbol,
        etl.name,
        'TODO',
        class_id,
        source_id,
        COALESCE(etl.startdate, '2001-01-01'), COALESCE(etl.enddate, '2999-01-01'),
        current_timestamp, 'ETL', 
        current_timestamp, 'ETL' 
    FROM etl.etl_csi_stockoption AS etl 
    ;

    GET DIAGNOSTICS actual_rows = ROW_COUNT;

    ASSERT actual_rows = expected_rows,
        'Expected number of rows load into instrument to be ' || expected_rows || ' not ' || actual_rows;
END $$;

