-- Actualizacion Diccionario
-- Inserta Entity Type OPB_LAR
INSERT INTO adempiere.AD_EntityType(entitytype, ad_client_id, ad_org_id, ad_entitytype_id, isactive, created, createdby, updated, updatedby, name, description, help, version, modelpackage, classpath, processing)
  VALUES('OPB_LAR', 0, 0, 
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=1268),  -- AD_EntityType_ID
'Y', '2010-09-06 12:33:55.0', 100, '2010-09-06 12:33:55.0', 100, 'Localizacion ARgentina', 'Localizacion ARgentina desarrollada por OPENBIZ', 'Localizacion ARgentina incluye las modificaciones necesarias para calculo de impuestos, retenciones , generacion y validacion del digito verificador del CUIT.
Desarrollado por OPENBIZ (http://www.openbiz.com.ar)', NULL, 'org.openbiz.model', NULL, 'N');

UPDATE adempiere.AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=1268;  --  AD_EntityType
--

-- Inserta Model Validator (LAR_Validator)
INSERT INTO adempiere.AD_ModelValidator(ad_client_id, ad_modelvalidator_id, ad_org_id, created, createdby, updated, updatedby, isactive, name, description, help, entitytype, modelvalidationclass, seqno)
  VALUES(0, 
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=53012),  -- AD_ModelValidator_ID
0, '2010-09-06 12:38:16.0', 100, '2010-09-06', 100, 'Y', 'Model Validator para Localizacion ARgentina', NULL, NULL, 'OPB_LAR', 'org.openbiz.model.LAR_Validator', 0);
UPDATE adempiere.AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=53012;  --  AD_ModelValidator
--

