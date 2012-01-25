-- Inserta en AD_SysConfig valor para determinar si el documento del BPartner (CUIT, CUIL, DNI, etc) sera establecido en el campo Value. El default es N

INSERT INTO AD_SysConfig(ad_sysconfig_id, ad_client_id, ad_org_id, created, updated, createdby, updatedby, isactive, name, value, description, entitytype, configurationlevel)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=50009),
0, 0, '2010-10-08 13:01:44.0', '2010-10-08 14:11:24.0', 100, 100, 'Y', 'LAR_CUIT_AS_VALUE', 'N', 'Assign document number as BPartner Value ', 'OPB_LAR', 'C');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=50009;

