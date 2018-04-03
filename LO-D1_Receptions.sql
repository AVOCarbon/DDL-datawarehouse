
CREATE TABLE dw."LO-D1_Receptions"
(
  from_code character varying(20) NOT NULL,
  to_code character varying(20) NOT NULL,
  "Internal_reference" character varying NOT NULL,
  shipment_number character varying(50),
  "PO_number" character varying(50) NOT NULL,
  "Movement_date" timestamp(6) without time zone NOT NULL,
  "Quantity" numeric(15,4),
  "Movement_value" numeric(15,4),
  "Site" character varying NOT NULL,
  "Import_date" timestamp(6) without time zone NOT NULL,
  CONSTRAINT "LO-D1_Receptions_pkey" PRIMARY KEY (from_code, to_code, "Internal_reference", "PO_number", "Movement_date", "Site", "Import_date"),
  CONSTRAINT "LO-D1_Receptions_T01" FOREIGN KEY ("Internal_reference", "Site")
      REFERENCES dw."T01_References" ("Internal_reference", "Site") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY IMMEDIATE
)
WITH (
  OIDS=FALSE
);
ALTER TABLE dw."LO-D1_Receptions"
  OWNER TO avocarbon;
