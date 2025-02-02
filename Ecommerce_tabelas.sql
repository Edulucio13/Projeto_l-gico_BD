-- Criação do Banco de Dados
CREATE DATABASE ecommerce;
USE ecommerce;

-- Tabela cliente com PJ e PF
CREATE TABLE clients (
    idClient INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(10),
    Minit CHAR(3),
    Lname VARCHAR(20),
    CPF CHAR(11),
    CNPJ CHAR(14),
    Address VARCHAR(30),
    TipoCliente ENUM('PF', 'PJ') NOT NULL,
    CONSTRAINT chk_tipo CHECK (
        (TipoCliente = 'PF' AND CPF IS NOT NULL AND CNPJ IS NULL) OR
        (TipoCliente = 'PJ' AND CNPJ IS NOT NULL AND CPF IS NULL)
    )
);

-- Tabela produto
CREATE TABLE products (
    idProduct INT AUTO_INCREMENT PRIMARY KEY,
    Pname VARCHAR(50) NOT NULL,
    Classification_kids BOOLEAN DEFAULT FALSE,
    Category ENUM('Eletrônico', 'Vestuário', 'Brinquedos', 'Alimentos', 'Móveis') NOT NULL,
    Avaliacao FLOAT DEFAULT 0,
    Size VARCHAR(10)
);

-- Tabela pagamento
CREATE TABLE payments (
    idPayment INT AUTO_INCREMENT PRIMARY KEY,
    idClient INT,
    typePayment ENUM('Boleto', 'Cartão', 'Dois cartões', 'Dinheiro', 'Pix'),
    limitAvailable FLOAT,
    CONSTRAINT fk_payments_clients FOREIGN KEY (idClient) REFERENCES clients(idClient)
);

-- Tabela pedido com status de entrega e código de rastreio
CREATE TABLE orders (
    idOrder INT AUTO_INCREMENT PRIMARY KEY,
    idOrderClient INT,
    orderStatus ENUM('Cancelado', 'Confirmado', 'Em Processamento') DEFAULT 'Em Processamento',
    deliveryStatus ENUM('Enviado', 'Entregue', 'A Caminho', 'Cancelado') DEFAULT 'A Caminho',
    trackingCode VARCHAR(50),
    orderDescription VARCHAR(255),
    sendValue FLOAT DEFAULT 10,
    paymentCash BOOLEAN DEFAULT FALSE,
    CONSTRAINT fk_orders_clients FOREIGN KEY (idOrderClient) REFERENCES clients(idClient)
);

-- Tabela estoque
CREATE TABLE productStorages (
    idProdStorage INT AUTO_INCREMENT PRIMARY KEY,
    idProduct INT,
    storageLocation VARCHAR(255),
    quantity INT DEFAULT 0,
    CONSTRAINT fk_prod_storage_product FOREIGN KEY (idProduct) REFERENCES products(idProduct)
);

-- Tabela fornecedor
CREATE TABLE suppliers (
    idSupplier INT AUTO_INCREMENT PRIMARY KEY,
    SocialName VARCHAR(255) NOT NULL,
    CNPJ CHAR(14) NOT NULL,
    contact CHAR(11) NOT NULL,
    CONSTRAINT unique_suppliers UNIQUE (CNPJ)
);

-- Tabela vendedor
CREATE TABLE sellers (
    idSeller INT AUTO_INCREMENT PRIMARY KEY,
    SocialName VARCHAR(255) NOT NULL,
    AbstName VARCHAR(255),
    CNPJ CHAR(14),
    CPF CHAR(11),
    location VARCHAR(255),
    CONSTRAINT unique_CNPJ_sellers UNIQUE (CNPJ),
    CONSTRAINT unique_CPF_sellers UNIQUE (CPF)
);

-- Tabela produto-vendedor
CREATE TABLE productSeller (
    idPseller INT,
    idProduct INT,
    prodQuantity INT DEFAULT 1,
    PRIMARY KEY (idPseller, idProduct),
    CONSTRAINT fk_product_seller FOREIGN KEY (idPseller) REFERENCES sellers(idSeller),
    CONSTRAINT fk_product_product FOREIGN KEY (idProduct) REFERENCES products(idProduct)
);

-- Tabela produto-pedido
CREATE TABLE productOrder (
    idPOproduct INT,
    idPOorder INT,
    poQuantity INT DEFAULT 1,
    poStatus ENUM('Disponível', 'Sem estoque') DEFAULT 'Disponível',
    PRIMARY KEY (idPOproduct, idPOorder),
    CONSTRAINT fk_productorder_product FOREIGN KEY (idPOproduct) REFERENCES products(idProduct),
    CONSTRAINT fk_productorder_order FOREIGN KEY (idPOorder) REFERENCES orders(idOrder)
);

-- Tabela localização do estoque
CREATE TABLE storageLocation (
    idLproduct INT,
    idLstorage INT,
    location VARCHAR(255) NOT NULL,
    PRIMARY KEY (idLproduct, idLstorage),
    CONSTRAINT fk_storage_location_product FOREIGN KEY (idLproduct) REFERENCES products(idProduct),
    CONSTRAINT fk_storage_location_storage FOREIGN KEY (idLstorage) REFERENCES productStorages(idProdStorage)
);

-- Tabela produto-fornecedor
CREATE TABLE productSupplier (
    idPsSupplier INT,
    idPsProduct INT,
    quantity INT NOT NULL,
    PRIMARY KEY (idPsSupplier, idPsProduct),
    CONSTRAINT fk_product_supplier_supplier FOREIGN KEY (idPsSupplier) REFERENCES suppliers(idSupplier),
    CONSTRAINT fk_product_supplier_product FOREIGN KEY (idPsProduct) REFERENCES products(idProduct)
);
