CREATE TABLE Orders (
    id INT PRIMARY KEY IDENTITY(1,1),
    customer_name NVARCHAR(100) NOT NULL,
    phone NVARCHAR(20) NOT NULL,
    address NVARCHAR(255) NOT NULL,
    payment_method NVARCHAR(50) NOT NULL,
    total_price DECIMAL(18, 2) NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    status NVARCHAR(50) DEFAULT 'New' 
);

CREATE TABLE Order_Items (
    id INT PRIMARY KEY IDENTITY(1,1),
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price_at_purchase DECIMAL(18, 2) NOT NULL, 

    FOREIGN KEY (order_id) REFERENCES Orders(id),
    FOREIGN KEY (product_id) REFERENCES Products(id)
);