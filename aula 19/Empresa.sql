use empresaisadora;

CREATE TABLE departamentos (
    departamento_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

use empresaisadora;

CREATE TABLE empregados (
    empregados_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    salario DECIMAL(10, 2) NOT NULL,
    departamento_id INT, 
    FOREIGN KEY (departamento_id) REFERENCES departamentos(departamento_id)
);

use empresaisadora;

INSERT INTO departamentos (nome) VALUES
('vendas'),
('marketing'),
('ti'),
('recursos humanos');

use empresaisadora;

INSERT INTO empregados (nome, salario, departamento_id) VALUES
('isadora schaeffer', 15000.00, 1),
('joão vitor', 5000.00, 1),
('magna souza', 13000.00, 2),
('rubem schumacher', 10000.00, 3);

use empresaisadora;

ALTER TABLE departamentos
ADD COLUMN localizacao VARCHAR(100);

use empresaisadora;

consulta para encontrar com salário acima da media

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

//continuação aula 19

use empresaisadora;

SELECT departamentos.nome, AVG(cargos.salario)
FROM empregados 
JOIN cargos ON empregados.departamento_id = cargos.departamento_id
JOIN departamentos ON empregados.departamento_id = departamentos.departamento_id
GROUP BY departamentos.nome
HAVING AVG(cargos.salario) > 5000.00;

Procedimentos Armazenados

Procedimentos Armazenados são conjuntos de comandos SQL que podem ser executados como uma única unidade. Eles permitem encapsular a lógica de negócios no banco de dados e são úteis para tarefas repetitivas.



Sintaxe:

DELIMITER //

CREATE PROCEDURE procedure_name (parameters)
BEGIN
    -- Comandos
END //

DELIMITER ;


DELIMITER: Define um delimitador alternativo para que o MySQL reconheça o fim do procedimento.
CREATE PROCEDURE: Cria o procedimento.
procedure_name: Nome do procedimento.
parameters: Parâmetros de entrada (IN), saída (OUT) ou ambos (INOUT).
BEGIN ... END: Delimita o bloco de comandos SQL.


exemplo: Aumentar o salário dos empregados de um determinado departamento.

este comando chama o procedimento e aumenta os salários em 10% para todos os empregados no departamento com departamento_id = 1.


DELIMITER //

CREATE PROCEDURE AumentarSalario(
    IN dep_id INT,
    IN percentual DECIMAL(5,2)
)
BEGIN
    UPDATE cargos 
    SET salario = salario + (salario * (percentual / 100))
    WHERE departamento_id = dep_id;
END //

DELIMITER ;


Uso do Procedimento:

CALL AumentarSalario(1, 10);

para ver o procedimento:
SHOW CREATE PROCEDURE AumentarSalario;

