# 👋 DESAFIO
Replique a modelagem do projeto lógico de banco de dados para o cenário de e-commerce. Fique atento às definições de chave primária e estrangeira, assim como aos constraints presentes no cenário modelado. Perceba que dentro desta modelagem haverá relacionamentos presentes no modelo EER. Sendo assim, consulte como proceder para estes casos. Além disso, aplique o mapeamento de modelos aos refinamentos propostos no módulo de modelagem conceitual.

Assim como demonstrado durante o desafio, realize a criação do Script SQL para criação do esquema do banco de dados. Posteriormente, realize a persistência de dados para realização de testes. Especifique ainda queries mais complexas dos que apresentadas durante a explicação do desafio. Sendo assim, crie queries SQL com as cláusulas abaixo:

- Recuperações simples com SELECT Statement
- Filtros com WHERE Statement
- Crie expressões para gerar atributos derivados
- Defina ordenações dos dados com ORDER BY
- Condições de filtros aos grupos - HAVING Statement
- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados

##
### Diretrizes:

- Não há um mínimo de queries a serem realizadas;
- Os tópicos suscetíveis devem ser mais extensos nas queries;
- Elabore perguntas específicas para as consultas realizadas.



##
### Objetivo:
[Relembrando] Aplique o mapeamento para o cenário:

**Refine o modelo apresentado acrescentando os seguintes pontos:**

- Cliente PJ e PF – Uma conta pode ser PJ ou PF, mas não pode ter as duas informações;
- Pagamento – Pode ter cadastrado mais de uma forma de pagamento;
- Entrega – Possui status e código de rastreio;

**Algumas das perguntas que podes fazer para embasar as queries SQL:**

- Quantos pedidos foram feitos por cada cliente?
- Algum vendedor também é fornecedor?
- Relação de produtos fornecedorese estoques;
- Relação de nomes dos fornecedores e nomes dos produtos;

