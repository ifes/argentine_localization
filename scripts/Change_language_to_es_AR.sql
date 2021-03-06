/*
* Este script reemplaza el lenguaje es_MX por es_AR y lo establece como lenguaje por defecto
* Autor: OPENBIZ - http://openbiz.com.ar - info@openbiz.com.ar
*/

UPDATE AD_CLIENT SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
UPDATE AD_COLUMN_TRL SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
UPDATE AD_DESKTOP_TRL SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
UPDATE AD_ELEMENT_TRL SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
UPDATE AD_ERROR SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
UPDATE AD_FIELD_TRL SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
UPDATE AD_FIELDGROUP_TRL SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
UPDATE AD_FORM_TRL SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
UPDATE AD_INFOCOLUMN_TRL SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
UPDATE AD_INFOWINDOW_TRL SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
UPDATE AD_LANGUAGE SET issystemlanguage = 'N' WHERE AD_LANGUAGE='es_MX';
UPDATE AD_LANGUAGE SET issystemlanguage = 'Y' WHERE AD_LANGUAGE='es_AR';
UPDATE AD_MENU_TRL SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
UPDATE AD_MESSAGE_TRL SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
UPDATE AD_PRINTFORMATITEM_TRL SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
UPDATE AD_PRINTLABELLINE_TRL SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
UPDATE AD_PROCESS_PARA_TRL SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
UPDATE AD_PROCESS_TRL SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
UPDATE AD_REF_LIST_TRL SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
UPDATE AD_REFERENCE_TRL SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
UPDATE AD_TAB_TRL SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
UPDATE AD_TABLE_TRL SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
UPDATE AD_TASK_TRL SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
UPDATE AD_USERDEF_WIN SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
UPDATE AD_WF_NODE_TRL SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
UPDATE AD_WINDOW_TRL SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
UPDATE AD_WORKBENCH_TRL SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
UPDATE AD_WORKFLOW_TRL SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
UPDATE C_BPARTNER SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';

-- IMPORTANTE: No correr este Update en version 3.4.2s o anteriores
-- La tabla C_Charge_Trl se agrego en versiones posteriores (17-04-2009)
UPDATE C_CHARGE_TRL SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
--

UPDATE C_COUNTRY_TRL SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
UPDATE C_CURRENCY_TRL SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
UPDATE C_DOCTYPE_TRL SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
UPDATE C_DUNNINGLEVEL_TRL SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
UPDATE C_ELEMENTVALUE_TRL SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
UPDATE C_GREETING_TRL SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
UPDATE C_PAYMENTTERM_TRL SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
UPDATE C_TAX_TRL SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
UPDATE C_TAXCATEGORY_TRL SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
UPDATE C_UOM_TRL SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
UPDATE CM_CONTAINER_ELEMENT_TRL SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
UPDATE CM_CONTAINER_TRL SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
UPDATE CM_CSTAGE_ELEMENT_TRL SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
UPDATE CM_CSTAGE_TRL SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
UPDATE CM_NEWSCHANNEL SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
UPDATE K_SYNONYM SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
UPDATE M_PRODUCT_TRL SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';

-- IMPORTANTE: No correr estos Updates en version 3.4.2s o anteriores
-- Las Tablas con prefijo PP fuerona agregadas para modulo de Fabricacion
UPDATE PP_ORDER_BOM_TRL SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
UPDATE PP_ORDER_BOMLINE_TRL SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
UPDATE PP_ORDER_NODE_TRL SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
UPDATE PP_ORDER_WORKFLOW_TRL SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
UPDATE PP_PRODUCT_BOM_TRL SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
UPDATE PP_PRODUCT_BOMLINE_TRL SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
--

UPDATE R_MAILTEXT_TRL SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
UPDATE W_MAILMSG_TRL SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
UPDATE W_STORE_TRL SET AD_LANGUAGE='es_AR' WHERE AD_LANGUAGE='es_MX';
