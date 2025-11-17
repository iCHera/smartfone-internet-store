DECLARE @AppleBrandId INT = (SELECT id FROM Brands WHERE name = 'Apple');

IF @AppleBrandId IS NULL
BEGIN
    PRINT 'ОШИБКА: Бренд "Apple" не найден в таблице Brands. Добавьте его и повторите.';
    RETURN;
END

IF NOT EXISTS (SELECT 1 FROM Product_Models WHERE model_name = 'iPhone 16' AND brand_id = @AppleBrandId)
BEGIN
    INSERT INTO Product_Models (brand_id, model_name, description, display_size_in, processor_name) 
    VALUES (
        @AppleBrandId, 
        'iPhone 16',
        'iPhone 16 получил новый чип A18 Bionic с упором на возможности искусственного интеллекта. Сохранил Dynamic Island, но теперь имеет более тонкие рамки дисплея и кнопку "Съемка" (Capture Button) для быстрой фото и видеосъемки. Камера получила улучшенный сенсор. Модель продолжает традиции надежности и высокой автономности.', 
        6.1, 
        'A18 Bionic'
    );
END
DECLARE @iPhone16Id INT = (SELECT id FROM Product_Models WHERE model_name = 'iPhone 16' AND brand_id = @AppleBrandId);

IF NOT EXISTS (SELECT 1 FROM Product_Color_Options WHERE model_id = @iPhone16Id AND color = 'Black')
    INSERT INTO Product_Color_Options (model_id, color, color_description) VALUES (@iPhone16Id, 'Black', 'Корпус из прочного алюминия, с новой, чувствительной к нажатию, кнопкой "Съемка"');
IF NOT EXISTS (SELECT 1 FROM Product_Color_Options WHERE model_id = @iPhone16Id AND color = 'White')
    INSERT INTO Product_Color_Options (model_id, color, color_description) VALUES (@iPhone16Id, 'White', 'Стильный белый корпус с увеличенным аккумулятором.');


IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone16Id AND storage_gb = 128 AND color = 'Black')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone16Id, 128, 'Black', 2400.00, 30); 
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone16Id AND storage_gb = 256 AND color = 'Black')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone16Id, 256, 'Black', 2800.00, 20); 
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone16Id AND storage_gb = 512 AND color = 'Black')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone16Id, 512, 'Black', 3100.00, 10); 

IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone16Id AND storage_gb = 128 AND color = 'White')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone16Id, 128, 'White', 2400.00, 25); 
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone16Id AND storage_gb = 256 AND color = 'White')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone16Id, 256, 'White', 2800.00, 18);
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone16Id AND storage_gb = 512 AND color = 'White')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone16Id, 512, 'White', 3100.00, 7);

IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone16Id AND color = 'Black' AND sort_order = 1)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone16Id, 'Black', 'https://i.ibb.co/Ndrw43bF/iphone-16-black.webp', 1, 1);
IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone16Id AND color = 'Black' AND sort_order = 2)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone16Id, 'Black', 'https://i.ibb.co/Kjs1NPJj/iphone-16-black-2.webp', 0, 2);
IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone16Id AND color = 'Black' AND sort_order = 3)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone16Id, 'Black', 'https://i.ibb.co/GfL8rN6c/iphone-16-black-3.webp', 0, 3);
IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone16Id AND color = 'White' AND sort_order = 1)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone16Id, 'White', 'https://i.ibb.co/gFb2YPRP/iphone-16-white.webp', 1, 1);
IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone16Id AND color = 'White' AND sort_order = 2)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone16Id, 'White', 'https://i.ibb.co/gFb2YPRP/iphone-16-white-2.webp', 0, 2);
IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone16Id AND color = 'White' AND sort_order = 3)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone16Id, 'White', 'https://i.ibb.co/KcMzy45J/iphone-16-white-3.webp', 0, 3);

IF NOT EXISTS (SELECT 1 FROM Product_Models WHERE model_name = 'iPhone 16 Pro' AND brand_id = @AppleBrandId)
BEGIN
    INSERT INTO Product_Models (brand_id, model_name, description, display_size_in, processor_name) 
    VALUES (
        @AppleBrandId, 
        'iPhone 16 Pro',
        'iPhone 16 Pro продолжает титановую эру, но с увеличенным дисплеем (6.3 дюйма) и технологией камеры "Тетрапризма". Чип A18 Pro (более мощный, чем A18) и более продвинутый Neural Engine для ИИ-функций. Обновленная кнопка "Действие" и увеличенный размер сенсоров камеры.', 
        6.3, 
        'A18 Pro'
    );
END
DECLARE @iPhone16ProId INT = (SELECT id FROM Product_Models WHERE model_name = 'iPhone 16 Pro' AND brand_id = @AppleBrandId);

IF NOT EXISTS (SELECT 1 FROM Product_Color_Options WHERE model_id = @iPhone16ProId AND color = 'Black')
    INSERT INTO Product_Color_Options (model_id, color, color_description) VALUES (@iPhone16ProId, 'Black', 'Матовый корпус из титана с более тонкой рамкой вокруг дисплея.');
IF NOT EXISTS (SELECT 1 FROM Product_Color_Options WHERE model_id = @iPhone16ProId AND color = 'White')
    INSERT INTO Product_Color_Options (model_id, color, color_description) VALUES (@iPhone16ProId, 'White', 'Корпус из титана (White Titanium) с новым финишем.');

IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone16ProId AND storage_gb = 128 AND color = 'Black')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone16ProId, 128, 'Black', 2800.00, 15); 
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone16ProId AND storage_gb = 256 AND color = 'Black')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone16ProId, 256, 'Black', 3200.00, 10); 
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone16ProId AND storage_gb = 512 AND color = 'Black')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone16ProId, 512, 'Black', 3500.00, 5); 

IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone16ProId AND storage_gb = 128 AND color = 'White')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone16ProId, 128, 'White', 2800.00, 12);
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone16ProId AND storage_gb = 256 AND color = 'White')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone16ProId, 256, 'White', 3200.00, 8);
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone16ProId AND storage_gb = 512 AND color = 'White')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone16ProId, 512, 'White', 3500.00, 4);

IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone16ProId AND color = 'Black' AND sort_order = 1)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone16ProId, 'Black', 'https://i.ibb.co/WN2p2dxj/iphone-16-pro-black.webp', 1, 1);
IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone16ProId AND color = 'Black' AND sort_order = 2)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone16ProId, 'Black', 'https://i.ibb.co/MkDz3pnF/iphone-16-pro-black-2.webp', 0, 2);
IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone16ProId AND color = 'White' AND sort_order = 1)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone16ProId, 'White', 'https://i.ibb.co/dZX2SjJ/iphone-16-pro-white.webp', 1, 1);
IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone16ProId AND color = 'White' AND sort_order = 2)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone16ProId, 'White', 'https://i.ibb.co/XZWbcbjh/iphone-16-pro-white-2.webp', 0, 2);


PRINT '*** Заполнение данных для iPhone 16 и iPhone 16 Pro (BYN) завершено ***';