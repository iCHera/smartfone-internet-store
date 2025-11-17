
DECLARE @AppleBrandId INT = (SELECT id FROM Brands WHERE name = 'Apple');

IF @AppleBrandId IS NULL
BEGIN
    PRINT 'ОШИБКА: Бренд "Apple" не найден в таблице Brands. Добавьте его и повторите.';
    RETURN;
END

IF NOT EXISTS (SELECT 1 FROM Product_Models WHERE model_name = 'iPhone 15' AND brand_id = @AppleBrandId)
BEGIN
    INSERT INTO Product_Models (brand_id, model_name, description, display_size_in, processor_name) 
    VALUES (
        @AppleBrandId, 
        'iPhone 15',
        'iPhone 15 — первый из основной линейки, получивший Dynamic Island и основной сенсор камеры 48 Мп. Это значительное обновление дизайна и функционала. Оснащен мощным чипом A16 Bionic и алюминиевым корпусом. Идеальное сочетание инноваций и надежности.', -- ИСПРАВЛЕНО: description
        6.1, 
        'A16 Bionic'
    );
END
DECLARE @iPhone15Id INT = (SELECT id FROM Product_Models WHERE model_name = 'iPhone 15' AND brand_id = @AppleBrandId);

IF NOT EXISTS (SELECT 1 FROM Product_Color_Options WHERE model_id = @iPhone15Id AND color = 'Black')
    INSERT INTO Product_Color_Options (model_id, color, color_description) VALUES (@iPhone15Id, 'Black', 'Корпус из прочного алюминия с задней панелью из цветного стекла.');
IF NOT EXISTS (SELECT 1 FROM Product_Color_Options WHERE model_id = @iPhone15Id AND color = 'White')
    INSERT INTO Product_Color_Options (model_id, color, color_description) VALUES (@iPhone15Id, 'White', 'Стильный белый корпус с технологией Ceramic Shield.');

IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone15Id AND storage_gb = 128 AND color = 'Black')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone15Id, 128, 'Black', 2000.00, 30); 
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone15Id AND storage_gb = 256 AND color = 'Black')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone15Id, 256, 'Black', 2400.00, 20); 
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone15Id AND storage_gb = 512 AND color = 'Black')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone15Id, 512, 'Black', 2700.00, 10); 
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone15Id AND storage_gb = 128 AND color = 'White')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone15Id, 128, 'White', 2000.00, 25); 
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone15Id AND storage_gb = 256 AND color = 'White')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone15Id, 256, 'White', 2400.00, 18);
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone15Id AND storage_gb = 512 AND color = 'White')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone15Id, 512, 'White', 2700.00, 7);

IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone15Id AND color = 'Black' AND sort_order = 1)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone15Id, 'Black', 'https://i.ibb.co/wF8MNv19/iphone-15-black.webp', 1, 1);
IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone15Id AND color = 'Black' AND sort_order = 2)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone15Id, 'Black', 'https://i.ibb.co/KzDp26J4/iphone-15-black-2.webp', 0, 2);
IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone15Id AND color = 'White' AND sort_order = 1)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone15Id, 'White', 'https://i.ibb.co/MDWkCdL1/iphone-15-white.webp', 1, 1);
IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone15Id AND color = 'White' AND sort_order = 2)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone15Id, 'White', 'https://i.ibb.co/gZ5znYtY/iphone-15-white-2.webp', 0, 2);

IF NOT EXISTS (SELECT 1 FROM Product_Models WHERE model_name = 'iPhone 15 Pro' AND brand_id = @AppleBrandId)
BEGIN
    INSERT INTO Product_Models (brand_id, model_name, description, display_size_in, processor_name) 
    VALUES (
        @AppleBrandId, 
        'iPhone 15 Pro',
        'iPhone 15 Pro — первый смартфон с корпусом из титана аэрокосмического класса. Оснащен чипом A17 Pro (первый 3-нм чип) и самой продвинутой системой камер с 5-кратным оптическим зумом. Порт USB-C с поддержкой USB 3 для быстрой передачи данных. Кнопка "Действие" (Action Button) пришла на смену переключателю беззвучного режима.', -- ИСПРАВЛЕНО: description
        6.1, 
        'A17 Pro'
    );
END
DECLARE @iPhone15ProId INT = (SELECT id FROM Product_Models WHERE model_name = 'iPhone 15 Pro' AND brand_id = @AppleBrandId);

IF NOT EXISTS (SELECT 1 FROM Product_Color_Options WHERE model_id = @iPhone15ProId AND color = 'Black')
    INSERT INTO Product_Color_Options (model_id, color, color_description) VALUES (@iPhone15ProId, 'Black', 'Матовый корпус из титана (цвет Natural/Black Titanium).');
IF NOT EXISTS (SELECT 1 FROM Product_Color_Options WHERE model_id = @iPhone15ProId AND color = 'White')
    INSERT INTO Product_Color_Options (model_id, color, color_description) VALUES (@iPhone15ProId, 'White', 'Корпус из титана (цвет White Titanium) с элегантным матовым финишем.');

IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone15ProId AND storage_gb = 128 AND color = 'Black')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone15ProId, 128, 'Black', 2400.00, 15); 
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone15ProId AND storage_gb = 256 AND color = 'Black')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone15ProId, 256, 'Black', 2800.00, 10); 
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone15ProId AND storage_gb = 512 AND color = 'Black')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone15ProId, 512, 'Black', 3100.00, 5); 
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone15ProId AND storage_gb = 128 AND color = 'White')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone15ProId, 128, 'White', 2400.00, 12);
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone15ProId AND storage_gb = 256 AND color = 'White')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone15ProId, 256, 'White', 2800.00, 8);
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone15ProId AND storage_gb = 512 AND color = 'White')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone15ProId, 512, 'White', 3100.00, 4);

IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone15ProId AND color = 'Black' AND sort_order = 1)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone15ProId, 'Black', 'https://i.ibb.co/84GnLxWN/iphone-15-pro-black.webp', 1, 1);
IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone15ProId AND color = 'Black' AND sort_order = 2)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone15ProId, 'Black', 'https://i.ibb.co/rKd7QGZh/iphone-15-pro-black-2.webp', 0, 2);
IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone15ProId AND color = 'White' AND sort_order = 1)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone15ProId, 'White', 'https://i.ibb.co/tpSN5VdJ/iphone-15-pro-white.webp', 1, 1);
IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone15ProId AND color = 'White' AND sort_order = 2)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone15ProId, 'White', 'https://i.ibb.co/8Lm1L88y/iphone-15-pro-white-2.webp', 0, 2);


PRINT '*** Заполнение данных для iPhone 15 и iPhone 15 Pro (BYN) завершено ***';