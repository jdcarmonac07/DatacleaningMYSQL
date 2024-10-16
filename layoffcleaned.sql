-- Data cleaning

USE world_layoffs;

SELECT *
FROM layoffs;

-- 1, remover duplicados
-- Aca se encuentran los registros duplicados en el conjunto de datos 'layoffs'
-- utilizando la función ROW_NUMBER() para identificar filas duplicadas según varios criterios.

CREATE TABLE layoffs_staging3
LIKE layoffs;

INSERT layoffs_staging3
SELECT *
FROM layoffs;



SELECT *,
		ROW_NUMBER() OVER (
			PARTITION BY company, location, industry, total_laid_off,percentage_laid_off,`date`, stage, country, funds_raised_millions) AS row_num
	FROM 
		layoffs_staging3;
	

WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER (
PARTITION BY company, location, industry, total_laid_off,percentage_laid_off,`date`, stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging3
		
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;




CREATE TABLE `layoffs_staging4` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT *
FROM layoffs_staging4
WHERE row_num > 1;

INSERT INTO layoffs_staging4
SELECT *,
ROW_NUMBER() OVER (
PARTITION BY company, location, industry, total_laid_off,percentage_laid_off,`date`, stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging3;

SET SQL_SAFE_UPDATES = 0;

DELETE 
FROM layoffs_staging4
WHERE row_num > 1;

SELECT * 
FROM layoffs_staging4;

-- Estandarización de datos 



SELECT company, TRIM(company)
FROM layoffs_staging4;

SET SQL_SAFE_UPDATES = 0;

UPDATE layoffs_staging4
SET company= TRIM(company);

SELECT DISTINCT industry
FROM layoffs_staging4
ORDER BY 1;

SELECT industry
FROM layoffs_staging4
WHERE industry LIKE 'Crypto%';

UPDATE layoffs_staging4
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

SELECT DISTINCT  country
FROM layoffs_staging4
WHERE country LIKE 'United States%';

SELECT country, TRIM(TRAILING '.' FROM country)
FROM layoffs_staging4;

UPDATE  layoffs_staging4
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';

SELECT *
FROM layoffs_staging4;

UPDATE layoffs_staging4
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

ALTER TABLE layoffs_staging4
MODIFY COLUMN `date` DATE;

-- tratamientos de valores nulos o en blanco  

UPDATE layoffs_staging4
SET industry = null
WHERE industry = '';




SELECT t1.industry, t2.industry
FROM layoffs_staging4 t1
JOIN layoffs_staging4 t2
     ON t1.company = t2.company 
WHERE (t1.industry IS NULL)
AND t2.industry IS NOT NULL;

UPDATE layoffs_staging4 t1
JOIN layoffs_staging4 t2
     ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;

SELECT *
FROM layoffs_staging4
WHERE company = 'Airbnb';

-- remocion de columnas y filas no relevantes 

SELECT *
FROM layoffs_staging4
WHERE total_laid_off IS NULL
AND percentage_laid_off  IS NULL;

DELETE 
FROM layoffs_staging4
WHERE total_laid_off IS NULL
AND percentage_laid_off  IS NULL;

ALTER TABLE layoffs_staging4
DROP row_num;	

SELECT *
FROM layoffs_staging4;






