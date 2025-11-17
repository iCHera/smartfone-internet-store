DECLARE @ModelIdToDelete INT = 1; 

IF NOT EXISTS (SELECT 1 FROM Product_Models WHERE id = @ModelIdToDelete AND model_name = 'iPhone 15 Pro')
BEGIN
    PRINT 'Ошибка: Модель iPhone 15 Pro с ID=1 не найдена. Удаление отменено.';
    RETURN;
END

PRINT 'Удаление изображений, связанных с iPhone 15 Pro (ID=1)...';
DELETE FROM Product_Images
WHERE model_id = @ModelIdToDelete;

PRINT 'Удаление опций цвета, связанных с iPhone 15 Pro (ID=1)...';
DELETE FROM Product_Color_Options
WHERE model_id = @ModelIdToDelete;

PRINT 'Удаление вариантов товара, связанных с iPhone 15 Pro (ID=1)...';
DELETE FROM Products
WHERE model_id = @ModelIdToDelete;

PRINT 'Удаление самой модели iPhone 15 Pro (ID=1)...';
DELETE FROM Product_Models
WHERE id = @ModelIdToDelete;

BEGIN
    DBCC CHECKIDENT ('Product_Models', RESEED, 0);
    PRINT 'Счетчик ID для Product_Models сброшен.';
END


PRINT '*** Полное удаление iPhone 15 Pro (ID=1) завершено ***';