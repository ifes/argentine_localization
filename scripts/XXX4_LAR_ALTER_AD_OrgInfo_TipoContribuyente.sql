/* Agrega Columna Tipo Contribuyente a AD_OrgInfo
Author: ACF - OPENBIZ
Fecha: 08/10/2010
*/

ALTER TABLE AD_OrgInfo
 ADD COLUMN LAR_TipoContribuyente_ID numeric(10)
;

ALTER TABLE AD_OrgInfo 
 ADD CONSTRAINT LAR_OrgInfo_tipocontribuyente FOREIGN KEY (LAR_TipoContribuyente_ID)
      REFERENCES LAR_TipoContribuyente (LAR_TipoContribuyente_ID) DEFERRABLE INITIALLY DEFERRED
;