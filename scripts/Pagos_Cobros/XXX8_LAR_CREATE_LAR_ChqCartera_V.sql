--DROP view LAR_ChqCartera_V;

CREATE OR REPLACE VIEW LAR_ChqCartera_V
AS

SELECT p.AD_Client_ID,
       p.AD_Org_ID,
       p.IsActive,
       p.Created,
       p.CreatedBy,
       p.Updated,
       p.UpdatedBy,
       p.C_Payment_ID,
       (SELECT b.Name || ' ' || ba.AccountNo FROM C_Bank b, C_BankAccount ba WHERE b.C_Bank_ID=ba.C_Bank_ID AND ba.C_BankAccount_ID=p.C_BankAccount_ID) AS NameBanco,
       (SELECT Name FROM C_BPartner bp WHERE bp.C_BPartner_ID=p.C_BPartner_ID) AS NameBPartner,
       p.DateTrx, p.DocumentNo, p.IsReceipt,
       (SELECT ISO_Code FROM C_Currency c WHERE c.C_Currency_ID=p.C_Currency_ID) as ISO_Code,
       p.PayAmt, currencyBase(p.PayAmt,p.C_Currency_ID,p.DateTrx, p.AD_Client_ID,p.AD_Org_ID),
       p.checkno,
       p.routingno,
       cp.DateChqEmision,
       cp.DateChqCobro,
       p.accountno,
       p.A_Name
FROM C_Payment_v p
INNER JOIN C_Payment cp ON (cp.C_Payment_ID=p.C_Payment_ID)
WHERE p.IsActive='Y' AND p.isReceipt='Y' AND p.Docstatus IN ('CO','CL') AND p.TenderType IN ('K')
  AND p.C_Payment_ID NOT IN (SELECT distinct(REC.c_payment_id)
                             FROM c_payment PAY
                       INNER JOIN c_payment AS REC ON REC.c_payment_id = PAY.lar_paymentsource_id
                              AND REC.Processed='Y'
                              AND REC.isReceipt='Y'
                              AND PAY.docstatus NOT IN('IN', 'RE', 'VO')
                          )
  AND p.IsReceipt='Y'
ORDER BY 1,2,8,9,10
;

