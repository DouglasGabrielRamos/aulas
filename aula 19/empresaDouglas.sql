SELECT nome, salario
FROM empregados
WHERE salario > (SELECT AVG(salario) FROM empregados);

//neste exemplo a subconsulta (SELECT AVG(salario) FROM empregados) calcula o salario medio, e a colsulta externa seleciona empregados com salarios acima da media.//

use empresaisadora;

UPDATE departamentos SET localizacao = 'são paulo' WHERE nome = 'vendas';

use empresaisadora;

UPDATE departamentos SET localizacao = 'rio de janeiro' WHERE nome = 'marketing';

use empresaisadora;

UPDATE departamentos SET localizacao = 'são paulo' WHERE nome = 'ti';

use empresaisadora; 

UPDATE departamentos SET localizacao = 'belo horizonte' WHERE nome = 'recursos humanos';

use empresaisadora;

SELECT nome 
FROM empregados
WHERE departamento_id IN(SELECT departamento_id FROM departamentos WHERE localizacao = 'são paulo');

use empresaisadora;

//exemplo:salario maior que qualquer salario no departamento de ti//

SELECT nome, salario
FROM empregados
WHERE salario > ANY(SELECT salario FROM empregados WHERE departamento_id = (SELECT departamento_id FROM departamentos WHERE nome = 'ti'));

use empresaisadora;

//ALL//

SELECT nome, salario
FROM empregados 
WHERE salario > ALL (SELECT departamento_id = (SELECT empregados_id FROM departamentos WHERE nome = 'ti'));

use empresaisadora;

ALTER TABLE empregados 
ADD titulo VARCHAR(100);

use empresaisadora;

CREATE TABLE cargos (
    cargos_id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100),
    departamento_id INT,
    salario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (departamento_id) REFERENCES departamentos(departamento_id)
);

//

use empresaisadora;

ALTER TABLE empregados 
DROP COLUMN salario;

use empresaisadora;

UPDATE empregados SET titulo = 'Gerente' WHERE nome = 'isadora scaheffer';
UPDATE empregados SET titulo = 'Assistente' WHERE nome = 'joão viotr';
UPDATE empregados SET titulo = 'Analista' WHERE nome = 'magna souza';
UPDATE empregados SET titulo = 'Desenvolvedor' WHERE nome = 'rubem schumacher';  

use empresaisadora;

INSERT INTO cargos (titulo, departamento_id, salario) VALUES ('Gerente', 1, 8000.00), ('Assistente', 1, 4000.00), ('Analista', 2, 4500.00), ('Desenvolvedor', 3, 6000.00), ('Assistente', 4, 3500.00), ('Analista', 2, 4600.00);

use empresaisadora;

SELECT nome 
FROM empregados
WHERE (departamento_id, titulo) IN (SELECT departamento_id, titulo FROM cargos WHERE salario > 5000);
