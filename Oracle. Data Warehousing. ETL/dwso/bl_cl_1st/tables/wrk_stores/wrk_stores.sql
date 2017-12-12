-- WRK_STORES.
BEGIN
  pkg_drop.drop_proc(object_name => 'wrk_stores', object_type => 'table');
END;

CREATE TABLE wrk_stores
  (
    store_code VARCHAR2 ( 200 CHAR ),
    store_name VARCHAR2 ( 200 CHAR ),
    manager_id VARCHAR2 ( 200 CHAR ),
    phone      VARCHAR2 ( 200 CHAR ),
    address    VARCHAR2 ( 200 CHAR ),
    city       VARCHAR2 ( 200 CHAR ),
    country_id VARCHAR2 ( 200 CHAR ),
    start_dt   DATE
  );