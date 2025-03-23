CREATE TABLE `clientes` (
  `id` INT PRIMARY KEY,
  `nome` VARCHAR,
  `email` VARCHAR UNIQUE,
  `telefone` VARCHAR,
  `tipo` ENUM,
  `cpf_cnpj` VARCHAR UNIQUE
);

CREATE TABLE `fornecedores` (
  `id` INT PRIMARY KEY,
  `nome` VARCHAR,
  `contato` VARCHAR
);

CREATE TABLE `produtos` (
  `id` INT PRIMARY KEY,
  `nome` VARCHAR,
  `preco` DECIMAL,
  `id_fornecedor` INT
);

CREATE TABLE `estoques` (
  `id` INT PRIMARY KEY,
  `id_produto` INT,
  `quantidade` INT
);

CREATE TABLE `pedidos` (
  `id` INT PRIMARY KEY,
  `id_cliente` INT,
  `data_pedido` DATETIME,
  `status` ENUM
);

CREATE TABLE `itens_pedido` (
  `id` INT PRIMARY KEY,
  `id_pedido` INT,
  `id_produto` INT,
  `quantidade` INT,
  `preco_unitario` DECIMAL
);

CREATE TABLE `formas_pagamento` (
  `id` INT PRIMARY KEY,
  `descricao` VARCHAR
);

CREATE TABLE `pagamentos` (
  `id` INT PRIMARY KEY,
  `id_pedido` INT,
  `id_forma_pagamento` INT,
  `valor` DECIMAL
);

CREATE TABLE `entregas` (
  `id` INT PRIMARY KEY,
  `id_pedido` INT,
  `codigo_rastreamento` VARCHAR,
  `status` ENUM
);

ALTER TABLE `produtos` ADD FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedores` (`id`);

ALTER TABLE `estoques` ADD FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id`);

ALTER TABLE `pedidos` ADD FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`);

ALTER TABLE `itens_pedido` ADD FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id`);

ALTER TABLE `itens_pedido` ADD FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id`);

ALTER TABLE `pagamentos` ADD FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id`);

ALTER TABLE `pagamentos` ADD FOREIGN KEY (`id_forma_pagamento`) REFERENCES `formas_pagamento` (`id`);

ALTER TABLE `entregas` ADD FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id`);
