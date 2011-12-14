--Agregamos clave foranea en C_Payment para que no deje ingresar registros en C_Payment sin una cabecera existente
--Creamos tabla de cabecera
CREATE TABLE adempiere.LAR_PaymentHeader 
( 
    LAR_PaymentHeader_ID    numeric(10,0) NOT NULL,
    c_doctype_id            numeric(10,0) NULL,
    documentno              varchar(50) NULL,
    datetrx                 timestamp NULL,
    c_bpartner_id           numeric(10,0) NULL,
    docstatus               varchar(2) NULL,
    processit               char(1) NULL,
    buscarpagos             char(1) NULL,
    ad_org_id               numeric(10,0) NULL,
    ad_client_id            numeric(10,0) NULL,
    updatedby               numeric(10,0) NULL,
    updated                 timestamp NULL,
    createdby               numeric(10,0) NULL,
    created                 timestamp NULL,
    isactive                char(1) NULL DEFAULT 'Y'::character varying,
    detalle                 char(1) NULL DEFAULT 'Y'::character varying,
    isreceipt               char(1) NULL DEFAULT 'Y'::character varying,
    processed               char(1) NULL DEFAULT 'N'::character varying,
    PRIMARY KEY(LAR_PaymentHeader_id)
)
;
--Agregamos ID de cabecera en el payment y el ID del documento fuente
ALTER TABLE C_Payment
ADD COLUMN LAR_PaymentHeader_ID numeric(10,0),
ADD COLUMN LAR_PaymentSource_ID numeric (10,0);
--Agregamos restricción para el ID de documento fuente
ALTER TABLE C_Payment 
	ADD CONSTRAINT FKC_PaymentSource 
	FOREIGN KEY (LAR_PaymentSource_ID) 
	REFERENCES C_Payment;
--
BEGIN;
--Agregamos columna temporal C_Payment_ID en LAR_PaymentHeader
ALTER TABLE LAR_PaymentHeader
ADD COLUMN C_Payment_ID numeric(10,0);
--Creamos secuencia temporal
CREATE TEMPORARY SEQUENCE nro  INCREMENT BY 1 START 0 MINVALUE 0;
--Insertamos una cabecera para cada payment existente con los datos de los mismos
INSERT INTO LAR_PaymentHeader
(
	LAR_PaymentHeader_ID,
	c_doctype_id,
	documentno,
	datetrx,
	c_bpartner_id,
	docstatus,
	processit,
	buscarpagos,
	ad_org_id,
	ad_client_id,
	updatedby,
	updated,
	createdby,
	created,
	isactive,
	detalle,
	isreceipt,
	processed,
	C_Payment_ID
)
    SELECT
        NEXTVAL('nro')+1000000 AS LAR_PaymentHeader_ID,
        c_doctype_id,
        documentno,
        datetrx,
        c_bpartner_id,
        docstatus,
        'N',
        'N',
        ad_org_id,
        ad_client_id,
        updatedby,
        updated,
        createdby,
        created,
        isactive,
        'N',
        isreceipt,
        processed,
        C_Payment_ID
    FROM C_Payment;
DROP SEQUENCE nro;
-- Actualizamos los Payments con el ID de la cabecera que le corresponda según el ID de Payment
UPDATE C_Payment P
SET LAR_PaymentHeader_ID= (SELECT LAR_PaymentHeader_ID FROM LAR_PaymentHeader H WHERE H.C_Payment_ID=P.C_Payment_ID);
-- Eliminamos la columna C_Payment_ID de LAR_PaymentHeader
ALTER TABLE LAR_PaymentHeader
DROP COLUMN C_Payment_ID;

COMMIT;
-- Agregamos constraint en C_Payment para que los ID de LAR_PaymentHeader_ID coincidan con los de la tabla LAR_PaymentHeader
ALTER TABLE C_Payment 
ADD CONSTRAINT FK_CPayment_LARPaymentH 
	FOREIGN KEY (LAR_PaymentHeader_ID) REFERENCES LAR_PaymentHeader;
	
-- Asignando valor por defecto "" a la columna CreditCardType
UPDATE ad_column
    set defaultvalue =''
WHERE AD_Column_ID=3869;
-- Eliminamos el tipo de tarjeta de crédito asignado a payments que no tienen regla de pago con tarjeta de crédito
UPDATE c_payment
    SET creditcardtype=''
WHERE tendertype <> 'C';
-- Modificamos la configuracion del System Configurator para que no se sobreescriba el nro de documento al completar los payments con el nro de cheque o tarjeta
UPDATE ad_sysconfig 
    set value='N'
WHERE name= 'PAYMENT_OVERWRITE_DOCUMENTNO_WITH_CHECK_ON_PAYMENT';

UPDATE ad_sysconfig 
    set value='N'
WHERE name= 'PAYMENT_OVERWRITE_DOCUMENTNO_WITH_CHECK_ON_RECEIPT';

UPDATE ad_sysconfig 
    set value='N'
WHERE name= 'PAYMENT_OVERWRITE_DOCUMENTNO_WITH_CREDIT_CARD';

-- Seteamos lógica de solo lectura a los campos que no tienen de la tabla C_Payment para que no se puedan modificar
-- los registros que referencien a un documento en cartera
UPDATE ad_column
    set readonlylogic = '@LAR_PaymentSource_ID@!0'
WHERE
    AD_Table_ID=335 --C_Payment
    AND mandatorylogic is null
;