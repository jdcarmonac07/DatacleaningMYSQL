

# LIMPIEZA DE DATOS PARA POSTERIOR PROYECTO EDA  


<div style="margin-bottom: 20px;"></div>


## Descripcion del proyecto
Este proyecto se centra en la limpieza de un dataset que contiene información sobre despidos en diferentes empresas. El objetivo fue mejorar la calidad de los datos para que puedan ser utilizados en futuros análisis. Se aplicaron técnicas de data cleaning para organizar, corregir y normalizar el dataset,
reduciendo errores, manejando valores faltantes, y asegurando que los datos sean más consistentes y aptos para el análisis posterior

## Etapas de preparación y limpieza de los datos


el dataset contiene datos como, compañía, ubicación, industria a la que pertenece la empresa, total de personas despedidas, porcentaje de despedidos, fecha y demás.
Visualizandose de la siguiente manera.

![Descripción de la imagen](https://github.com/jdcarmonac07/DatacleaningMYSQL/blob/master/imagenes/Imagen1.png)





#### Tratamiento de valores duplicados

Se identificaron y eliminaron registros duplicados, Utilicé la función ROW_NUMBER() con PARTITION BY en SQL para identificar filas duplicadas y las eliminé empleando un CTE.
Esto ayuda a evitar sesgos en el análisis y garantiza que los datos sean únicos y representativos.


![Descripción de la imagen](https://github.com/jdcarmonac07/DatacleaningMYSQL/blob/master/imagenes/Imagen2.png)

Donde se eliminan las filas donde row_number > 1

![Descripción de la imagen](https://github.com/jdcarmonac07/DatacleaningMYSQL/blob/master/imagenes/Imagen4.png)


##### Normalizacion de datos:

Se estandarizaron nombres de empresas y sectores que tenían variaciones (por ejemplo, "Microsoft" y "microsoft" o "Crypto currency" y "currency").
Se usaron funciones  como UPPER(), LOWER(), TRIM(), y LIKE.  Se pueden ver ejemplos.


![Descripción de la imagen](https://github.com/jdcarmonac07/DatacleaningMYSQL/blob/master/imagenes/Imagen5.png)




Luego se cambio el formato de la columna ´date'  al formato de fecha correspondiente utilizando la funcion STR_TO_DATE()


![Descripción de la imagen](https://github.com/jdcarmonac07/DatacleaningMYSQL/blob/master/imagenes/Imagen7.png)

![Descripción de la imagen](https://github.com/jdcarmonac07/DatacleaningMYSQL/blob/master/imagenes/Imagen8.png)


##### Eliminación de Filas con Valores Faltantes:

Se eliminaron filas con valores críticos faltantes, como el nombre de la empresa o el porcentaje de despidos.

##### Corrección de Tipos de Datos:

Se transformaron las columnas para asegurar que los datos estuvieran en el formato correcto (e.g., la columna Fecha se convirtió al tipo datetime).




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
