DECLARE @AppleBrandId INT = (SELECT id FROM Brands WHERE name = 'Apple');

IF @AppleBrandId IS NULL
BEGIN
    PRINT 'ОШИБКА: Бренд "Apple" не найден в таблице Brands. Добавьте его и повторите.';
    RETURN;
END

IF NOT EXISTS (SELECT 1 FROM Product_Models WHERE model_name = 'iPhone 12' AND brand_id = @AppleBrandId)
BEGIN
    INSERT INTO Product_Models (brand_id, model_name, description, display_size_in, processor_name) 
    VALUES (
        @AppleBrandId, 
        'iPhone 12', 
        'iPhone 12 — первый из основной линейки, получивший Super Retina XDR OLED-дисплей, что значительно улучшает качество изображения. Дизайн с плоскими гранями, как у iPhone 4, делает его более современным. Защита Ceramic Shield увеличивает прочность экрана. Оснащен чипом A14 Bionic и поддержкой сетей 5G. Отличный шаг вперед по сравнению с 11-й серией.', 
        6.1, 
        'A14 Bionic'
    );
END
DECLARE @iPhone12Id INT = (SELECT id FROM Product_Models WHERE model_name = 'iPhone 12' AND brand_id = @AppleBrandId);

IF NOT EXISTS (SELECT 1 FROM Product_Color_Options WHERE model_id = @iPhone12Id AND color = 'Black')
    INSERT INTO Product_Color_Options (model_id, color, color_description) VALUES (@iPhone12Id, 'Black', 'Классический черный алюминиевый корпус с плоскими, современными гранями.');
IF NOT EXISTS (SELECT 1 FROM Product_Color_Options WHERE model_id = @iPhone12Id AND color = 'White')
    INSERT INTO Product_Color_Options (model_id, color, color_description) VALUES (@iPhone12Id, 'White', 'Элегантный белый корпус, подчеркивающий строгий дизайн.');

IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone12Id AND storage_gb = 64 AND color = 'Black')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone12Id, 64, 'Black', 1699.00, 35); 
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone12Id AND storage_gb = 128 AND color = 'Black')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone12Id, 128, 'Black', 2099.00, 25); 
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone12Id AND storage_gb = 256 AND color = 'Black')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone12Id, 256, 'Black', 2399.00, 10);

IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone12Id AND storage_gb = 64 AND color = 'White')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone12Id, 64, 'White', 1699.00, 30); 
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone12Id AND storage_gb = 128 AND color = 'White')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone12Id, 128, 'White', 2099.00, 20);
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone12Id AND storage_gb = 256 AND color = 'White')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone12Id, 256, 'White', 2399.00, 8);

IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone12Id AND color = 'Black' AND sort_order = 1)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone12Id, 'Black', 'https://i.ibb.co/CKmcSSMb/Iphone-12-black.webp', 1, 1);
IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone12Id AND color = 'Black' AND sort_order = 2)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone12Id, 'Black', 'https://i.ibb.co/qzyYw2K/Iphone-12-black-2.webp', 0, 2);
IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone12Id AND color = 'Black' AND sort_order = 3)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone12Id, 'Black', 'https://i.ibb.co/tTRPL6sW/Iphone-12-black-3.webp', 0, 3);
IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone12Id AND color = 'White' AND sort_order = 1)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone12Id, 'White', 'https://i.ibb.co/MyrLvtpB/Iphone-12-white.webp', 1, 1);
IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone12Id AND color = 'White' AND sort_order = 2)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone12Id, 'White', 'https://i.ibb.co/Xk8RfqSq/Iphone-12-white-2.webp', 0, 2);
IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone12Id AND color = 'White' AND sort_order = 3)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone12Id, 'White', 'https://i.ibb.co/MDwxbqfN/Iphone-12-white-3.webp', 0, 3);

IF NOT EXISTS (SELECT 1 FROM Product_Models WHERE model_name = 'iPhone 12 Pro' AND brand_id = @AppleBrandId)
BEGIN
    INSERT INTO Product_Models (brand_id, model_name, description, display_size_in, processor_name) 
    VALUES (
        @AppleBrandId, 
        'iPhone 12 Pro', 
        'Модель Pro впервые получила строгий дизайн с плоскими гранями из полированной нержавеющей стали и более продвинутую систему камер с сенсором LiDAR. Super Retina XDR OLED-дисплей, чип A14 Bionic. Это компактный, но мощный инструмент для фотографов и видеографов.', 
        6.1, 
        'A14 Bionic'
    );
END
DECLARE @iPhone12ProId INT = (SELECT id FROM Product_Models WHERE model_name = 'iPhone 12 Pro' AND brand_id = @AppleBrandId);

IF NOT EXISTS (SELECT 1 FROM Product_Color_Options WHERE model_id = @iPhone12ProId AND color = 'Black')
    INSERT INTO Product_Color_Options (model_id, color, color_description) VALUES (@iPhone12ProId, 'Black', 'Элегантный корпус из полированной нержавеющей стали (цвет Graphite).');
IF NOT EXISTS (SELECT 1 FROM Product_Color_Options WHERE model_id = @iPhone12ProId AND color = 'White')
    INSERT INTO Product_Color_Options (model_id, color, color_description) VALUES (@iPhone12ProId, 'White', 'Стильный корпус из нержавеющей стали Silver.');

IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone12ProId AND storage_gb = 128 AND color = 'Black')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone12ProId, 128, 'Black', 2499.00, 15); 
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone12ProId AND storage_gb = 256 AND color = 'Black')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone12ProId, 256, 'Black', 2799.00, 10); 
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone12ProId AND storage_gb = 512 AND color = 'Black')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone12ProId, 512, 'Black', 3199.00, 5); 
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone12ProId AND storage_gb = 128 AND color = 'White')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone12ProId, 128, 'White', 2499.00, 12);
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone12ProId AND storage_gb = 256 AND color = 'White')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone12ProId, 256, 'White', 2799.00, 8);
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone12ProId AND storage_gb = 512 AND color = 'White')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone12ProId, 512, 'White', 3199.00, 3);
IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone12ProId AND color = 'Black' AND sort_order = 1)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone12ProId, 'Black', 'https://i.ibb.co/zW3sr1CG/Iphone-12-pro-black.webp', 1, 1);
IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone12ProId AND color = 'Black' AND sort_order = 2)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone12ProId, 'Black', 'https://i.ibb.co/HL8twhXb/Iphone-12-pro-black-2.webp', 0, 2);
IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone12ProId AND color = 'White' AND sort_order = 1)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone12ProId, 'White', 'https://i.ibb.co/93y4C1md/Iphone-12-pro-white.webp', 1, 1);
IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone12ProId AND color = 'White' AND sort_order = 2)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone12ProId, 'White', 'https://i.ibb.co/HskY7g4/Iphone-12-pro-white-2.webp', 0, 2);



PRINT '*** Заполнение данных для iPhone 12 и iPhone 12 Pro (BYN) завершено ***';