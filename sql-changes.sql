-- 01/10/2016
-- ALTER TABLE avion ADD avion_order INT DEFAULT NULL;
ALTER TABLE avion ADD fecha_fuera_servicio_hasta DATE DEFAULT NULL;
ALTER TABLE avion DROP fecha_fuera_servicio, DROP fecha_fuera_servicio_hasta, CHANGE desde_fuera_servicio desde_fuera_servicio DATETIME DEFAULT NULL, CHANGE hasta_fuera_servicio hasta_fuera_servicio DATETIME DEFAULT NULL;