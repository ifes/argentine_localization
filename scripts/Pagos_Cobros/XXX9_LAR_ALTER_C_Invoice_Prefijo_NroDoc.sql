--Agega columnas para que el usuario ingrese el Prefijo y Nro. de Factura

ALTER TABLE C_Invoice
  ADD COLUMN LAR_Prefijo numeric(4),
  ADD COLUMN LAR_NroDoc  numeric(8)
;
 
