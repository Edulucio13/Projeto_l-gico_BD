-- Inserir dados em clientes
INSERT INTO clients (Fname, Minit, Lname, CPF, CNPJ, Address, TipoCliente) VALUES 
('Carlos', 'A', 'Silva', '12345678901', NULL, 'Rua A', 'PF'),
('Empresa XY', NULL, 'LTDA', NULL, '12345678000199', 'Avenida B', 'PJ');

-- Inserir dados em produtos
INSERT INTO products (Pname, Classification_kids, Category, Avaliacao, Size) VALUES 
('Smartphone', FALSE, 'Eletrônico', 4.5, 'Médio'),
('Camiseta', FALSE, 'Vestuário', 3.9, 'G');

-- Inserir dados em pagamentos
INSERT INTO payments (idClient, typePayment, limitAvailable) VALUES 
(1, 'Cartão', 5000.00),
(2, 'Pix', 15000.00);

-- Inserir dados em pedidos
INSERT INTO orders (idOrderClient, orderStatus, deliveryStatus, trackingCode, orderDescription, sendValue, paymentCash) VALUES 
(1, 'Confirmado', 'A Caminho', 'R12345BR', 'Pedido de um Smartphone', 15.0, FALSE),
(2, 'Em Processamento', 'A Caminho', 'R54321BR', 'Pedido de 5 Camisetas', 20.0, TRUE);

-- Inserir dados em estoques
INSERT INTO productStorages (idProduct, storageLocation, quantity) VALUES 
(1, 'Depósito Central', 100),
(2, 'Depósito Norte', 50);

-- Inserir dados em fornecedores
INSERT INTO suppliers (SocialName, CNPJ, contact) VALUES 
('Fornecedor A', '12345678000101', '11999999999'),
('Fornecedor B', '98765432000102', '11988888888');

-- Inserir dados em vendedores
INSERT INTO sellers (SocialName, AbstName, CNPJ, CPF, location) VALUES 
('Vendedor A', 'VD A', '12345678000201', NULL, 'Shopping X'),
('Vendedor B', 'VD B', NULL, '12345678901', 'Shopping Y');

-- Inserir dados em produto-vendedor
INSERT INTO productSeller (idPseller, idProduct, prodQuantity) VALUES 
(1, 1, 20),
(2, 2, 30);

-- Inserir dados em produto-pedido
INSERT INTO productOrder (idPOproduct, idPOorder, poQuantity, poStatus) VALUES 
(1, 1, 2, 'Disponível'),
(2, 2, 5, 'Sem estoque');

-- Inserir dados em localização do estoque
INSERT INTO storageLocation (idLproduct, idLstorage, location) VALUES 
(1, 1, 'Depósito Central'),
(2, 2, 'Depósito Norte');

-- Inserir dados em produto-fornecedor
INSERT INTO productSupplier (idPsSupplier, idPsProduct, quantity) VALUES 
(1, 1, 50),
(2, 2, 80);

