import { Request, Response } from 'express';
import sql from 'mssql';

export const getAllProducts = async (req: Request, res: Response) => {
    console.log('Получен запрос на /api/products');
    try {
        const query = `
            SELECT 
                p.id,
                p.price,
                p.storage_gb,
                p.color,
                p.stock_quantity,
                pm.model_name,
                i.image_url
            FROM Products p
            JOIN Product_Models pm ON p.model_id = pm.id
            LEFT JOIN Product_Images i 
                ON p.model_id = i.model_id 
                AND p.color = i.color 
                AND i.is_main = 1   
        `;

        const result = await sql.query(query);

        console.log(`Найдено ${result.recordset.length} товаров.`);
        res.status(200).json(result.recordset);

    } catch (err) {
        console.error('Ошибка выполнения SQL-запроса:', err);
        res.status(500).json({ message: 'Ошибка на стороне сервера' });
    }
};

export const getProductById = async (req: Request, res: Response) => {
    const productId = req.params.id;
    console.log(`Запрос товара с ID: ${productId}`);

    try {
        const productQuery = `
            SELECT 
                p.id, p.price, p.storage_gb, p.color, p.stock_quantity,
                pm.id as model_id, pm.model_name, pm.description as model_description, 
                pm.display_size_in, pm.processor_name,
                pco.color_description
            FROM Products p
            JOIN Product_Models pm ON p.model_id = pm.id
            LEFT JOIN Product_Color_Options pco 
                ON p.model_id = pco.model_id AND p.color = pco.color
            WHERE p.id = @id
        `;

        const request = new sql.Request();
        request.input('id', sql.Int, productId);
        
        const productResult = await request.query(productQuery);

        if (productResult.recordset.length === 0) {
            return res.status(404).json({ message: 'Товар не найден' });
        }

        const product = productResult.recordset[0];

        const imagesQuery = `
            SELECT image_url 
            FROM Product_Images 
            WHERE model_id = @modelId AND color = @color
            ORDER BY sort_order
        `;
        
        const imageRequest = new sql.Request();
        imageRequest.input('modelId', sql.Int, product.model_id);
        imageRequest.input('color', sql.NVarChar, product.color);

        const imagesResult = await imageRequest.query(imagesQuery);

        const images = imagesResult.recordset.map(img => img.image_url);

        const fullProductInfo = {
            ...product,
            images: images
        };

        res.status(200).json(fullProductInfo);

    } catch (err) {
        console.error('Ошибка получения товара:', err);
        res.status(500).json({ message: 'Ошибка сервера' });
    }
};