-- CLS_REGIONS.
BEGIN
  pkg_drop.drop_proc(object_name => 'cls_regions', object_type => 'table');
END;  

CREATE TABLE cls_regions
  (
    region_id    NUMBER ( 10 ) NOT NULL,
    region_desc  VARCHAR2(200 CHAR) NOT NULL,
    continent_id NUMBER ( 10 ) NOT NULL
  );