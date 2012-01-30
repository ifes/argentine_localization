/***
* Add Field TargetEntityType_ID in Package Detail tab into PackOut window.
* In this field the user can select one Entity Type to export.
***/

-- ALTER TABLE

ALTER TABLE AD_Package_Exp_Detail
 ADD COLUMN TargetEntityType_ID numeric(10);

-- Insert Reference
INSERT INTO AD_Reference(ad_reference_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, validationtype, vformat, entitytype, isorderbyvalue)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=14),  -- AD_Reference_ID
0, 0, 'Y', '2010-09-24 12:45:04.0', 100, '2010-09-24 12:45:04.0', 100, 'EntityTypeID', NULL, NULL, 'T', NULL, 'U', 'N');

INSERT INTO AD_Ref_Table(ad_reference_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, ad_table_id, ad_key, ad_display, isvaluedisplayed, whereclause, orderbyclause, entitytype, ad_window_id)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=14),  -- AD_Reference_ID
0, 0, 'Y', '2010-09-24 12:45:04.523898', 0, '2010-09-24 12:45:04.523898', 0, 882, 15595, 15601, 'N', '', '', 'U', NULL);
--

-- Insert TargetEntityType_ID into AD_Element
INSERT INTO AD_Element(ad_element_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, columnname, entitytype, name, printname, description, help, po_name, po_printname, po_description, po_help)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=188),  --  AD_Element_ID
0, 0, 'Y', '2010-09-24 12:45:04.0', 100, '2010-09-24 12:45:04.0', 100, 'TargetEntityType_ID', 'U', 'TargetEntityType_ID', 'TargetEntityType_ID', 'Dictionary Entity Type; Determines ownership and synchronization', 'The Entity Types "Dictionary", "Adempiere" and "Application" might be automatically synchronized and customizations deleted or overwritten.  

For customizations, copy the entity and select "User"!', NULL, NULL, NULL, NULL);

-- AD_Element_TRL
INSERT INTO AD_Element_TRL(ad_element_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, printname, description, help, po_name, po_printname, po_description, po_help, istranslated)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=188),  --  AD_Element_ID
'es_AR', 0, 0, 'Y', '2010-09-24 12:45:04.0', 100, '2010-09-24 13:20:47.552', 100, 'Tipo de Entidad', 'Tipo de Entidad', 'Tipo de Entidad Diccionario; determina propiedad y sincronización', 'Los tipos de entidad "Diccionario"; "Adempiere"; y "Aplicación" podrían ser automáticamente sincronizados y las personalizaciones eliminadas ó sobreescritas', NULL, NULL, NULL, NULL, 'N');
--

-- Insert TargetEntityType_ID column into AD_Column for AD_Package_Exp_Detail table
INSERT INTO AD_Column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
0, 0, 'Y', '2010-09-24 12:45:04.0', '2010-09-24 12:45:04.0', 100, 100, 'TargetEntityType_ID', 'Dictionary Entity Type; Determines ownership and synchronization', 'The Entity Types "Dictionary", "Adempiere" and "Application" might be automatically synchronized and customizations deleted or overwritten.  

For customizations, copy the entity and select "User"!', 0, 'U', 'TargetEntityType_ID', 50006, 18, 
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=14),  -- AD_Reference_ID
NULL, 40, NULL, 'N', 'N', 'N', 'Y', NULL, 'N', NULL, 'N', 'N', NULL, NULL, NULL, NULL, 'N', 
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=188),  --  AD_Element_ID
NULL, 'Y', 'N', NULL, NULL, NULL, 'N', 'Y', NULL);

-- AD_Column_TRL
INSERT INTO AD_Column_TRL(ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
'es_AR', 0, 0, 'Y', '2010-09-24 12:45:04.0', 100, '2010-09-24 12:45:04.0', 100, 'Tipo de Entidad', 'N');
--

-- AD_Field
INSERT INTO AD_Field(ad_field_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, iscentrallymaintained, ad_tab_id, ad_column_id, ad_fieldgroup_id, isdisplayed, displaylogic, displaylength, isreadonly, seqno, sortno, issameline, isheading, isfieldonly, isencrypted, entitytype, obscuretype, ad_reference_id, ismandatory, included_tab_id, defaultvalue, ad_reference_value_id, ad_val_rule_id, infofactoryclass)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=4),  --  AD_Field_ID
0, 0, 'Y', '2010-09-24 12:45:04.0', 100, '2010-09-24 12:45:04.0', 100, 'TargetEntityType_ID', 'Dictionary Entity Type; Determines ownership and synchronization', 'The Entity Types "Dictionary", "Adempiere" and "Application" might be automatically synchronized and customizations deleted or overwritten.  

For customizations, copy the entity and select "User"!', 'Y', 50006, 
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
NULL, 'Y', NULL, 40, 'N', 370, 0, 'N', 'N', 'N', 'N', 'U', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- AD_Field_TRL
INSERT INTO AD_Field_TRL(ad_field_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=4),  --  AD_Field_ID
'es_AR', 0, 0, 'Y', '2010-09-24 12:45:04.0', 100, '2010-09-24 13:21:48.601785', 100, 'Tipo de Entidad', 'Tipo de Entidad Diccionario; determina propiedad y sincronización', 'Los tipos de entidad "Diccionario"; "Adempiere"; y "Aplicación" podrían ser automáticamente sincronizados y las personalizaciones eliminadas ó sobreescritas', 'N');
--
-- UPDATES
UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=188;  -- AD_Element
UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=3;    -- AD_Column
UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=4;	-- AD_Field
UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=14;  -- AD_Reference

/***
* END Field TargetEntityType_ID in Package Detail tab into PackOut window.
***/

/***
*  Add new tab to include the tabs required by user
***/

CREATE TABLE AD_Package_Exp_Detail_Tab ( 
    AD_Package_Exp_Detail_Tab_ID	numeric(10,0) NOT NULL,
    AD_Client_ID            		numeric(10,0) NOT NULL,
    AD_Org_ID               		numeric(10,0) NOT NULL,
    IsActive                		char(1) NOT NULL DEFAULT 'Y'::bpchar,
    Created                 		timestamp NOT NULL DEFAULT now(),
    CreatedBy               		numeric NOT NULL,
    Updated                 		timestamp NOT NULL DEFAULT now(),
    UpdatedBy               		numeric NOT NULL,
    AD_Package_Exp_Detail_ID	        numeric(10,0) NOT NULL,
    Description             		varchar(1000) NOT NULL,
    Line                    		numeric NULL,
    AD_Window_ID                        numeric(10,0) NULL,
    AD_Tab_ID              		numeric(10,0) NULL,
    PRIMARY KEY(AD_Package_Exp_Detail_Tab_ID)
)
;
ALTER TABLE AD_Package_Exp_Detail_Tab
    ADD CONSTRAINT adtab_adpackageexpdetailtab
	FOREIGN KEY(AD_Tab_ID)
	REFERENCES AD_Tab(AD_Tab_ID),
    ADD CONSTRAINT adtab_adpackageexpdetailwnd
	FOREIGN KEY(AD_Window_ID)
	REFERENCES AD_Window(AD_Window_ID)
;




-- AD_Table
INSERT INTO AD_Table(ad_table_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, tablename, isview, accesslevel, entitytype, ad_window_id, ad_val_rule_id, loadseq, issecurityenabled, isdeleteable, ishighvolume, importtable, ischangelog, replicationtype, po_window_id, copycolumnsfromtable, iscentrallymaintained)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=21),  -- AD_Table_ID
 0, 0, 'Y', '2012-01-16 11:47:23.0', 100, '2012-01-27 14:13:38.0', 100, 'AD_Package_Exp_Detail_Tab', 'Tab to be exported', NULL, 'AD_Package_Exp_Detail_Tab', 'N', '4', 'U', NULL, NULL, 0, 'N', 'N', 'N', 'N', 'N', 'L', NULL, 'N', 'Y');

INSERT INTO AD_Table_TRL(ad_table_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=21),  -- AD_Table_ID
 'es_AR', 0, 0, 'Y', '2012-01-16 11:47:23.0', 100, '2012-01-27 14:13:51.612', 100, 'AD_Package_Exp_Detail_Tab', 'N');



-- AD_Tab
INSERT INTO AD_Tab(ad_tab_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, ad_table_id, ad_window_id, seqno, tablevel, issinglerow, isinfotab, istranslationtab, isreadonly, ad_column_id, hastree, whereclause, orderbyclause, commitwarning, ad_process_id, processing, ad_image_id, importfields, ad_columnsortorder_id, ad_columnsortyesno_id, issorttab, entitytype, included_tab_id, readonlylogic, displaylogic, isinsertrecord, isadvancedtab, parent_column_id)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=19),  --  AD_Tab_ID 
 0, 0, 'Y', '2012-01-16 11:49:41.0', 100, '2012-01-27 14:10:37.0', 100, 'Package Tabs', NULL, NULL, 
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=21),  -- AD_Table_ID
 50003, 30, 2, 'N', 'N', 'N', 'N', NULL, 'N', 'AD_Package_Exp_Detail_Tab.AD_Package_Exp_Detail_ID=@AD_Package_Exp_Detail_ID@ ', NULL, NULL, NULL, 'N', NULL, 'N', NULL, NULL, 'N', 'U', NULL, '@Type@!''W''', NULL, 'Y', 'N', 50100);

INSERT INTO AD_Tab_TRL(ad_tab_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, commitwarning, istranslated)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=19),  --  AD_Tab_ID 
'es_AR', 0, 0, 'Y', '2012-01-16 11:49:41.0', 100, '2012-01-16 11:49:41.0', 100, 'Package Tabs', NULL, NULL, NULL, 'N');


INSERT INTO AD_Column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
0, 0, 'Y', '2012-01-16 11:47:28.0', '2012-01-16 11:47:28.0', 100, 100, 'Client', 'Client/Tenant for this installation.', 'A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.', 0, 'U', 'AD_Client_ID', 
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=21),  -- AD_Table_ID
 19, NULL, NULL, 10, NULL, 'N', 'N', 'Y', 'N', NULL, 'N', NULL, 'N', 'N', NULL, NULL, NULL, NULL, 'N', 102, NULL, 'N', 'N', NULL, NULL, NULL, 'N', 'Y', NULL);

INSERT INTO AD_Column_TRL(ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
'es_AR', 0, 0, 'Y', '2012-01-16 11:47:28.0', 100, '2012-01-16 11:47:28.0', 100, 'Compañía', 'N');

INSERT INTO AD_Field(ad_field_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, iscentrallymaintained, ad_tab_id, ad_column_id, ad_fieldgroup_id, isdisplayed, displaylogic, displaylength, isreadonly, seqno, sortno, issameline, isheading, isfieldonly, isencrypted, entitytype, obscuretype, ad_reference_id, ismandatory, included_tab_id, defaultvalue, ad_reference_value_id, ad_val_rule_id, infofactoryclass)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=4),  --  AD_Field_ID
 0, 0, 'Y', '2012-01-16 11:49:48.0', 100, '2012-01-16 11:49:48.0', 100, 'Client', 'Client/Tenant for this installation.', 'A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.', 'Y', 
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=19),  --  AD_Tab_ID 
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
 NULL, 'Y', NULL, 10, 'N', 10, NULL, 'N', 'N', 'N', 'N', 'U', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO AD_Field_TRL(ad_field_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=4),  --  AD_Field_ID
 'es_AR', 0, 0, 'Y', '2012-01-16 11:49:48.0', 100, '2012-01-27 13:55:57.336285', 100, 'Compañía', 'Cliente para esta instalación', 'Compañía ó entidad legal', 'N');
UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=4;	-- AD_Field
UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=3;  -- AD_Column



INSERT INTO AD_Column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
0, 0, 'Y', '2012-01-16 11:47:28.0', '2012-01-16 11:47:28.0', 100, 100, 'Organization', 'Organizational entity within client', 'An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.', 0, 'U', 'AD_Org_ID', 
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=21),  -- AD_Table_ID
 19, NULL, NULL, 10, NULL, 'N', 'N', 'Y', 'N', NULL, 'N', NULL, 'N', 'N', NULL, NULL, NULL, NULL, 'N', 113, NULL, 'N', 'N', NULL, NULL, NULL, 'N', 'Y', NULL);

INSERT INTO AD_Column_TRL(ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
'es_AR', 0, 0, 'Y', '2012-01-16 11:47:28.0', 100, '2012-01-16 11:47:28.0', 100, 'Organización', 'N');

INSERT INTO AD_Field(ad_field_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, iscentrallymaintained, ad_tab_id, ad_column_id, ad_fieldgroup_id, isdisplayed, displaylogic, displaylength, isreadonly, seqno, sortno, issameline, isheading, isfieldonly, isencrypted, entitytype, obscuretype, ad_reference_id, ismandatory, included_tab_id, defaultvalue, ad_reference_value_id, ad_val_rule_id, infofactoryclass)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=4),  --  AD_Field_ID
 0, 0, 'Y', '2012-01-16 11:49:48.0', 100, '2012-01-16 11:50:24.0', 100, 'Organization', 'Organizational entity within client', 'An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.', 'Y', 
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=19),  --  AD_Tab_ID 
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
 NULL, 'Y', NULL, 10, 'N', 20, NULL, 'Y', 'N', 'N', 'N', 'U', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO AD_Field_TRL(ad_field_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=4),  --  AD_Field_ID
 'es_AR', 0, 0, 'Y', '2012-01-16 11:49:48.0', 100, '2012-01-27 13:55:57.336285', 100, 'Organización', 'Entidad organizacional dentro de la compañía', 'Una organización es una unidad de la compañía ó entidad legal - Ej. Tiendas y departamentos.', 'N');
UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=4;	-- AD_Field
UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=3;  -- AD_Column


INSERT INTO AD_Column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
 0, 0, 'Y', '2012-01-16 11:47:28.0', '2012-01-24 10:31:19.0', 100, 100, 'Package Exp. Detail', NULL, NULL, 0, 'U', 'AD_Package_Exp_Detail_ID',
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=21),  -- AD_Table_ID
 19, NULL, NULL, 10, '@AD_Package_Exp_Detail_ID@', 'N', 'N', 'Y', 'Y', NULL, 'N', NULL, 'N', 'N', NULL, NULL, NULL, NULL, 'N', 50023, NULL, 'N', 'N', NULL, NULL, NULL, 'N', 'Y', NULL);

INSERT INTO AD_Column_TRL(ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
 'es_AR', 0, 0, 'Y', '2012-01-16 11:47:28.0', 100, '2012-01-27 13:58:38.793', 100, 'Detalle del Paquete', 'N');

INSERT INTO AD_Field(ad_field_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, iscentrallymaintained, ad_tab_id, ad_column_id, ad_fieldgroup_id, isdisplayed, displaylogic, displaylength, isreadonly, seqno, sortno, issameline, isheading, isfieldonly, isencrypted, entitytype, obscuretype, ad_reference_id, ismandatory, included_tab_id, defaultvalue, ad_reference_value_id, ad_val_rule_id, infofactoryclass)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=4),  --  AD_Field_ID
 0, 0, 'Y', '2012-01-16 11:49:48.0', 100, '2012-01-24 10:31:24.0', 100, 'Package Exp. Detail', NULL, NULL, 'Y', 
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=19),  --  AD_Tab_ID 
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
 NULL, 'Y', NULL, 10, 'Y', 30, NULL, 'N', 'N', 'N', 'N', 'U', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO AD_Field_TRL(ad_field_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=4),  --  AD_Field_ID
 'es_AR', 0, 0, 'Y', '2012-01-16 11:49:48.0', 100, '2012-01-27 13:58:55.554', 100, 'Detalle del Paquete', NULL, NULL, 'N');
UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=4;	-- AD_Field
UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=3;  -- AD_Column



INSERT INTO AD_Column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
 0, 0, 'Y', '2012-01-16 11:47:28.0', '2012-01-25 14:03:52.0', 100, 100, 'Line No', 'Unique line for this document', 'Indicates the unique line for a document.  It will also control the display order of the lines within a document.', 0, 'U', 'Line', 
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=21),  -- AD_Table_ID
 11, NULL, NULL, 10, NULL, 'N', 'N', 'N', 'Y', NULL, 'N', NULL, 'N', 'N', NULL, NULL, NULL, NULL, 'N', 439, NULL, 'N', 'N', NULL, NULL, NULL, 'N', 'Y', NULL);

INSERT INTO AD_Column_TRL(ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
 'es_AR', 0, 0, 'Y', '2012-01-16 11:47:28.0', 100, '2012-01-16 11:47:28.0', 100, 'No. Línea', 'N');

INSERT INTO AD_Field(ad_field_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, iscentrallymaintained, ad_tab_id, ad_column_id, ad_fieldgroup_id, isdisplayed, displaylogic, displaylength, isreadonly, seqno, sortno, issameline, isheading, isfieldonly, isencrypted, entitytype, obscuretype, ad_reference_id, ismandatory, included_tab_id, defaultvalue, ad_reference_value_id, ad_val_rule_id, infofactoryclass)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=4),  --  AD_Field_ID
 0, 0, 'Y', '2012-01-16 11:49:48.0', 100, '2012-01-25 14:04:56.0', 100, 'Line No', 'Unique line for this document', 'Indicates the unique line for a document.  It will also control the display order of the lines within a document.', 'Y', 
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=19),  --  AD_Tab_ID 
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
 NULL, 'Y', NULL, 10, 'N', 40, NULL, 'N', 'N', 'N', 'N', 'U', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO AD_Field_TRL(ad_field_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=4),  --  AD_Field_ID
 'es_AR', 0, 0, 'Y', '2012-01-16 11:49:48.0', 100, '2012-01-27 13:55:57.336285', 100, 'No. Línea', 'No. Línea único para este documento', 'Indica el No. Línea para un documento. También controlará el orden de despliegue de las líneas dentro de un documento', 'Y');
UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=4;	-- AD_Field
UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=3;  -- AD_Column


INSERT INTO AD_Column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
 0, 0, 'Y', '2012-01-25 13:59:15.0', '2012-01-25 14:02:39.0', 100, 100, 'Window', 'Data entry or display window', 'The Window field identifies a unique Window in the system.', 0, 'U', 'AD_Window_ID', 
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=21),  -- AD_Table_ID
 19, NULL, NULL, 10, '@AD_Window_ID@', 'N', 'N', 'N', 'Y', NULL, 'N', NULL, 'N', 'N', NULL, NULL, NULL, NULL, 'N', 143, NULL, 'N', 'N', NULL, NULL, NULL, 'N', 'Y', NULL);

INSERT INTO AD_Column_TRL(ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
 'es_AR', 0, 0, 'Y', '2012-01-25 13:59:15.0', 100, '2012-01-25 13:59:15.0', 100, 'Ventana', 'N');

INSERT INTO AD_Field(ad_field_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, iscentrallymaintained, ad_tab_id, ad_column_id, ad_fieldgroup_id, isdisplayed, displaylogic, displaylength, isreadonly, seqno, sortno, issameline, isheading, isfieldonly, isencrypted, entitytype, obscuretype, ad_reference_id, ismandatory, included_tab_id, defaultvalue, ad_reference_value_id, ad_val_rule_id, infofactoryclass)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=4),  --  AD_Field_ID
 0, 0, 'Y', '2012-01-25 14:01:47.0', 100, '2012-01-27 13:59:58.0', 100, 'Window', 'Data entry or display window', 'The Window field identifies a unique Window in the system.', 'Y', 
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=19),  --  AD_Tab_ID 
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
 NULL, 'Y', NULL, 25, 'Y', 50, NULL, 'N', 'N', 'N', 'N', 'U', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO AD_Field_TRL(ad_field_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=4),  --  AD_Field_ID
 'es_AR', 0, 0, 'Y', '2012-01-25 14:01:47.0', 100, '2012-01-27 13:55:57.336285', 100, 'Ventana', 'Ventana de entrada de datos ó despliegue', 'El campo ventana identifica una ventana única en el sistema', 'Y');
UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=4;	-- AD_Field
UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=3;  -- AD_Column


INSERT INTO AD_Column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
 0, 0, 'Y', '2012-01-16 11:47:28.0', '2012-01-27 14:02:08.0', 100, 100, 'Tab', 'Tab within a Window', 'The Tab indicates a tab that displays within a window.', 0, 'U', 'AD_Tab_ID', 
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=21),  -- AD_Table_ID
 18, 278, 163, 10, NULL, 'N', 'N', 'N', 'Y', NULL, 'N', NULL, 'N', 'N', NULL, NULL, NULL, NULL, 'N', 125, NULL, 'N', 'N', NULL, '@AD_Window_ID@!0', NULL, 'N', 'Y', NULL);

INSERT INTO AD_Column_TRL(ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
 'es_AR', 0, 0, 'Y', '2012-01-16 11:47:28.0', 100, '2012-01-16 11:47:28.0', 100, 'Pestaña', 'N');

INSERT INTO AD_Field(ad_field_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, iscentrallymaintained, ad_tab_id, ad_column_id, ad_fieldgroup_id, isdisplayed, displaylogic, displaylength, isreadonly, seqno, sortno, issameline, isheading, isfieldonly, isencrypted, entitytype, obscuretype, ad_reference_id, ismandatory, included_tab_id, defaultvalue, ad_reference_value_id, ad_val_rule_id, infofactoryclass)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=4),  --  AD_Field_ID
 0, 0, 'Y', '2012-01-16 11:49:48.0', 100, '2012-01-27 14:00:32.0', 100, 'Tab', 'Tab within a Window', 'The Tab indicates a tab that displays within a window.', 'Y', 
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=19),  --  AD_Tab_ID 
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
 NULL, 'Y', NULL, 25, 'N', 60, NULL, 'Y', 'N', 'N', 'N', 'U', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO AD_Field_TRL(ad_field_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=4),  --  AD_Field_ID
 'es_AR', 0, 0, 'Y', '2012-01-16 11:49:48.0', 100, '2012-01-27 13:55:57.336285', 100, 'Pestaña', 'Pestaña dentro de una ventana.', 'La pestaña indica que se despliega dentro de una ventana', 'Y');
UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=4;	-- AD_Field
UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=3;  -- AD_Column



INSERT INTO AD_Column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
 0, 0, 'Y', '2012-01-16 11:47:28.0', '2012-01-16 11:47:28.0', 100, 100, 'Description', 'Optional short description of the record', 'A description is limited to 255 characters.', 0, 'U', 'Description', 
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=21),  -- AD_Table_ID
 14, NULL, NULL, 1000, NULL, 'N', 'N', 'Y', 'Y', NULL, 'N', NULL, 'N', 'N', NULL, NULL, NULL, NULL, 'N', 275, NULL, 'N', 'N', NULL, NULL, NULL, 'N', 'Y', NULL);

INSERT INTO AD_Column_TRL(ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
 'es_AR', 0, 0, 'Y', '2012-01-16 11:47:28.0', 100, '2012-01-16 11:47:28.0', 100, 'Descripción', 'N');

INSERT INTO AD_Field(ad_field_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, iscentrallymaintained, ad_tab_id, ad_column_id, ad_fieldgroup_id, isdisplayed, displaylogic, displaylength, isreadonly, seqno, sortno, issameline, isheading, isfieldonly, isencrypted, entitytype, obscuretype, ad_reference_id, ismandatory, included_tab_id, defaultvalue, ad_reference_value_id, ad_val_rule_id, infofactoryclass)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=4),  --  AD_Field_ID
 0, 0, 'Y', '2012-01-16 11:49:48.0', 100, '2012-01-27 14:47:01.0', 100, 'Description', 'Optional short description of the record', 'A description is limited to 255 characters.', 'Y', 
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=19),  --  AD_Tab_ID 
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
 NULL, 'Y', NULL, 1000, 'N', 80, NULL, 'N', 'N', 'N', 'N', 'U', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO AD_Field_TRL(ad_field_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=4),  --  AD_Field_ID
 'es_AR', 0, 0, 'Y', '2012-01-16 11:49:48.0', 100, '2012-01-27 13:55:57.336285', 100, 'Descripción', 'Descripción corta opcional del registro', 'Una descripción esta limitada a 255 caracteres', 'N');
UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=4;	-- AD_Field
UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=3;  -- AD_Column



INSERT INTO AD_Column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
 0, 0, 'Y', '2012-01-16 11:47:28.0', '2012-01-16 11:47:28.0', 100, 100, 'Active', 'The record is active in the system', 'There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.', 0, 'U', 'IsActive', 
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=21),  -- AD_Table_ID
 20, NULL, NULL, 1, NULL, 'N', 'N', 'Y', 'Y', NULL, 'N', NULL, 'N', 'N', NULL, NULL, NULL, NULL, 'N', 348, NULL, 'N', 'N', NULL, NULL, NULL, 'N', 'Y', NULL);

INSERT INTO AD_Column_TRL(ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
 'es_AR', 0, 0, 'Y', '2012-01-16 11:47:28.0', 100, '2012-01-16 11:47:28.0', 100, 'Activo', 'N');

INSERT INTO AD_Field(ad_field_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, iscentrallymaintained, ad_tab_id, ad_column_id, ad_fieldgroup_id, isdisplayed, displaylogic, displaylength, isreadonly, seqno, sortno, issameline, isheading, isfieldonly, isencrypted, entitytype, obscuretype, ad_reference_id, ismandatory, included_tab_id, defaultvalue, ad_reference_value_id, ad_val_rule_id, infofactoryclass)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=4),  --  AD_Field_ID
 0, 0, 'Y', '2012-01-16 11:49:48.0', 100, '2012-01-16 11:49:48.0', 100, 'Active', 'The record is active in the system', 'There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.', 'Y', 
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=19),  --  AD_Tab_ID 
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
 NULL, 'Y', NULL, 1, 'N', 90, NULL, 'N', 'N', 'N', 'N', 'U', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO AD_Field_TRL(ad_field_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=4),  --  AD_Field_ID
 'es_AR', 0, 0, 'Y', '2012-01-16 11:49:48.0', 100, '2012-01-27 13:55:57.336285', 100, 'Activo', 'El registro está activo en el sistema', 'Hay dos métodos para que los registros no estén disponibles en el sistema: Uno es eliminar el registro; el otro es desactivarlo. Un registro desactivado no está disponible para selección; pero está disponible para Informes', 'N');
UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=4;	-- AD_Field
UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=3;  -- AD_Column



-- AD_Element
INSERT INTO AD_Element(ad_element_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, columnname, entitytype, name, printname, description, help, po_name, po_printname, po_description, po_help)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=188),  --  AD_Element_ID
 0, 0, 'Y', '2012-01-16 11:46:44.0', 100, '2012-01-27 14:38:17.0', 100, 'AD_Package_Exp_Detail_Tab_ID', 'U', 'AD_Package_Exp_Detail_Tab_ID', 'AD_Package_Exp_Detail_Tab_ID', 'Tab to be exported', NULL, NULL, NULL, NULL, NULL);

INSERT INTO AD_Element_TRL(ad_element_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, printname, description, help, po_name, po_printname, po_description, po_help, istranslated)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=188),  --  AD_Element_ID
 'es_AR', 0, 0, 'Y', '2012-01-16 11:46:44.0', 100, '2012-01-16 11:46:44.0', 100, 'AD_Package_Exp_Detail_Tab_ID', 'AD_Package_Exp_Detail_Tab_ID', 'Tab to be exported', NULL, NULL, NULL, NULL, NULL, 'N');

INSERT INTO AD_Column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
 0, 0, 'Y', '2012-01-16 11:47:27.0', '2012-01-16 11:47:27.0', 100, 100, 'AD_Package_Exp_Detail_Tab_ID', 'Tab to be exported', NULL, 0, 'U', 'AD_Package_Exp_Detail_Tab_ID', 
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=21),  -- AD_Table_ID
 13, NULL, NULL, 10, NULL, 'Y', 'N', 'Y', 'N', NULL, 'N', NULL, 'N', 'N', NULL, NULL, NULL, NULL, 'N', 
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=188),  --  AD_Element_ID
 NULL, 'N', 'N', NULL, NULL, NULL, 'N', 'Y', NULL);

INSERT INTO AD_Column_TRL(ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
 'es_AR', 0, 0, 'Y', '2012-01-16 11:47:27.0', 100, '2012-01-16 11:47:27.0', 100, 'AD_Package_Exp_Detail_Tab_ID', 'N');

INSERT INTO AD_Field(ad_field_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, iscentrallymaintained, ad_tab_id, ad_column_id, ad_fieldgroup_id, isdisplayed, displaylogic, displaylength, isreadonly, seqno, sortno, issameline, isheading, isfieldonly, isencrypted, entitytype, obscuretype, ad_reference_id, ismandatory, included_tab_id, defaultvalue, ad_reference_value_id, ad_val_rule_id, infofactoryclass)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=4),  --  AD_Field_ID
 0, 0, 'Y', '2012-01-16 11:49:48.0', 100, '2012-01-16 11:49:48.0', 100, 'AD_Package_Exp_Detail_Tab_ID', 'Tab to be exported', NULL, 'Y', 
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=19),  --  AD_Tab_ID 
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
 NULL, 'N', NULL, 10, 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'U', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO AD_Field_TRL(ad_field_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=4),  --  AD_Field_ID
 'es_AR', 0, 0, 'Y', '2012-01-16 11:49:48.0', 100, '2012-01-16 11:49:48.0', 100, 'AD_Package_Exp_Detail_Tab_ID', 'Tab to be exported', NULL, 'N');
UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=4;	-- AD_Field
UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=188;  -- AD_Element
UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=3;    -- AD_Column


INSERT INTO AD_Column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
 0, 0, 'Y', '2012-01-16 11:47:28.0', '2012-01-16 11:47:28.0', 100, 100, 'Created', 'Date this record was created', 'The Created field indicates the date that this record was created.', 0, 'U', 'Created', 
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=21),  -- AD_Table_ID
 16, NULL, NULL, 29, NULL, 'N', 'N', 'Y', 'N', NULL, 'N', NULL, 'N', 'N', NULL, NULL, NULL, NULL, 'N', 245, NULL, 'N', 'N', NULL, NULL, NULL, 'N', 'Y', NULL);

INSERT INTO AD_Column_TRL(ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
 'es_AR', 0, 0, 'Y', '2012-01-16 11:47:28.0', 100, '2012-01-16 11:47:28.0', 100, 'Creado', 'N');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=3;  -- AD_Column


INSERT INTO AD_Column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
 0, 0, 'Y', '2012-01-16 11:47:28.0', '2012-01-16 11:47:28.0', 100, 100, 'Created By', 'User who created this records', 'The Created By field indicates the user who created this record.', 0, 'U', 'CreatedBy', 
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=21),  -- AD_Table_ID
 18, 110, NULL, 22, NULL, 'N', 'N', 'Y', 'N', NULL, 'N', NULL, 'N', 'N', NULL, NULL, NULL, NULL, 'N', 246, NULL, 'N', 'N', NULL, NULL, NULL, 'N', 'Y', NULL);

INSERT INTO AD_Column_TRL(ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
 'es_AR', 0, 0, 'Y', '2012-01-16 11:47:28.0', 100, '2012-01-16 11:47:28.0', 100, 'Creado Por', 'N');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=3;  -- AD_Column


INSERT INTO AD_Column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
 0, 0, 'Y', '2012-01-16 11:47:28.0', '2012-01-16 11:47:28.0', 100, 100, 'Updated', 'Date this record was updated', 'The Updated field indicates the date that this record was updated.', 0, 'U', 'Updated', 
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=21),  -- AD_Table_ID
 16, NULL, NULL, 29, NULL, 'N', 'N', 'Y', 'N', NULL, 'N', NULL, 'N', 'N', NULL, NULL, NULL, NULL, 'N', 607, NULL, 'N', 'N', NULL, NULL, NULL, 'N', 'Y', NULL);

INSERT INTO AD_Column_TRL(ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
 'es_AR', 0, 0, 'Y', '2012-01-16 11:47:28.0', 100, '2012-01-16 11:47:28.0', 100, 'Actualizado', 'N');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=3;  -- AD_Column


INSERT INTO AD_Column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
 0, 0, 'Y', '2012-01-16 11:47:28.0', '2012-01-16 11:47:28.0', 100, 100, 'Updated By', 'User who updated this records', 'The Updated By field indicates the user who updated this record.', 0, 'U', 'UpdatedBy', 
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=21),  -- AD_Table_ID
 18, 110, NULL, 22, NULL, 'N', 'N', 'Y', 'N', NULL, 'N', NULL, 'N', 'N', NULL, NULL, NULL, NULL, 'N', 608, NULL, 'N', 'N', NULL, NULL, NULL, 'N', 'Y', NULL);

INSERT INTO AD_Column_TRL(ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
 'es_AR', 0, 0, 'Y', '2012-01-16 11:47:28.0', 100, '2012-01-16 11:47:28.0', 100, 'Actualizado por', 'N');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=3;  -- AD_Column
UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=21;  --  AD_Table
UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=19;  -- AD_Tab


/***
*  END new tab to include the tabs required by user
***/



