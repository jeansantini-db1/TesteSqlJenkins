DECLARE
  v_table_exists NUMBER;
BEGIN

  SELECT COUNT(*) INTO v_table_exists
  FROM all_tables
  WHERE owner = 'SUPERVISOR' 
    AND table_name = 'USUARIO';

  IF v_table_exists = 0 THEN
    EXECUTE IMMEDIATE 'CREATE TABLE SUPERVISOR.USUARIO (
      id              INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
      nome            VARCHAR2(50),
      documento       VARCHAR2(20),
      dataNascimento  DATE,
      ativo           NUMBER(1)
    );';
  END IF;
END;
/