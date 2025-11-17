DECLARE @AppleBrandId INT = (SELECT id FROM Brands WHERE name = 'Apple');

IF NOT EXISTS (SELECT 1 FROM Product_Models WHERE model_name = 'iPhone 11' AND brand_id = @AppleBrandId)
BEGIN
    INSERT INTO Product_Models (brand_id, model_name, description, display_size_in, processor_name) 
    VALUES (
        @AppleBrandId, 
        'iPhone 11', 
        'iPhone 11 — это классический флагман, который сочетает в себе отличную производительность и невероятно яркий 6.1-дюймовый Liquid Retina HD дисплей. Корпус выполнен из прочного авиационного алюминия и стекла. Устройство оснащено двойной системой камер (широкоугольная и сверхширокоугольная) с режимом «Ночь», что позволяет делать потрясающие снимки даже при слабом освещении. Благодаря чипу A13 Bionic, смартфон обеспечивает быструю и плавную работу всех приложений и игр. Идеальный выбор для тех, кто ищет баланс цены и качества.', 
        6.1, 
        'A13 Bionic'
    );
END
DECLARE @iPhone11Id INT = (SELECT id FROM Product_Models WHERE model_name = 'iPhone 11' AND brand_id = @AppleBrandId);

IF NOT EXISTS (SELECT 1 FROM Product_Color_Options WHERE model_id = @iPhone11Id AND color = 'Black')
    INSERT INTO Product_Color_Options (model_id, color, color_description) VALUES (@iPhone11Id, 'Black', 'Классический черный матовый корпус из алюминия.');
IF NOT EXISTS (SELECT 1 FROM Product_Color_Options WHERE model_id = @iPhone11Id AND color = 'White')
    INSERT INTO Product_Color_Options (model_id, color, color_description) VALUES (@iPhone11Id, 'White', 'Элегантный белый корпус с глянцевой задней панелью.');

IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone11Id AND storage_gb = 64 AND color = 'Black')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone11Id, 64, 'Black', 1299.00, 40); 
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone11Id AND storage_gb = 128 AND color = 'Black')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone11Id, 128, 'Black', 1699.00, 30); 
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone11Id AND storage_gb = 256 AND color = 'Black')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone11Id, 256, 'Black', 1999.00, 15); 
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone11Id AND storage_gb = 64 AND color = 'White')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone11Id, 64, 'White', 1299.00, 35); 
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone11Id AND storage_gb = 128 AND color = 'White')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone11Id, 128, 'White', 1699.00, 25);
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone11Id AND storage_gb = 256 AND color = 'White')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone11Id, 256, 'White', 1999.00, 10);
IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone11Id AND color = 'Black' AND sort_order = 1)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone11Id, 'Black', 'https://i.ibb.co/39hNJGy2/Iphone-11-black-3.webp', 1, 1);
IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone11Id AND color = 'Black' AND sort_order = 2)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone11Id, 'Black', 'https://i.ibb.co/0j7hp0dY/Iphone-11-black.webp', 0, 2);
IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone11Id AND color = 'Black' AND sort_order = 3)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone11Id, 'Black', 'https://i.ibb.co/6cpDyqdW/Iphone-11-black-2.webp', 0, 3);
IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone11Id AND color = 'White' AND sort_order = 1)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone11Id, 'White', 'https://i.ibb.co/Z6rWtfN9/Iphone-11-white-3.webp', 1, 1);
IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone11Id AND color = 'White' AND sort_order = 2)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone11Id, 'White', 'https://i.ibb.co/QjHXyyBV/Iphone-11-white.webp', 0, 2);
IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone11Id AND color = 'White' AND sort_order = 3)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone11Id, 'White', 'https://i.ibb.co/Xfz5DCmP/Iphone-11-white-1.webp', 0, 3);

IF NOT EXISTS (SELECT 1 FROM Product_Models WHERE model_name = 'iPhone 11 Pro' AND brand_id = @AppleBrandId)
BEGIN
    INSERT INTO Product_Models (brand_id, model_name, description, display_size_in, processor_name) 
    VALUES (
        @AppleBrandId, 
        'iPhone 11 Pro', 
        'iPhone 11 Pro — это первый смартфон Apple с тройной системой камер, заключенный в корпус из хирургической нержавеющей стали и матового стекла. Компактный 5.8-дюймовый Super Retina XDR OLED-дисплей обеспечивает высочайшую контрастность и яркость. Модель оснащена мощнейшим чипом A13 Bionic, что гарантирует максимальную производительность. Создан для профессионалов и ценителей премиального, компактного дизайна и лучших технологий Apple.', 
        5.8, 
        'A13 Bionic'
    );
END
DECLARE @iPhone11ProId INT = (SELECT id FROM Product_Models WHERE model_name = 'iPhone 11 Pro' AND brand_id = @AppleBrandId);

IF NOT EXISTS (SELECT 1 FROM Product_Color_Options WHERE model_id = @iPhone11ProId AND color = 'Black')
    INSERT INTO Product_Color_Options (model_id, color, color_description) VALUES (@iPhone11ProId, 'Black', 'Профессиональный матовый корпус из нержавеющей стали Space Gray.');
IF NOT EXISTS (SELECT 1 FROM Product_Color_Options WHERE model_id = @iPhone11ProId AND color = 'White')
    INSERT INTO Product_Color_Options (model_id, color, color_description) VALUES (@iPhone11ProId, 'White', 'Изысканный корпус из нержавеющей стали Silver.');

IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone11ProId AND storage_gb = 64 AND color = 'Black')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone11ProId, 64, 'Black', 1699.00, 20); 
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone11ProId AND storage_gb = 256 AND color = 'Black')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone11ProId, 256, 'Black', 2399.00, 15); 
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone11ProId AND storage_gb = 512 AND color = 'Black')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone11ProId, 512, 'Black', 2399.00, 5); 
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone11ProId AND storage_gb = 64 AND color = 'White')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone11ProId, 64, 'White', 1699.00, 18);
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone11ProId AND storage_gb = 256 AND color = 'White')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone11ProId, 256, 'White', 2399.00, 12);
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone11ProId AND storage_gb = 512 AND color = 'White')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone11ProId, 512, 'White', 2399.00, 4);

IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone11ProId AND color = 'Black' AND sort_order = 1)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone11ProId, 'Black', 'https://i.ibb.co/KjMmkrbY/Iphone-11-pro-black.webp', 1, 1);
IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone11ProId AND color = 'Black' AND sort_order = 2)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone11ProId, 'Black', 'https://i.ibb.co/TB1XtjKJ/Iphone-11-pro-black-2.webp', 0, 2);
IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone11ProId AND color = 'White' AND sort_order = 1)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone11ProId, 'White', 'https://i.ibb.co/7t8DYbFW/Iphone-11-pro-white.webp', 1, 1);
IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone11ProId AND color = 'White' AND sort_order = 2)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone11ProId, 'White', 'https://i.ibb.co/99SQjw17/Iphone-11-pro-white-2.webp', 0, 2);



PRINT '*** Заполнение данных для iPhone 11 и iPhone 11 Pro (BYN) завершено ***';