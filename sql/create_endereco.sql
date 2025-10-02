DECLARE
  v_table_exists NUMBER;
BEGIN

  SELECT COUNT(*) INTO v_table_exists
  FROM all_tables
  WHERE owner = 'SUPERVISOR' 
    AND table_name = 'ENDERECO';

  IF v_table_exists = 0 THEN
    EXECUTE IMMEDIATE 'CREATE TABLE SUPERVISOR.ENDERECO (
      id              INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
      rua             VARCHAR2(50),
      numero          NUMBER,
      ativo           NUMBER(1)
    );';
  END IF;
END;
/