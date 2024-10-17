

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




Luego se cambio el formato de la columna ´date'  al formato de fecha correspondiente utilizando la funcion STR_TO_DATE() dado que se encuentra en formato texto


![Descripción de la imagen](https://github.com/jdcarmonac07/DatacleaningMYSQL/blob/master/imagenes/Imagen7.png)





##### Tratamiento de Valores nulos o en blanco 

Para manejar los valores vacíos en el dataset como los valores nulos, se utilizó un self join para poblar registros con información disponible de otras filas. 
Este enfoque permitió completar datos faltantes, en este caso se completaron los registros de la columna 'industry' entendiendose que registros donde se tenga la misma compañia y la misma ubicación 
logicamente van a pertenecer al mismo tipo de industria

![Descripción de la imagen](https://github.com/jdcarmonac07/DatacleaningMYSQL/blob/master/imagenes/Imagen9.png)

En las columnas 'total_laid_off' y 'percentage_laid_off' si bien no es totalmente adecuado eliminar registros, para efectos del posterior Analisis que se le realizara al dataset,
se eliminaron los registros en los cuales tanto en la columna  'total_laid_off' como para 'percentage_laid_off' se muestran valores nulos o vacios, 
ya que son datos no relevantes para el posterior analisis. Adicional a esto, para los registros en los cuales se encontraban valores en la columna 'total_laid_off' pero no para la columna 'percentage_laid_off'
o viceversa no se encontro maera de poblarlos ya que no se cuenta con una columna que informe el total de empleados antes de. Adicional a esto se elimin la columna row_num ya que esta se utilizo solamente  con el objetivo de identificar elementos duplicados


##  Resultado final 

![Uploading image.png…](https://github.com/jdcarmonac07/DatacleaningMYSQL/blob/master/imagenes/Imagen10.png)


## Archivos del proyecto

layoff_cleaned.csv: Archivo CSV después del proceso de limpieza.

layoffs.csv: Archivo original.

layoffcleaned.sql:  Query en el cual se puede visualizar el código utilizado para la limpieza

README.md: En este archivo se puede encontrar la descripcion del proyecto.
