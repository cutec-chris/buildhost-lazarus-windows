CREATE TABLE USERS (
  U_ID BIGINT NOT NULL,
  U_LOGIN VARCHAR(40) NOT NULL,
  U_NAME VARCHAR(30) NOT NULL,
  U_EMAIL VARCHAR(100),
  U_PASSWORD VARCHAR(100) NOT NULL,
  CONSTRAINT PK_FPCUSERS PRIMARY KEY (U_ID),
  CONSTRAINT U_USERNAME UNIQUE (U_LOGIN)
);

  