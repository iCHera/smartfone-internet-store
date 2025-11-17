DECLARE @AppleBrandId INT = (SELECT id FROM Brands WHERE name = 'Apple');

IF @AppleBrandId IS NULL
BEGIN
    PRINT 'ОШИБКА: Бренд "Apple" не найден в таблице Brands. Добавьте его и повторите.';
    RETURN;
END

IF NOT EXISTS (SELECT 1 FROM Product_Models WHERE model_name = 'iPhone 14' AND brand_id = @AppleBrandId)
BEGIN
    INSERT INTO Product_Models (brand_id, model_name, description, display_size_in, processor_name) 
    VALUES (
        @AppleBrandId, 
        'iPhone 14', 
        'iPhone 14 получил улучшенный чип A15 Bionic с 5-ядерным графическим процессоро, что обеспечивает еще более высокую производительность. Главное улучшение — расширенные функции безопасности. Основная камера 12 Мп с увеличенным сенсором для лучших снимков при слабом освещении. Отличное обновление, сохраняющее надежный дизайн.', 
        6.1, 
        'A15 Bionic (5-core GPU)'
    );
END
DECLARE @iPhone14Id INT = (SELECT id FROM Product_Models WHERE model_name = 'iPhone 14' AND brand_id = @AppleBrandId);

IF NOT EXISTS (SELECT 1 FROM Product_Color_Options WHERE model_id = @iPhone14Id AND color = 'Black')
    INSERT INTO Product_Color_Options (model_id, color, color_description) VALUES (@iPhone14Id, 'Black', 'Классический черный алюминиевый корпус с улучшенной системой охлаждения.');
IF NOT EXISTS (SELECT 1 FROM Product_Color_Options WHERE model_id = @iPhone14Id AND color = 'White')
    INSERT INTO Product_Color_Options (model_id, color, color_description) VALUES (@iPhone14Id, 'White', 'Стильный белый корпус с повышенной прочностью Ceramic Shield.');

IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone14Id AND storage_gb = 128 AND color = 'Black')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone14Id, 128, 'Black', 2099.00, 30); 
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone14Id AND storage_gb = 256 AND color = 'Black')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone14Id, 256, 'Black', 2499.00, 20); 
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone14Id AND storage_gb = 512 AND color = 'Black')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone14Id, 512, 'Black', 2799.00, 10); 

IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone14Id AND storage_gb = 128 AND color = 'White')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone14Id, 128, 'White', 2099.00, 25); 
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone14Id AND storage_gb = 256 AND color = 'White')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone14Id, 256, 'White', 2499.00, 18);
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone14Id AND storage_gb = 512 AND color = 'White')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone14Id, 512, 'White', 2799.00, 7);

IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone14Id AND color = 'Black' AND sort_order = 1)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone14Id, 'Black', 'https://i.ibb.co/jqFs2rQ/Iphone-13-14-black.webp', 1, 1);
IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone14Id AND color = 'Black' AND sort_order = 2)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone14Id, 'Black', 'https://i.ibb.co/7dZ7Mr0C/Iphone-13-14-black-2.webp', 0, 2);
IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone14Id AND color = 'Black' AND sort_order = 3)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone14Id, 'Black', 'https://i.ibb.co/bMGSqpQM/Iphone-13-14-black-3.webp', 0, 3);
IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone14Id AND color = 'White' AND sort_order = 1)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone14Id, 'White', 'https://i.ibb.co/93sDwDJs/Iphone-13-14-white.webp', 1, 1);
IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone14Id AND color = 'White' AND sort_order = 2)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone14Id, 'White', 'https://i.ibb.co/C3YpGRTr/Iphone-13-14-white-2.webp', 0, 2);
IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone14Id AND color = 'White' AND sort_order = 3)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone14Id, 'White', 'https://i.ibb.co/dwsNFLJN/Iphone-13-14-white-3.webp', 0, 3);

IF NOT EXISTS (SELECT 1 FROM Product_Models WHERE model_name = 'iPhone 14 Pro' AND brand_id = @AppleBrandId)
BEGIN
    INSERT INTO Product_Models (brand_id, model_name, description, display_size_in, processor_name) 
    VALUES (
        @AppleBrandId, 
        'iPhone 14 Pro',
        'iPhone 14 Pro — первый смартфон с технологией Dynamic Island, заменившей "челку". Оснащен чипом A16 Bionic и основной камерой 48 Мп для максимальной детализации. ProMotion-дисплей с функцией Always-On Display. Корпус из хирургической нержавеющей стали. Это значительный скачок в дизайне и технологиях.', 
        6.1, 
        'A16 Bionic'
    );
END
DECLARE @iPhone14ProId INT = (SELECT id FROM Product_Models WHERE model_name = 'iPhone 14 Pro' AND brand_id = @AppleBrandId);

IF NOT EXISTS (SELECT 1 FROM Product_Color_Options WHERE model_id = @iPhone14ProId AND color = 'Black')
    INSERT INTO Product_Color_Options (model_id, color, color_description) VALUES (@iPhone14ProId, 'Black', 'Корпус из нержавеющей стали (цвет Space Black) с матовой задней панелью.');
IF NOT EXISTS (SELECT 1 FROM Product_Color_Options WHERE model_id = @iPhone14ProId AND color = 'White')
    INSERT INTO Product_Color_Options (model_id, color, color_description) VALUES (@iPhone14ProId, 'White', 'Профессиональный корпус из нержавеющей стали Silver.');
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone14ProId AND storage_gb = 128 AND color = 'Black')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone14ProId, 128, 'Black', 2499.00, 15); 
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone14ProId AND storage_gb = 256 AND color = 'Black')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone14ProId, 256, 'Black', 2899.00, 10); 
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone14ProId AND storage_gb = 512 AND color = 'Black')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone14ProId, 512, 'Black', 3199.00, 5); 

IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone14ProId AND storage_gb = 128 AND color = 'White')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone14ProId, 128, 'White', 2499.00, 12);
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone14ProId AND storage_gb = 256 AND color = 'White')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone14ProId, 256, 'White', 2899.00, 8);
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone14ProId AND storage_gb = 512 AND color = 'White')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone14ProId, 512, 'White', 3199.00, 4);

IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone14ProId AND color = 'Black' AND sort_order = 1)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone14ProId, 'Black', 'https://i.ibb.co/fdXq1r2H/Iphone-13-14-pro-black.webp', 1, 1);
IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone14ProId AND color = 'Black' AND sort_order = 2)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone14ProId, 'Black', 'https://i.ibb.co/7dZ7Mr0C/Iphone-13-14-pro-black-2.webp', 0, 2);
IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone14ProId AND color = 'White' AND sort_order = 1)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone14ProId, 'White', 'https://i.ibb.co/fdQ5LkXy/Iphone-13-14-pro-white.webp', 1, 1);
IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone14ProId AND color = 'White' AND sort_order = 2)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone14ProId, 'White', 'https://i.ibb.co/q37LGKxc/Iphone-13-14-pro-white-2.webp', 0, 2);


PRINT '*** Заполнение данных для iPhone 14 и iPhone 14 Pro (BYN) завершено ***';