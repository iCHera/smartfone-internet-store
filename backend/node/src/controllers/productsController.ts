import { Request, Response } from 'express';
import sql from 'mssql'; 

export const getAllProducts = async (req: Request, res: Response) => {
    console.log('Получен запрос на /api/products');
    try {
        const result = await sql.query`SELECT * FROM Products`;

        console.log(`Найдено ${result.recordset.length} строк.`);

        res.status(200).json(result.recordset);

    } catch (err) {
        console.error('Ошибка выполнения SQL-запроса:', err);
        res.status(500).json({ message: 'Ошибка на стороне сервера' });
    }
};