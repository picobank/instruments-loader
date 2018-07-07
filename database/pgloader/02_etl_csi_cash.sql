
DO $$ 
DECLARE 
 expected_rows     integer := 274; -- 1 ignored because of MXP currency
 actual_rows       integer;
 source_id         integer;
 class_id          integer;
BEGIN 

    SELECT id INTO STRICT source_id FROM instrument_source 
        WHERE name = 'CSI/CASH';

    -- TODO: check this one
    SELECT id INTO STRICT class_id FROM instrument_class 
        WHERE name = 'Miscellaneous';

    INSERT INTO instrument (
        symbol,
        name,
        description,
        currency_id,
        instrument_class_id,
        instrument_source_id,
        from_date, thru_date,
        created_at, created_by,
        updated_at, updated_by
    ) SELECT 
        etl.symbol,
        etl.name,
        'TODO',
        currency.id,
        class_id,
        source_id,
        '2001-01-01', '2999-01-01', 
        current_timestamp, 'ETL', 
        current_timestamp, 'ETL' 
    FROM etl.etl_csi_cash AS etl JOIN instrument AS currency ON (
        upper(etl.currency) = currency.symbol 
        AND currency.instrument_class_id = 1)
    ;

    GET DIAGNOSTICS actual_rows = ROW_COUNT;

    ASSERT actual_rows = expected_rows,
        'Expected number of rows load into instrument to be ' || expected_rows || ' not ' || actual_rows;
END $$;

