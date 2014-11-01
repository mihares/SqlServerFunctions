ALTER PROCEDURE UltimosTrucos
@PageSize int,
@PageNumber int 
AS
SELECT ITEM_COD, ITEM_DES
FROM (
SELECT
ITEM_COD, ITEM_DES,
ROW_NUMBER() OVER (ORDER BY ITEM_DES, ITEM_COD) AS RowNumber 
FROM 
ITEMS
) AS Trucos
WHERE RowNumber BETWEEN @PageSize * @PageNumber + 1 
AND @PageSize * (@PageNumber + 1)

exec UltimosTrucos 19, 20