/* Agrega Columnas Tipo Contribuyente y Clase Documento a C_BPartner
Author: ACF - OPENBIZ
Fecha: 08/10/2010
*/

ALTER TABLE C_BPartner
 ADD COLUMN LAR_TipoContribuyente_ID numeric(10),
 ADD COLUMN LAR_ClaseDocumento_ID numeric(10)
;

ALTER TABLE C_BPartner 
 ADD CONSTRAINT LAR_BPartner_tipocontribuyente FOREIGN KEY (LAR_TipoContribuyente_ID)
      REFERENCES LAR_TipoContribuyente (LAR_TipoContribuyente_ID) DEFERRABLE INITIALLY DEFERRED,
 ADD CONSTRAINT LAR_BPartner_clasedocumento FOREIGN KEY (LAR_ClaseDocumento_ID)
      REFERENCES LAR_ClaseDocumento (LAR_ClaseDocumento_ID) DEFERRABLE INITIALLY DEFERRED
;