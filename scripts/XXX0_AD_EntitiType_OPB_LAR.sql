-- Inserta Entidad OPB_LAR

INSERT INTO AD_EntityType(entitytype, ad_client_id, ad_org_id, ad_entitytype_id, isactive, created, createdby, updated, updatedby, name, description, help, version, modelpackage, classpath, processing)
  VALUES('OPB_LAR', 0, 0, 
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=1268), -- AD_EntityType_ID
'Y', '2010-09-06 12:33:55.0', 100, '2010-09-06 12:33:55.0', 100, 'Localizacion ARgentina', 'Localizacion ARgentina desarrollada por Ergio & OPENBIZ', 'Localizacion ARgentina incluye las modificaciones necesarias para calculo de impuestos, retenciones , generacion y validacion del digito verificador del CUIT.
Desarrollado por ERGIO (http://www.ergio.com.ar) y OPENBIZ (http://www.openbiz.com.ar)', NULL, 'org.openbiz.model', NULL, 'N');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=1268;  -- AD_EntitiType


