-- WRK_STRUCTURES.
BEGIN
  pkg_drop.drop_proc(object_name => 'wrk_structures', object_type => 'table');
END;

CREATE TABLE wrk_structures  
(
 child_code           NUMBER(10,0),
 parent_code          NUMBER(10,0),
 structure_desc       VARCHAR2(200 CHAR),
 structure_level      VARCHAR2(200 CHAR)
);