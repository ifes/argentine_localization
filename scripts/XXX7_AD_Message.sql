-- Inserta Mensajes utilizados por entidad OPB_LAR
INSERT INTO AD_Message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9),  -- AD_Message
 0, 0, 'Y', '2010-10-08 10:54:57.0', 100, '2010-10-08 10:55:18.0', 100, 'LAR_CUITNotNumber', 'Invalid number', NULL, 'E', 'OPB_LAR');
INSERT INTO AD_Message_TRL(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9),  -- AD_Message
 'es_AR', 0, 0, 'Y', '2010-10-08 10:54:57.0', 100, '2010-10-08 11:19:18.745', 100, 'El documento debe ser un valor numérico', NULL, 'N');
UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;  -- AD_Message


INSERT INTO AD_Message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9),  -- AD_Message
 0, 0, 'Y', '2010-10-08 12:25:16.0', 100, '2010-10-08 12:25:16.0', 100, 'LAR_CUITDuplicated', 'Document number Duplicated', NULL, 'E', 'OPB_LAR');

INSERT INTO AD_Message_TRL(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9),  -- AD_Message
'es_AR', 0, 0, 'Y', '2010-10-08 12:25:16.0', 100, '2010-10-08 12:25:57.844', 100, 'El número de documento ya existe.', NULL, 'N');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;  -- AD_Message


INSERT INTO AD_Message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9),  -- AD_Message
 0, 0, 'Y', '2010-10-08 12:30:42.0', 100, '2010-10-08 12:30:42.0', 100, 'LAR_CUITLengthInvalid', 'Invalid Document Length', NULL, 'E', 'OPB_LAR');

INSERT INTO AD_Message_TRL(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9),  -- AD_Message
 'es_AR', 0, 0, 'Y', '2010-10-08 12:30:42.0', 100, '2010-10-08 12:31:16.321', 100, 'Longitud de CUIT/CUIL inválida.', NULL, 'N');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;  -- AD_Message


INSERT INTO AD_Message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9),  -- AD_Message
 0, 0, 'Y', '2010-10-08 12:38:19.0', 100, '2010-10-08 12:38:19.0', 100, 'LAR_CUITInvalidStart', 'El CUIT/CUIL comienza con un valor invalido:', NULL, 'E', 'OPB_LAR');

INSERT INTO AD_Message_TRL(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9),  -- AD_Message
 'es_AR', 0, 0, 'Y', '2010-10-08 12:45:15.0', 100, '2010-10-08 12:45:46.627', 100, 'Número de documento no válido.', NULL, 'N');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;  -- AD_Message


INSERT INTO AD_Message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9),  -- AD_Message
 0, 0, 'Y', '2010-10-08 12:45:15.0', 100, '2010-10-08 12:45:15.0', 100, 'LAR_CUITInvalid', 'Invalid document number', NULL, 'E', 'OPB_LAR');

INSERT INTO AD_Message_TRL(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
  VALUES(
(SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9),  -- AD_Message
 'es_AR', 0, 0, 'Y', '2010-10-08 12:38:19.0', 100, '2010-10-08 12:38:19.0', 100, 'El CUIT/CUIL comienza con un valor invalido:', NULL, 'N');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;  -- AD_Message


