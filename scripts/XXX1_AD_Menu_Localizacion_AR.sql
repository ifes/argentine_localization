-- Inserta Carpeta para Almacenar Localizacion ARgentina en Menu
INSERT INTO adempiere.AD_Menu(ad_menu_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, name, updatedby, description, issummary, issotrx, isreadonly, action, ad_window_id, ad_workflow_id, ad_task_id, ad_process_id, ad_form_id, ad_workbench_id, entitytype, iscentrallymaintained)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=7),  -- AD_Menu_ID
 0, 0, 'Y', '2010-08-24 23:33:55.0', 100, '2010-08-24 23:33:55.0', 'Localizacion ARgentina', 100, 'Localizacion para ARgentina', 'Y', 'N', 'N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'OPB_LAR', 'Y');

INSERT INTO adempiere.AD_Menu_Trl(ad_menu_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, istranslated)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=7),  -- AD_Menu_ID
 'es_AR', 0, 0, 'Y', '2010-08-24 23:33:55.0', 100, '2010-08-24 23:33:55.0', 100, 'Localizacion ARgentina', 'Localizacion para ARgentina', 'N');


INSERT INTO adempiere.AD_TreeNodeMM(ad_tree_id, node_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, parent_id, seqno)
  VALUES(10, 
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=7),  -- AD_Menu_ID
0, 0, 'Y', '2010-08-24 23:33:55.765691', 100, '2010-08-24 23:33:55.765691', 100, 0, 999);

UPDATE adempiere.AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=7;  -- AD_Menu
--

