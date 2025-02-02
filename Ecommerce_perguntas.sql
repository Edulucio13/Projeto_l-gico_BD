-- 1. Quantos pedidos foram feitos por cada cliente?
SELECT c.idClient, c.Fname, COUNT(o.idOrder) AS total_orders
FROM clients c
LEFT JOIN orders o ON c.idClient = o.idOrderClient
GROUP BY c.idClient, c.Fname;

-- 2. Algum vendedor também é fornecedor?
SELECT s.idSeller, s.SocialName AS SellerName, sup.idSupplier, sup.SocialName AS SupplierName
FROM sellers s
JOIN suppliers sup ON s.CNPJ = sup.CNPJ OR s.CPF = sup.contact;

-- 3. Relação de produtos fornecidos e estoques
SELECT p.Pname, ps.quantity AS supplier_quantity, st.quantity AS storage_quantity
FROM products p
LEFT JOIN productSupplier ps ON p.idProduct = ps.idPsProduct
LEFT JOIN productStorages st ON p.idProduct = st.idProduct;

-- 4. Relação de nomes dos fornecedores e nomes dos produtos
SELECT sup.SocialName AS SupplierName, p.Pname AS ProductName
FROM suppliers sup
JOIN productSupplier ps ON sup.idSupplier = ps.idPsSupplier
JOIN products p ON ps.idPsProduct = p.idProduct;

-- 5. Filtros com WHERE Statement
SELECT * FROM products WHERE Category = 'Eletrônico';

-- 6. Crie expressões para gerar atributos derivados
SELECT idClient, Fname, Lname, 
       COUNT(idOrder) AS total_orders, 
       SUM(sendValue) AS total_spent
FROM clients c
LEFT JOIN orders o ON c.idClient = o.idOrderClient
GROUP BY idClient, Fname, Lname;

-- 7. Defina ordenações dos dados com ORDER BY
SELECT Pname, Avaliacao
FROM products
ORDER BY Avaliacao DESC;

-- 8. Condições de filtros aos grupos - HAVING Statement
SELECT idClient, Fname, COUNT(idOrder) AS total_orders
FROM clients c
LEFT JOIN orders o ON c.idClient = o.idOrderClient
GROUP BY idClient, Fname
HAVING COUNT(idOrder) > 1;

-- 9. Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados
SELECT o.idOrder, c.Fname, p.Pname, po.poQuantity, o.orderStatus
FROM orders o
JOIN clients c ON o.idOrderClient = c.idClient
JOIN productOrder po ON o.idOrder = po.idPOorder
JOIN products p ON po.idPOproduct = p.idProduct;


