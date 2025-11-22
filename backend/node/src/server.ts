import express, { Request, Response, NextFunction } from 'express';
import dotenv from 'dotenv';
import sql from 'mssql'; 
import productRoutes from './routes/productsRoutes';
import orderRoutes from './routes/ordersRoutes';

dotenv.config();

const app = express();
const PORT = process.env.PORT || 8080;

const dbConfig = {
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    server: process.env.DB_SERVER || 'localhost', 
    database: process.env.DB_DATABASE,
    options: {
        encrypt: true,
        trustServerCertificate: true 
    }
};

const startServer = async () => {
    try {
        await sql.connect(dbConfig);
        console.log('Успешное подключение к MSSQL Server!');

        app.use(express.json());

        app.use((req: Request, res: Response, next: NextFunction) => {
            res.header('Access-Control-Allow-Origin', 'http://localhost:5173');
            res.header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE');
            res.header('Access-Control-Allow-Headers', 'Content-Type, Authorization');
            next();
        });

        app.use('/api/products', productRoutes);
        app.use('/api/orders', orderRoutes);

        app.get('/', (req: Request, res: Response) => {
            res.send('Backend Node.js (TypeScript) с mssql работает!');
        });

        app.listen(PORT, () => {
            console.log(`Сервер запущен на порту ${PORT}`);
        });

    } catch (err) {
        console.error('Ошибка подключения к базе данных:', err);
        process.exit(1); 
    }
};

startServer();