1 Escreva uma consulta SQL para selecionar o departamento_id e a soma dos intervalos para cada departamento.
Filtre os departamentos onde a soma total dos progressos é maior que R$ 12.000,00.

use empresaisadora;

SELECT departamentos.nome, SUM(cargos.salario)
FROM empregados 
JOIN cargos ON empregados.departamento_id = cargos.departamento_id
JOIN departamentos ON empregados.departamento_id = departamentos.departamento_id
GROUP BY departamentos.nome
HAVING SUM(cargos.salario) > 12000.00;

2 Escreva uma consulta SQL para selecionar o título e o número de funcionários para cada título.
Filtre os títulos onde há mais de 2 funcionários.

use empresaisadora;

SELECT empregados.titulo, COUNT(*)
FROM empregados
GROUP BY empregados.titulo
HAVING COUNT(*) > 2;

3 Escreva uma consulta SQL para selecionar o departamento_id e a média dos intervalos para cada departamento.
Filtre os departamentos onde o salário médio é maior que R$ 4.500,00.

use empregadosisadora;

SELECT departamentos.localizacao, AVG(cargos.salario)
FROM empregados
JOIN cargos ON empregados.titulo = cargos.titulo 
JOIN departamentos ON empregados.departamento_id = departamentos.departamentos_id
GROUP BY departamentos.localizacao
HAVING AVG(cargos.salario) > 4500.00; 

4 Escreva uma consulta SQL para selecionar o departamento_id e o maior salário para cada departamento.
Filtre os departamentos onde o maior salário é superior a R$ 6.000,00.

use empresaisadora;

SELECT departamentos.nome, MAX(cargos.salario)
FROM empregados 
JOIN cargos ON empregados.titulo = cargos.titulo 
JOIN departamentos ON empregados.departamento_id = departamentos.departamento_id
GROUP BY departamentos.localizacao
HAVING MAX(cargos.salario) > 6000.00;

5 Escreva uma consulta SQL para selecionar o departamento_id e o menor salário para cada departamento.
Filtre os departamentos onde o menor salário é superior a R$ 2.500,00.

use empresaisadora;

SELECT departamentos.localizacao, MIN(cargos.salario)
FROM empregados 
JOIN cargos ON empregados.titulo = cargos.titulo 
JOIN departamentos ON empregados.departamento_id = departamentos.departamento_id
GROUP BY departamentos.localizacao
HAVING MIN(cargos.salario) > 2500.00;