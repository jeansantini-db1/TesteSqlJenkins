CREATE TABLE ENDERECO (
    id              INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    rua             VARCHAR2(50),
    numero          NUMBER,
    ativo           NUMBER(1)
);