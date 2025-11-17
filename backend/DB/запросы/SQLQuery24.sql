DECLARE @AppleBrandId INT = (SELECT id FROM Brands WHERE name = 'Apple');

IF NOT EXISTS (SELECT 1 FROM Product_Models WHERE model_name = 'iPhone 13' AND brand_id = @AppleBrandId)
BEGIN
    INSERT INTO Product_Models (brand_id, model_name, description, display_size_in, processor_name) 
    VALUES (
        @AppleBrandId, 
        'iPhone 13', 
        'iPhone 13 получил самый большой скачок в автономности среди всех предыдущих моделей. Он оснащен чипом A15 Bionic, который обеспечивает невероятную скорость работы, и улучшенной двойной камерой с функцией "Киноэффект" для видео. Яркий Super Retina XDR OLED-дисплей, защита Ceramic Shield и прочный алюминиевый корпус.', 
        6.1, 
        'A15 Bionic'
    );
END
DECLARE @iPhone13Id INT = (SELECT id FROM Product_Models WHERE model_name = 'iPhone 13' AND brand_id = @AppleBrandId);

IF NOT EXISTS (SELECT 1 FROM Product_Color_Options WHERE model_id = @iPhone13Id AND color = 'Black')
    INSERT INTO Product_Color_Options (model_id, color, color_description) VALUES (@iPhone13Id, 'Black', 'Классический черный алюминиевый корпус с диагональным расположением камер.');
IF NOT EXISTS (SELECT 1 FROM Product_Color_Options WHERE model_id = @iPhone13Id AND color = 'White')
    INSERT INTO Product_Color_Options (model_id, color, color_description) VALUES (@iPhone13Id, 'White', 'Стильный белый корпус с улучшенной защитой от воды и пыли.');

IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone13Id AND storage_gb = 128 AND color = 'Black')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone13Id, 128, 'Black', 1699.00, 30); 
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone13Id AND storage_gb = 256 AND color = 'Black')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone13Id, 256, 'Black', 2099.00, 20); -- 1699 + 400
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone13Id AND storage_gb = 512 AND color = 'Black')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone13Id, 512, 'Black', 2399.00, 10); -- 2099 + 300

IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone13Id AND storage_gb = 128 AND color = 'White')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone13Id, 128, 'White', 1699.00, 25); 
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone13Id AND storage_gb = 256 AND color = 'White')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone13Id, 256, 'White', 2099.00, 18);
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone13Id AND storage_gb = 512 AND color = 'White')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone13Id, 512, 'White', 2399.00, 7);

IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone13Id AND color = 'Black' AND sort_order = 1)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone13Id, 'Black', 'https://i.ibb.co/jqFs2rQ/Iphone-13-14-black.webp', 1, 1);
IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone13Id AND color = 'Black' AND sort_order = 2)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone13Id, 'Black', 'https://i.ibb.co/7dZ7Mr0C/Iphone-13-14-black-2.webp', 0, 2);
IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone13Id AND color = 'Black' AND sort_order = 3)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone13Id, 'Black', 'https://i.ibb.co/bMGSqpQM/Iphone-13-14-black-3.webp', 0, 3);
IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone13Id AND color = 'White' AND sort_order = 1)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone13Id, 'White', 'https://i.ibb.co/93sDwDJs/Iphone-13-14-white.webp', 1, 1);
IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone13Id AND color = 'White' AND sort_order = 2)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone13Id, 'White', 'https://i.ibb.co/C3YpGRTr/Iphone-13-14-white-2.webp', 0, 2);
IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone13Id AND color = 'White' AND sort_order = 3)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone13Id, 'White', 'https://i.ibb.co/dwsNFLJN/Iphone-13-14-white-3.webp', 0, 3);

IF NOT EXISTS (SELECT 1 FROM Product_Models WHERE model_name = 'iPhone 13 Pro' AND brand_id = @AppleBrandId)
BEGIN
    INSERT INTO Product_Models (brand_id, model_name, description, display_size_in, processor_name) 
    VALUES (
        @AppleBrandId, 
		'iPhone 13 Pro',
        'iPhone 13 Pro — это первое поколение Pro-моделей с технологией ProMotion, которая обеспечивает адаптивную частоту обновления дисплея до 120 Гц. Уменьшенный вырез ("челка") и трехкамерная система с кинематографическим режимом. Корпус из нержавеющей стали и матового стекла. Чип A15 Bionic с 5-ядерным графическим процессором.', 
        6.1, 
        'A15 Bionic'
    );
END
DECLARE @iPhone13ProId INT = (SELECT id FROM Product_Models WHERE model_name = 'iPhone 13 Pro' AND brand_id = @AppleBrandId);

IF NOT EXISTS (SELECT 1 FROM Product_Color_Options WHERE model_id = @iPhone13ProId AND color = 'Black')
    INSERT INTO Product_Color_Options (model_id, color, color_description) VALUES (@iPhone13ProId, 'Black', 'Корпус из нержавеющей стали (цвет Graphite) с матовой задней панелью.');
IF NOT EXISTS (SELECT 1 FROM Product_Color_Options WHERE model_id = @iPhone13ProId AND color = 'White')
    INSERT INTO Product_Color_Options (model_id, color, color_description) VALUES (@iPhone13ProId, 'White', 'Профессиональный корпус из нержавеющей стали Silver.');

IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone13ProId AND storage_gb = 128 AND color = 'Black')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone13ProId, 128, 'Black', 2099.00, 15); 
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone13ProId AND storage_gb = 256 AND color = 'Black')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone13ProId, 256, 'Black', 2499.00, 10); 
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone13ProId AND storage_gb = 512 AND color = 'Black')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone13ProId, 512, 'Black', 2799.00, 5); 

IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone13ProId AND storage_gb = 128 AND color = 'White')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone13ProId, 128, 'White', 2099.00, 12);
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone13ProId AND storage_gb = 256 AND color = 'White')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone13ProId, 256, 'White', 2499.00, 8);
IF NOT EXISTS (SELECT 1 FROM Products WHERE model_id = @iPhone13ProId AND storage_gb = 512 AND color = 'White')
    INSERT INTO Products (model_id, storage_gb, color, price, stock_quantity) VALUES (@iPhone13ProId, 512, 'White', 2799.00, 4);

IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone13ProId AND color = 'Black' AND sort_order = 1)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone13ProId, 'Black', 'https://i.ibb.co/fdXq1r2H/Iphone-13-14-pro-black.webp', 1, 1);
IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone13ProId AND color = 'Black' AND sort_order = 2)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone13ProId, 'Black', 'https://i.ibb.co/fdXq1r2H/Iphone-13-14-pro-black-2.webp', 0, 2);
IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone13ProId AND color = 'White' AND sort_order = 1)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone13ProId, 'White', 'https://i.ibb.co/fdQ5LkXy/Iphone-13-14-pro-white.webp', 1, 1);
IF NOT EXISTS (SELECT 1 FROM Product_Images WHERE model_id = @iPhone13ProId AND color = 'White' AND sort_order = 2)
    INSERT INTO Product_Images (model_id, color, image_url, is_main, sort_order) VALUES (@iPhone13ProId, 'White', 'https://i.ibb.co/q37LGKxc/Iphone-13-14-pro-white-2.webp', 0, 2);


PRINT '*** Заполнение данных для iPhone 13 и iPhone 13 Pro (BYN) завершено ***';