
CREATE TABLE CLIENTES (

	cliente_id int(1) PRIMARY KEY AUTO_INCREMENT not null,
    pedido_id int(11),
    nome varchar(100),
	telefone varchar(14)
);

CREATE TABLE ENDEREÇOS (
	endereco_id int(11) PRIMARY KEY AUTO_INCREMENT not null,
	cliente_id int(11),
	bairro varchar(100),
	cidade varchar(100),
	cep int(11),
	rua varchar(100)
);

CREATE TABLE CARGOS (
	cargo_id int(1) PRIMARY KEY AUTO_INCREMENT not null,
	cargo varchar(100)
);

CREATE TABLE FUNCIONARIOS (
	funcionaro_id int(1) PRIMARY KEY AUTO_INCREMENT not null,
	cargo_id int(11),
	telefone varchar(14),
	FOREIGN KEY(cargo_id) REFERENCES CARGOS (cargo_id)
);


CREATE TABLE INGREDIENTES (
	ingrediente_id int(11) PRIMARY KEY AUTO_INCREMENT not null,
    descrição varchar(100)

);

CREATE TABLE PIZZAS (
	pizza_id int(11) PRIMARY KEY AUTO_INCREMENT not null,
	ingrediente_id int(11),
	nome varchar(100),
	preço float(16,2),
	tamanho float(10),
	FOREIGN KEY(ingrediente_id) REFERENCES INGREDIENTES (ingrediente_id)

);

CREATE TABLE CARDAPÍOS (
	cardapio_id int(11) PRIMARY KEY AUTO_INCREMENT not null,
	pizza_id int(11),
    FOREIGN KEY(pizza_id) REFERENCES PIZZAS (pizza_id)
    
);

CREATE TABLE PEDIDOS (
	pedido_id int(11) PRIMARY KEY AUTO_INCREMENT not null,
	pizza_id int(11),
	cliente_id int(11),
    funcionaro_id int(11),
	dia date,
	
    FOREIGN KEY(pizza_id) REFERENCES PIZZAS (pizza_id),
    FOREIGN KEY(cliente_id) REFERENCES CLIENTES (cliente_id),
    FOREIGN KEY(funcionaro_id) REFERENCES FUNCIONARIOS (funcionaro_id)
);


CREATE TABLE itens_pedidos (
pedido_id int(11) PRIMARY key AUTO_INCREMENT not null,
pizza_id int(11),
qtd float(10),
preco float(16,2),
FOREIGN KEY(pedido_id) REFERENCES PEDIDOS (pedido_id),
FOREIGN KEY(pizza_id) REFERENCES PIZZAS (pizza_id)
);

