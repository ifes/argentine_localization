-- Agrega columnas para fechas de cheque (Fecha Emision del Cheque y Fecha para Presentar a Cobro)

ALTER TABLE C_Payment
  ADD COLUMN DateChqEmision timestamp;

-- AGREGA EN Diccionario ADempiere

-- AD_Element
INSERT INTO AD_Element(ad_element_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, columnname, entitytype, name, printname, description, help, po_name, po_printname, po_description, po_help)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=188),  --  AD_Element_ID
 0, 0, 'Y', '2011-01-11 14:20:51.0', 100, '2011-01-11 14:20:51.0', 100, 'DateChqEmision', 'OPB_LAR', 'Fecha Emision Chq.', 'Fecha Emision Chq.', 'Fecha de emision del cheque', 'Fecha de emision del cheque', NULL, NULL, NULL, NULL);

INSERT INTO AD_Element_TRL(ad_element_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, printname, description, help, po_name, po_printname, po_description, po_help, istranslated)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=188),  --  AD_Element_ID
 'es_AR', 0, 0, 'Y', '2011-01-11 14:20:51.0', 100, '2011-01-11 14:20:51.0', 100, 'Fecha Emision Chq.', 'Fecha Emision Chq.', 'Fecha de emision del cheque', 'Fecha de emision del cheque', NULL, NULL, NULL, NULL, 'N');

-- AD_Column
INSERT INTO AD_Column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
 0, 0, 'Y', '2011-01-11 14:35:38.0', '2011-01-12 11:26:01.0', 100, 100, 'Fecha Emision Chq.', 'Fecha de emision del cheque', 'Fecha de emision del cheque', 0, 'OPB_LAR', 'DateChqEmision', 335, 15, NULL, NULL, 7, NULL, 'N', 'N', 'N', 'Y', NULL, 'N', NULL, 'N', 'N', NULL, NULL, NULL, NULL, 'N', 
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=188),  --  AD_Element_ID
 NULL, 'N', 'N', NULL, NULL, NULL, 'N', 'Y', NULL);

INSERT INTO AD_Column_TRL(ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
 'es_AR', 0, 0, 'Y', '2011-01-11 14:35:38.0', 100, '2011-01-11 14:35:38.0', 100, 'Fecha Emision Chq.', 'N');


-- AD_Field en PAGOS
INSERT INTO AD_Field(ad_field_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, iscentrallymaintained, ad_tab_id, ad_column_id, ad_fieldgroup_id, isdisplayed, displaylogic, displaylength, isreadonly, seqno, sortno, issameline, isheading, isfieldonly, isencrypted, entitytype, obscuretype, ad_reference_id, ismandatory, included_tab_id, defaultvalue, ad_reference_value_id, ad_val_rule_id, infofactoryclass)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=4),  --  AD_Field_ID
 0, 0, 'Y', '2011-01-11 14:42:09.0', 100, '2011-01-11 14:45:50.0', 100, 'Fecha Emision Chq.', 'Fecha de emision del cheque', 'Fecha de emision del cheque', 'Y', 
(SELECT AD_Tab_ID FROM AD_Tab WHERE Name='Detalle' AND AD_Window_ID = (SELECT AD_Window_ID FROM AD_Window WHERE Upper(Name)= 'PAGOS')), -- AD_Tab_ID 
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
NULL, 'Y', '@TenderType@=K', 10, 'Y', 340, NULL, 'N', 'N', 'N', 'N', 'OPB_LAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO AD_Field_TRL(ad_field_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=4),  --  AD_Field_ID
 'es_AR', 0, 0, 'Y', '2011-01-11 14:42:09.0', 100, '2011-01-11 14:42:09.0', 100, 'Fecha Emision Chq.', 'Fecha de emision del cheque', 'Fecha de emision del cheque', 'N');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=4;	-- AD_Field


-- AD_Field en COBROS
INSERT INTO AD_Field(ad_field_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, iscentrallymaintained, ad_tab_id, ad_column_id, ad_fieldgroup_id, isdisplayed, displaylogic, displaylength, isreadonly, seqno, sortno, issameline, isheading, isfieldonly, isencrypted, entitytype, obscuretype, ad_reference_id, ismandatory, included_tab_id, defaultvalue, ad_reference_value_id, ad_val_rule_id, infofactoryclass)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=4),  --  AD_Field_ID
 0, 0, 'Y', '2011-01-11 14:55:20.0', 100, '2011-01-11 14:56:08.0', 100, 'Fecha Emision Chq.', 'Fecha de emision del cheque', 'Fecha de emision del cheque', 'Y', 
(SELECT AD_Tab_ID FROM AD_Tab WHERE Name='Detalle' AND AD_Window_ID = (SELECT AD_Window_ID FROM AD_Window WHERE Upper(Name)= 'COBROS')), -- AD_Tab_ID 
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
NULL, 'Y', '@TenderType@=K', 10, 'N', 340, NULL, 'N', 'N', 'N', 'N', 'OPB_LAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO AD_Field_TRL(ad_field_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=4),  --  AD_Field_ID
 'es_AR', 0, 0, 'Y', '2011-01-11 14:55:20.0', 100, '2011-01-11 14:55:20.0', 100, 'Fecha Emision Chq.', 'Fecha de emision del cheque', 'Fecha de emision del cheque', 'N');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=4;	-- AD_Field

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=3;  -- AD_Column
UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=188;  -- AD_Element

-- *******************************************************************************************************
ALTER TABLE C_Payment
  ADD COLUMN DateChqCobro timestamp;

INSERT INTO AD_Element(ad_element_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, columnname, entitytype, name, printname, description, help, po_name, po_printname, po_description, po_help)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=188),  --  AD_Element_ID
 0, 0, 'Y', '2011-01-11 14:21:46.0', 100, '2011-01-11 14:21:46.0', 100, 'DateChqCobro', 'OPB_LAR', 'Fecha Cobro Chq.', 'Fecha Cobro Chq.', 'Fecha de cobro del cheque', 'Fecha en la cual el cheque puede ser cobrado', NULL, NULL, NULL, NULL);

INSERT INTO AD_Element_TRL(ad_element_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, printname, description, help, po_name, po_printname, po_description, po_help, istranslated)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=188),  --  AD_Element_ID
 'es_AR', 0, 0, 'Y', '2011-01-11 14:21:46.0', 100, '2011-01-11 14:21:46.0', 100, 'Fecha Cobro Chq.', 'Fecha Cobro Chq.', 'Fecha de cobro del cheque', 'Fecha en la cual el cheque puede ser cobrado', NULL, NULL, NULL, NULL, 'N');


INSERT INTO AD_Column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
 0, 0, 'Y', '2011-01-11 14:35:38.0', '2011-01-12 11:25:52.0', 100, 100, 'Fecha Cobro Chq.', 'Fecha de cobro del cheque', 'Fecha en la cual el cheque puede ser cobrado', 0, 'OPB_LAR', 'DateChqCobro', 335, 15, NULL, NULL, 7, NULL, 'N', 'N', 'N', 'Y', NULL, 'N', NULL, 'N', 'N', NULL, NULL, NULL, NULL, 'N', 
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=188),  --  AD_Element_ID
 NULL, 'N', 'N', NULL, NULL, NULL, 'N', 'Y', NULL);

INSERT INTO AD_Column_TRL(ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
 'es_AR', 0, 0, 'Y', '2011-01-11 14:35:38.0', 100, '2011-01-11 14:35:38.0', 100, 'Fecha Cobro Chq.', 'N');

-- Ventana COBROS
INSERT INTO AD_Field(ad_field_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, iscentrallymaintained, ad_tab_id, ad_column_id, ad_fieldgroup_id, isdisplayed, displaylogic, displaylength, isreadonly, seqno, sortno, issameline, isheading, isfieldonly, isencrypted, entitytype, obscuretype, ad_reference_id, ismandatory, included_tab_id, defaultvalue, ad_reference_value_id, ad_val_rule_id, infofactoryclass)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=4),  --  AD_Field_ID
 0, 0, 'Y', '2011-01-11 14:55:20.0', 100, '2011-01-11 14:56:17.0', 100, 'Fecha Cobro Chq.', 'Fecha de cobro del cheque', 'Fecha en la cual el cheque puede ser cobrado', 'Y', 
(SELECT AD_Tab_ID FROM AD_Tab WHERE Name='Detalle' AND AD_Window_ID = (SELECT AD_Window_ID FROM AD_Window WHERE Upper(Name)= 'COBROS')), -- AD_Tab_ID 
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
NULL, 'Y', '@TenderType@=K', 10, 'N', 350, NULL, 'Y', 'N', 'N', 'N', 'OPB_LAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO AD_Field_TRL(ad_field_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=4),  --  AD_Field_ID
 'es_AR', 0, 0, 'Y', '2011-01-11 14:55:20.0', 100, '2011-01-11 14:55:20.0', 100, 'Fecha Cobro Chq.', 'Fecha de cobro del cheque', 'Fecha en la cual el cheque puede ser cobrado', 'N');
UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=4;	-- AD_Field


-- Ventana PAGOS
INSERT INTO AD_Field(ad_field_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, iscentrallymaintained, ad_tab_id, ad_column_id, ad_fieldgroup_id, isdisplayed, displaylogic, displaylength, isreadonly, seqno, sortno, issameline, isheading, isfieldonly, isencrypted, entitytype, obscuretype, ad_reference_id, ismandatory, included_tab_id, defaultvalue, ad_reference_value_id, ad_val_rule_id, infofactoryclass)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=4),  --  AD_Field_ID
 0, 0, 'Y', '2011-01-11 14:42:09.0', 100, '2011-01-11 14:45:55.0', 100, 'Fecha Cobro Chq.', 'Fecha de cobro del cheque', 'Fecha en la cual el cheque puede ser cobrado', 'Y', 
(SELECT AD_Tab_ID FROM AD_Tab WHERE Name='Detalle' AND AD_Window_ID = (SELECT AD_Window_ID FROM AD_Window WHERE Upper(Name)= 'PAGOS')), -- AD_Tab_ID 
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
NULL, 'Y', '@TenderType@=K', 10, 'Y', 350, NULL, 'Y', 'N', 'N', 'N', 'OPB_LAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO AD_Field_TRL(ad_field_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=4),  --  AD_Field_ID
 'es_AR', 0, 0, 'Y', '2011-01-11 14:42:09.0', 100, '2011-01-11 14:42:09.0', 100, 'Fecha Cobro Chq.', 'Fecha de cobro del cheque', 'Fecha en la cual el cheque puede ser cobrado', 'N');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=4;	-- AD_Field

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=3;  -- AD_Column
UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=188;  -- AD_Element



