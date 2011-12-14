-- Inserta información sobre la versión del módulo
INSERT INTO
    ob_dbversion
VALUES
(
    (SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=(SELECT ad_sequence_id FROM ad_sequence WHERE name='OB_DBVersion')),
    'LAR',
    '1.0.0.2',
    0,
    0,
    0,
    now(),
    0,
    now(),
    'Y'
)
;

UPDATE adempiere.AD_Sequence SET 
    CurrentNext = CurrentNext + 1 
WHERE 
    AD_Sequence_ID=(SELECT ad_sequence_id FROM ad_sequence WHERE name='OB_DBVersion')

;