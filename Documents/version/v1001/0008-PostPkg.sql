--Actualizamos secuencia de LAR_PaymentHeader
UPDATE ad_sequence
	SET currentnext=(SELECT max(lar_paymentheader_id) FROM lar_paymentheader)+1 
WHERE name ='LAR_PaymentHeader'
;
--Seteamos la columna LAR_PaymentHeader.C_BPartner_ID como obligatoria en el diccionario
UPDATE AD_Column
    SET isMandatory = 'Y'
WHERE
    AD_Table_ID=(SELECT AD_Table_ID FROM ad_table WHERE name='LAR_PaymentHeader')
    AND ColumnName = 'C_BPartner_ID'
;

-- Seteamos lógica de solo lectura a null para los campos:
-- Factura, Orden de Venta, Cargo, Total Descuento, Total Ajuste, Sobre/Sub Pago, total Sobre/Sub Pago

--C_Invoice_ID
--C_Order_ID
--C_Charge_ID
--DiscountAmt
--WriteOffAmt
--IsOverUnderPayment
--OverUnderAmt

UPDATE ad_column
    set readonlylogic = ''
WHERE
    AD_Table_ID=335 --C_Payment
    AND ColumnName IN 
    (
	    'C_Invoice_ID',
		'C_Order_ID',
		'C_Charge_ID',
		'DiscountAmt',
		'WriteOffAmt',
		'IsOverUnderPayment',
		'OverUnderAmt'
	)

;