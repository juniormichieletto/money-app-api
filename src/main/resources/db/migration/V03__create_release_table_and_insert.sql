CREATE TABLE releases (
	id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
	description VARCHAR(50) NOT NULL,
	due_date DATE NOT NULL,
	pay_date DATE,
	value DECIMAL(10,2) NOT NULL,
	observation VARCHAR(100),
	type VARCHAR(20) NOT NULL,
	id_category BIGINT(20) NOT NULL,
	id_person BIGINT(20) NOT NULL,
	FOREIGN KEY (id_category) REFERENCES category(id),
	FOREIGN KEY (id_person) REFERENCES person(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO releases (description, due_date, pay_date, value, observation, type, id_category, id_person) values ('Salario mensal', '2017-06-10', null, 6500.00, 'Distribuicao de lucros', 'RECIPE', 1, 1);
INSERT INTO releases (description, due_date, pay_date, value, observation, type, id_category, id_person) values ('Bahamas', '2017-02-10', '2017-02-10', 100.32, null, 'EXPENSIVE', 2, 2);
INSERT INTO releases (description, due_date, pay_date, value, observation, type, id_category, id_person) values ('Top Club', '2017-06-10', null, 120, null, 'RECIPE', 3, 3);
INSERT INTO releases (description, due_date, pay_date, value, observation, type, id_category, id_person) values ('CEMIG', '2017-02-10', '2017-02-10', 110.44, 'Geracao', 'RECIPE', 3, 4);
INSERT INTO releases (description, due_date, pay_date, value, observation, type, id_category, id_person) values ('DMAE', '2017-06-10', null, 200.30, null, 'EXPENSIVE', 3, 5);
INSERT INTO releases (description, due_date, pay_date, value, observation, type, id_category, id_person) values ('Extra', '2017-03-10', '2017-03-10', 1010.32, null, 'RECIPE', 4, 6);
INSERT INTO releases (description, due_date, pay_date, value, observation, type, id_category, id_person) values ('Bahamas', '2017-06-10', null, 500, null, 'RECIPE', 1, 7);
INSERT INTO releases (description, due_date, pay_date, value, observation, type, id_category, id_person) values ('Top Club', '2017-03-10', '2017-03-10', 400.32, null, 'EXPENSIVE', 4, 8);
INSERT INTO releases (description, due_date, pay_date, value, observation, type, id_category, id_person) values ('Despachante', '2017-06-10', null, 123.64, 'Multas', 'EXPENSIVE', 3, 9);
INSERT INTO releases (description, due_date, pay_date, value, observation, type, id_category, id_person) values ('Pneus', '2017-04-10', '2017-04-10', 665.33, null, 'RECIPE', 5, 10);
INSERT INTO releases (description, due_date, pay_date, value, observation, type, id_category, id_person) values ('Cafe', '2017-06-10', null, 8.32, null, 'EXPENSIVE', 1, 5);
INSERT INTO releases (description, due_date, pay_date, value, observation, type, id_category, id_person) values ('Eletronicos', '2017-04-10', '2017-04-10', 2100.32, null, 'EXPENSIVE', 5, 4);
INSERT INTO releases (description, due_date, pay_date, value, observation, type, id_category, id_person) values ('Instrumentos', '2017-06-10', null, 1040.32, null, 'EXPENSIVE', 4, 3);
INSERT INTO releases (description, due_date, pay_date, value, observation, type, id_category, id_person) values ('Cafe', '2017-04-10', '2017-04-10', 4.32, null, 'EXPENSIVE', 4, 2);
INSERT INTO releases (description, due_date, pay_date, value, observation, type, id_category, id_person) values ('Lanche', '2017-06-10', null, 10.20, null, 'EXPENSIVE', 4, 1);