

# LIMPIEZA DE DATOS PARA POSTERIOR PROYECTO EDA  


<div style="margin-bottom: 20px;"></div>


## Descripcion del proyecto
Este proyecto se centra en la limpieza de un dataset que contiene información sobre despidos en diferentes empresas. El objetivo fue mejorar la calidad de los datos para que puedan ser utilizados en futuros análisis. Se aplicaron técnicas de data cleaning para organizar, corregir y normalizar el dataset,
reduciendo errores, manejando valores faltantes, y asegurando que los datos sean más consistentes y aptos para el análisis posterior

## Etapas de preparación y limpieza de los datos

##### Tratamiento de valores duplicados

Se identificaron y eliminaron registros duplicados para asegurar que registro aparezca una sola vez en el dataset. 
Esto ayuda a evitar sesgos en el análisis y garantiza que los datos sean únicos y representativos.


##### Eliminación de Filas con Valores Faltantes:

Se eliminaron filas con valores críticos faltantes, como el nombre de la empresa o el porcentaje de despidos.

##### Corrección de Tipos de Datos:

Se transformaron las columnas para asegurar que los datos estuvieran en el formato correcto (e.g., la columna Fecha se convirtió al tipo datetime).


##### Corrección de Errores Tipográficos:

Se estandarizaron nombres de empresas y sectores que tenían variaciones (por ejemplo, "Microsoft" y "microsoft").

##### Normalización de Datos:

Se aseguraron valores coherentes en las columnas de porcentaje y sector, eliminando outliers o transformando valores atípicos para que sean más consistentes.
Relleno de Valores Faltantes en Columnas Menos Críticas:


##### Tratamiento de Valores Vacíos
Para manejar los valores vacíos en el dataset, se utilizó un self join para poblar registros con información disponible de otras filas. 
Este enfoque permitió completar datos faltantes 

## Archivos del proyecto

layoff_cleaned.csv: Dataset después del proceso de limpieza.

layoffs.csv: Dataset original.

layoffcleaned.sql:  Query en el cual se puede visualizar el código utilizado para poder realizar la limpieza de los datos

README.md: En este archivo se puede encontrar la descripcion del proyecto.
