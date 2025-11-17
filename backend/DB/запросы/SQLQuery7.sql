DECLARE @AppleBrandId INT = (SELECT id FROM Brands WHERE name = 'Apple');

INSERT INTO Product_Models (brand_id, model_name, description, display_size_in, processor_name) VALUES 
(@AppleBrandId, 'iPhone 15 Pro', 'Премиальный смартфон с титановым корпусом.', 6.1, 'A17 Pro');

DECLARE @iPhone15ProId INT = SCOPE_IDENTITY();