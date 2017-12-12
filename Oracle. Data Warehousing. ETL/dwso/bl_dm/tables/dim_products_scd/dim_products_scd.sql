BEGIN
  pkg_drop.drop_proc(object_name => 'dim_products_scd', object_type => 'table');
END;

CREATE TABLE dim_products_scd (
    product_surr_id     NUMBER(38) NOT NULL,
    product_id          NUMBER(38) NOT NULL,
    product_desc        VARCHAR2(100 BYTE) NOT NULL,
    line_name           VARCHAR2(100 BYTE) NOT NULL,
    collection_name     VARCHAR2(100 BYTE) NOT NULL,
    product_type        VARCHAR2(100 BYTE) NOT NULL,
    bra_size_uk         VARCHAR2(100 BYTE) DEFAULT '0',
    bra_size_usa        VARCHAR2(100 BYTE) DEFAULT '0',
    bra_size_eu         VARCHAR2(100 BYTE) DEFAULT '0',
    bra_size_fr         VARCHAR2(100 BYTE) DEFAULT '0',
    bra_size_uie        VARCHAR2(100 BYTE) DEFAULT '0',
    panties_size_uk     VARCHAR2(100 BYTE) DEFAULT '0',
    panties_size_usa    VARCHAR2(100 BYTE) DEFAULT '0',
    panties_size_eu     VARCHAR2(100 BYTE) DEFAULT '0',
    panties_size_fr     VARCHAR2(100 BYTE) DEFAULT '0',
    panties_size_uie    VARCHAR2(100 BYTE) DEFAULT '0',
    color               VARCHAR2(100 BYTE),
    price               NUMBER(38),
    start_dt            DATE DEFAULT '01-JAN-1990',
    end_dt              DATE DEFAULT '31-DEC-9999',
    is_active           VARCHAR2 ( 200 CHAR ) NOT NULL,
    CONSTRAINT product_surr_id_pk PRIMARY KEY (product_surr_id)
)
    PARTITION BY LIST (collection_name)
        SUBPARTITION BY LIST (product_type)
(
    PARTITION swimwear VALUES ('swimwear')
     (SUBPARTITION bra_s VALUES ('bra'),
      SUBPARTITION panties_s VALUES ('panty')) 
,
    PARTITION fashion VALUES ('fashion')
     (SUBPARTITION bra_f VALUES ('bra'),
      SUBPARTITION panties_f VALUES ('panty')) 
,
    PARTITION classic VALUES ('classic')
     (SUBPARTITION bra_c VALUES ('bra'),
      SUBPARTITION panties_c VALUES ('panty'))   
);