select * from clientes;

INSERT INTO clientes (cpf, sobrenome, nome) VALUES ('789', 'Almeida',  'Geraldo');

UPDATE clientes SET nome = 'Antônio'; -- sem WHERE, atualiza todos os registros

UPDATE clientes SET nome = 'Fernando' WHERE sobrenome = 'Back';

UPDATE clientes SET nome = 'Maricleide' WHERE id = 2;

ALTER TABLE clientes ADD CONSTRAINT unique_cpf UNIQUE (cpf);

SELECT id FROM clientes WHERE cpf = '789';

-- em um único comando, busca qual o ID e atualiza o registro
UPDATE clientes 
	SET nome = 'Geraldo' 
	WHERE id = (SELECT id FROM clientes WHERE cpf = '789'); -- inline SELECT

INSERT INTO clientes (nome, sobrenome, cpf) VALUES ('Teste', 'Testando', '124');

DELETE FROM clientes WHERE cpf = '124';


SELECT * FROM clientes 
	WHERE nome = 'Fernando'
	AND sobrenome = 'Silva';

SELECT * FROM clientes 
	WHERE nome = 'Fernando'
	OR nome = 'Geraldo';

SELECT * FROM clientes
WHERE nome IN ('Fernando', 'Geraldo');

SELECT * FROM clientes
WHERE nome != 'Fernando';

SELECT * FROM clientes
	WHERE nome LIKE '%er%';

SELECT * FROM clientes
	WHERE sobrenome LIKE '%o';

INSERT INTO contas (numero, saldo, id_cliente)
	VALUES (1, 10, 1);
INSERT INTO contas (numero, saldo, id_cliente)
	VALUES (2, 20, 2);
INSERT INTO contas (numero, saldo, id_cliente)
	VALUES (3, 30, 3);

select * from contas;

SELECT * FROM contas
	WHERE saldo BETWEEN 15 AND 50;

SELECT * FROM contas
	WHERE saldo >= 30;

SELECT * FROM clientes 
	WHERE nome <> 'Fernando'
	ORDER BY sobrenome DESC;

SELECT * FROM contas
ORDER BY saldo DESC;

INSERT INTO clientes (nome, sobrenome, cpf)
	VALUES ('Fernando', 'Almeida', '34534');

SELECT nome FROM clientes
	GROUP BY nome;

select * from clientes
	ORDER BY ID;

ALTER TABLE CLIENTES
ADD COLUMN estado_civil character varying(20);

UPDATE clientes SET estado_civil = 'solteiro';
UPDATE clientes SET estado_civil = 'casado' WHERE id IN (3, 6);

SELECT COUNT(*) AS QTD_CASADOS FROM clientes
WHERE estado_civil = 'casado';

SELECT COUNT(estado_civil) AS QTD, estado_civil FROM clientes
GROUP BY estado_civil;

SELECT AVG(saldo) AS MEDIA_SALDO
	FROM contas;

INSERT INTO contas (numero, saldo, id_cliente)
	VALUES (4, 50, 6);
INSERT INTO contas (numero, saldo, id_cliente)
	VALUES (5, 70, 7);

SELECT AVG(c.saldo) AS media_saldo, cli.estado_civil AS estado_civil
	FROM contas c, clientes cli
	WHERE c.id_cliente = cli.id
	GROUP BY cli.estado_civil;

SELECT AVG(c.saldo) AS media_saldo, cli.estado_civil AS estado_civil
	FROM contas c
	JOIN clientes cli ON c.id_cliente = cli.id
	GROUP BY cli.estado_civil;


SELECT SUM(SALDO) AS COFRE
FROM CONTAS;

SELECT MAX(C.SALDO) AS SALDO, CLI.NOME
	FROM CONTAS C
	JOIN CLIENTES CLI
		ON C.ID_CLIENTE = CLI.ID
	GROUP BY CLI.NOME;

SELECT MIN(SALDO) FROM CONTAS;


SELECT C.*, CLI.NOME
	FROM CONTAS C
	INNER JOIN CLIENTES CLI
		ON C.ID_CLIENTE = CLI.ID
	WHERE CLI.NOME = 'Fernando'
	AND CLI.SOBRENOME = 'Back';

