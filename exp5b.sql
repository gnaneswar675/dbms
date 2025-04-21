-- Assuming this is your student table
-- CREATE TABLE student (
--     id NUMBER,
--     name VARCHAR2(50),
--     marks NUMBER
-- );

DECLARE
    -- Variables to hold student data
    v_id student.id%TYPE;
    v_name student.name%TYPE;
    v_marks student.marks%TYPE;
BEGIN
    -- Insert first student
    v_id := 1;
    v_name := 'Alice';
    v_marks := 85;
    INSERT INTO student (id, name, marks) VALUES (v_id, v_name, v_marks);
    
    SAVEPOINT sp1;  -- Savepoint after first insert

    -- Insert second student
    v_id := 2;
    v_name := 'Bob';
    v_marks := 90;
    INSERT INTO student (id, name, marks) VALUES (v_id, v_name, v_marks);
    
    SAVEPOINT sp2;  -- Savepoint after second insert

    -- Insert third student (with deliberate mistake)
    v_id := 1;  -- Duplicate ID (assuming primary key), this will raise an error
    v_name := 'Charlie';
    v_marks := 75;
    BEGIN
        INSERT INTO student (id, name, marks) VALUES (v_id, v_name, v_marks);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            DBMS_OUTPUT.PUT_LINE('Duplicate ID error occurred. Rolling back to savepoint sp1...');
            ROLLBACK TO sp1;
    END;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Transaction committed successfully.');
END;


-------output-------
-- Duplicate ID error occurred. Rolling back to savepoint sp1...
-- Transaction committed successfully.