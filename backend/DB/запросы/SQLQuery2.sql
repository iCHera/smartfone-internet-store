CREATE TABLE Brands (
    id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(100) NOT NULL UNIQUE,
    logo_url NVARCHAR(255) NULL
);

CREATE TABLE Product_Models (
    id INT PRIMARY KEY IDENTITY(1,1),
    brand_id INT NOT NULL,
    model_name NVARCHAR(100) NOT NULL,
    description NVARCHAR(MAX) NULL,
    display_size_in DECIMAL(3,1) NULL,
    processor_name NVARCHAR(100) NULL,
    
    FOREIGN KEY (brand_id) REFERENCES Brands(id)
);

CREATE TABLE Products (
    id INT PRIMARY KEY IDENTITY(1,1),
    model_id INT NOT NULL,
    storage_gb INT NOT NULL, 
    color NVARCHAR(50) NOT NULL, 
    price DECIMAL(18, 2) NOT NULL, 
    stock_quantity INT NOT NULL, 

    FOREIGN KEY (model_id) REFERENCES Product_Models(id),
    UNIQUE (model_id, storage_gb, color)
);


CREATE TABLE Product_Color_Options (
    id INT PRIMARY KEY IDENTITY(1,1),
    model_id INT NOT NULL,
    color NVARCHAR(50) NOT NULL, 
    
    color_description NVARCHAR(255) NULL, 
    
    FOREIGN KEY (model_id) REFERENCES Product_Models(id),
    UNIQUE (model_id, color)
);

CREATE TABLE Product_Images (
    id INT PRIMARY KEY IDENTITY(1,1),
    model_id INT NOT NULL,
    color NVARCHAR(50) NOT NULL, 
    image_url NVARCHAR(255) NOT NULL, 
    is_main BIT NOT NULL DEFAULT 0,
    sort_order INT NOT NULL DEFAULT 0, 

    FOREIGN KEY (model_id) REFERENCES Product_Models(id),

    UNIQUE (model_id, color, image_url)
);