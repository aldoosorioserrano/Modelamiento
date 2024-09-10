-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2024-09-09 21:49:03 CLST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE cliente (
    rut       VARCHAR2(10) NOT NULL,
    nombres   VARCHAR2(50) NOT NULL,
    apellidos VARCHAR2(50) NOT NULL,
    domicilio VARCHAR2(100) NOT NULL,
    contactos VARCHAR2(25) NOT NULL
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( rut );

CREATE TABLE detalle_repuesto (
    id_servicio INTEGER NOT NULL,
    id_repuesto INTEGER NOT NULL,
    cantidad    INTEGER NOT NULL
);

ALTER TABLE detalle_repuesto ADD CONSTRAINT detalle_repuesto_pk PRIMARY KEY ( id_servicio,
                                                                              id_repuesto );

CREATE TABLE orden_de_atencion (
    id_orden           INTEGER NOT NULL,
    fecha              DATE NOT NULL,
    "Tipo de Servicio" VARCHAR2(100),
    cliente_rut        VARCHAR2(10) NOT NULL,
    vehiculo_patente   VARCHAR2(6) NOT NULL
);

ALTER TABLE orden_de_atencion ADD CONSTRAINT "Orden de Atencion_PK" PRIMARY KEY ( id_orden );

CREATE TABLE repuestos (
    id_repuesto INTEGER NOT NULL,
    nombre      VARCHAR2(50),
    costo       INTEGER NOT NULL,
    stock       INTEGER NOT NULL
);

ALTER TABLE repuestos ADD CONSTRAINT repuestos_pk PRIMARY KEY ( id_repuesto );

CREATE TABLE seguimiento (
    id_orden    INTEGER NOT NULL,
    id_servicio INTEGER NOT NULL,
    estado      VARCHAR2(50) NOT NULL,
    fecha       DATE NOT NULL
);

ALTER TABLE seguimiento ADD CONSTRAINT seguimiento_pk PRIMARY KEY ( id_orden,
                                                                    id_servicio );

CREATE TABLE servicios (
    id_servicio INTEGER NOT NULL,
    descripcion VARCHAR2(100) NOT NULL,
    costo       INTEGER,
    id_orden    INTEGER NOT NULL,
    estado      CHAR(1) NOT NULL
);

ALTER TABLE servicios ADD CONSTRAINT servicios_pk PRIMARY KEY ( id_servicio );

CREATE TABLE validacion (
    id_validacion    INTEGER NOT NULL,
    id_servicio      INTEGER NOT NULL,
    validado         CHAR(1) NOT NULL,
    fecha_validacion DATE NOT NULL,
    observaciones    VARCHAR2(250)
);

ALTER TABLE validacion ADD CONSTRAINT validacion_pk PRIMARY KEY ( id_validacion );

CREATE TABLE vehiculo (
    patente     VARCHAR2(6) NOT NULL,
    marca       VARCHAR2(30) NOT NULL,
    modelo      VARCHAR2(30) NOT NULL,
    año         INTEGER NOT NULL,
    color       VARCHAR2(30) NOT NULL,
    cliente_rut VARCHAR2(10) NOT NULL
);

ALTER TABLE vehiculo ADD CONSTRAINT vehiculo_pk PRIMARY KEY ( patente );

ALTER TABLE orden_de_atencion
    ADD CONSTRAINT orden_de_atencion_cliente_fk FOREIGN KEY ( cliente_rut )
        REFERENCES cliente ( rut );

ALTER TABLE orden_de_atencion
    ADD CONSTRAINT orden_de_atencion_vehiculo_fk FOREIGN KEY ( vehiculo_patente )
        REFERENCES vehiculo ( patente );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE seguimiento
    ADD CONSTRAINT seguimiento_orden_de_atencion_fk FOREIGN KEY ( id_orden )
        REFERENCES orden_de_atencion ( id_orden );

ALTER TABLE seguimiento
    ADD CONSTRAINT seguimiento_servicios_fk FOREIGN KEY ( id_servicio )
        REFERENCES servicios ( id_servicio );

ALTER TABLE servicios
    ADD CONSTRAINT servicios_orden_de_atencion_fk FOREIGN KEY ( id_orden )
        REFERENCES orden_de_atencion ( id_orden );

ALTER TABLE validacion
    ADD CONSTRAINT validacion_servicios_fk FOREIGN KEY ( id_servicio )
        REFERENCES servicios ( id_servicio );

ALTER TABLE vehiculo
    ADD CONSTRAINT vehiculo_cliente_fk FOREIGN KEY ( cliente_rut )
        REFERENCES cliente ( rut );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             8
-- CREATE INDEX                             0
-- ALTER TABLE                             15
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   1
-- WARNINGS                                 0
