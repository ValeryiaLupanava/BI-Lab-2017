-- Creating table with partitions.
CREATE TABLE PT_EMPLOYEES_RANGE_SP
( EMPLOYEE_ID	NUMBER(6,0),
  JOB_ID	    VARCHAR2(10 BYTE),
  HIRE_DATE	  DATE
 )
 PARTITION BY RANGE(EMPLOYEE_ID)
 (partition PT_1 values less than (120),
  partition PT_2 values less than (140),
  partition PT_3 values less than (170),
  partition PT_OTHER values less than (maxvalue)
 );
 
-- Filling table with data.
INSERT INTO PT_EMPLOYEES_RANGE_SP(EMPLOYEE_ID, JOB_ID, HIRE_DATE)
SELECT      EMPLOYEE_ID, JOB_ID, HIRE_DATE
FROM        EMPLOYEES;

ALTER TABLE PT_EMPLOYEES_RANGE_SP ADD CONSTRAINT EMPLOYEE_ID_SP_PK PRIMARY KEY (EMPLOYEE_ID);

-- Merging partitions PT_1, PT_2 into PT_2.

ALTER TABLE PT_EMPLOYEES_RANGE_SP MERGE PARTITIONS PT_1, PT_2 INTO PARTITION PT_2;

-- Splitting patition PT_2 on PT_1, PT_2.

ALTER TABLE PT_EMPLOYEES_RANGE_SP SPLIT PARTITION PT_2 at (120) INTO (PARTITION PT_1, PARTITION PT_2);