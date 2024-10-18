

--  EDA PROJECT


USE world_layoffs;

-- Se corroborara el periodo de tiempo en medio del cual se encuentra el dataset 

SELECT MIN(`date`), MAX(`date`)
FROM layoffs_staging4;

--  Analizando el porcentaje para poder ver la magnitud de los porcentajes 

SELECT MAX(total_laid_off)
FROM layoffs_staging4;


-- Cuales compañias tienen un porcentaje de 1; es decir que despidieron el 100 % de su compañia 

SELECT *
FROM layoffs_staging4
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;

/*  Si se ordenan por fondos recaudados en millones  se puede dimensionar que tan grandes son algunas de estas
empresas */


SELECT *
FROM layoffs_staging4
WHERE  percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;

-- Empresas con los mayores despidos

SELECT company, total_laid_off
FROM layoffs_staging4
ORDER BY 2 DESC
LIMIT 5;

-- segun la ubicacion

SELECT location, SUM(total_laid_off)
FROM layoffs_staging4
GROUP BY location
ORDER BY 2 DESC
LIMIT 10;

-- Ahora el total  por compañia, industria, pais por etapa de financiación
 
SELECT company, SUM(total_laid_off)
FROM layoffs_staging4
GROUP BY company
ORDER BY 2 DESC;	

SELECT industry, SUM(total_laid_off)
FROM layoffs_staging4
GROUP BY industry
ORDER BY 2 DESC;

SELECT country, SUM(total_laid_off)
FROM layoffs_staging4
GROUP BY country
ORDER BY 2 DESC;



SELECT YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging4
GROUP BY YEAR(`date`)
ORDER BY 1 DESC;

SELECT stage, SUM(total_laid_off)
FROM layoffs_staging4
GROUP BY stage
ORDER BY 2 DESC;


-- Se realiza consulta para visualizar una suma acumulativa 



SELECT SUBSTRING(`date`,1,7) AS MES , SUM(total_laid_off)
FROM layoffs_staging4
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY MES
ORDER BY 2 DESC;

WITH Rolling_total AS 
(

SELECT SUBSTRING(`date`,1,7) AS MES , SUM(total_laid_off) AS total_off
FROM layoffs_staging4
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY MES
ORDER BY 1 ASC
)
SELECT MES,total_off, SUM(total_off) OVER (ORDER BY MES) AS olling_total
FROM Rolling_total;


SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging4
GROUP BY company, YEAR(`date`)
ORDER BY 3 DESC;

/* Anteriormente se visualizaron las empresas con mas despidos, ahora se realizara lo mismo pero por año, lo cual
lo cual es un poco mas complejo*/

WITH company_year (company,years, total_laid_off) AS
(
SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging4
GROUP BY company, YEAR(`date`)
ORDER BY 3 DESC
), company_year_rank AS
(
SELECT *, DENSE_RANK() OVER(PARTITION BY years ORDER BY total_laid_off DESC) AS ranking
FROM company_year
WHERE years IS NOT NULL
)
SELECT *
FROM company_year_rank
where ranking <= 5;


-- Por sector de la  industria 


WITH industry_year (industry,years, total_laid_off) AS
(
SELECT industry, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging4
GROUP BY industry, YEAR(`date`)
ORDER BY 3 DESC
), industry_year_rank AS
(
SELECT *, DENSE_RANK() OVER(PARTITION BY years ORDER BY total_laid_off DESC) AS ranking_industry
FROM industry_year
WHERE years IS NOT NULL
)
SELECT *
FROM industry_year_rank;




























