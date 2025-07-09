CREATE TABLE USUARIO (
    id              INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome            VARCHAR2(50),
    documento       VARCHAR(20),
    dataNascimento  DATE,
    ativo           NUMBER(1)
)