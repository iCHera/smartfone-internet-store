import { Request, Response } from 'express';
import sql from 'mssql';

export const createOrder = async (req: Request, res: Response) => {
    const { name, phone, address, paymentMethod, items, totalPrice } = req.body;

    console.log('Получен новый заказ:', { name, totalItems: items.length });

    const transaction = new sql.Transaction();

    try {
        await transaction.begin();

        const orderRequest = new sql.Request(transaction);
        orderRequest.input('name', sql.NVarChar, name);
        orderRequest.input('phone', sql.NVarChar, phone);
        orderRequest.input('address', sql.NVarChar, address);
        orderRequest.input('payment', sql.NVarChar, paymentMethod);
        orderRequest.input('total', sql.Decimal(18, 2), totalPrice);

        const orderResult = await orderRequest.query(`
            INSERT INTO Orders (customer_name, phone, address, payment_method, total_price)
            OUTPUT INSERTED.id
            VALUES (@name, @phone, @address, @payment, @total);
        `);

        const orderId = orderResult.recordset[0].id;

        for (const item of items) {
            const checkStockRequest = new sql.Request(transaction);
            checkStockRequest.input('id', sql.Int, item.id);
            const stockResult = await checkStockRequest.query('SELECT stock_quantity FROM Products WHERE id = @id');
            
            const currentStock = stockResult.recordset[0].stock_quantity;

            if (currentStock < item.quantity) {
                throw new Error(`Товара "${item.model_name}" недостаточно на складе. Доступно: ${currentStock}`);
            }

            const updateStockRequest = new sql.Request(transaction);
            updateStockRequest.input('qty', sql.Int, item.quantity);
            updateStockRequest.input('id', sql.Int, item.id);
            await updateStockRequest.query('UPDATE Products SET stock_quantity = stock_quantity - @qty WHERE id = @id');

            const itemRequest = new sql.Request(transaction);
            itemRequest.input('orderId', sql.Int, orderId);
            itemRequest.input('prodId', sql.Int, item.id);
            itemRequest.input('qty', sql.Int, item.quantity);
            itemRequest.input('price', sql.Decimal(18, 2), item.price);

            await itemRequest.query(`
                INSERT INTO Order_Items (order_id, product_id, quantity, price_at_purchase)
                VALUES (@orderId, @prodId, @qty, @price);
            `);
        }

        await transaction.commit();
        
        console.log(`Заказ #${orderId} успешно создан.`);
        res.status(201).json({ message: 'Заказ успешно оформлен!', orderId });

    } catch (err: any) {
        await transaction.rollback();
        console.error('Ошибка создания заказа:', err.message);
        res.status(500).json({ message: err.message || 'Ошибка при оформлении заказа' });
    }
};