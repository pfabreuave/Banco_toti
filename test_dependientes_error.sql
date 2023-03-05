-- Esta é uma solução onde o nome do representante é colocado na linha representado, 
-- mas não será possível devido a inconsistências na tabela cliente_conta, especificamente 
-- no id 26, 27 y 30, fica ainda como amostra para uma solução a ser implementada após corrigindo a 
-- tabela cliente_conta

--- DEPENDIENTES

SELECT DISTINCT 
	   c.nome AS "NOME CLIENTE", 
	   rep.dependente as BOOLEAN,
	   rep.id_conta AS "NUMERO CONTA",
       CASE WHEN rep.dependente = false 
				 THEN 'REPRESENTANTE' ELSE 
				(SELECT cc.nome 
				 FROM cliente AS cc 
				 WHERE dep.id_conta = cc.id) END AS GERARQUIA
				 
FROM cliente_conta AS dep 
JOIN cliente_conta AS rep ON (dep.id_conta = rep.id_conta)
JOIN cliente c ON (rep.id_cliente = c.id) AND
				   dep.dependente = true
ORDER BY rep.id_conta, rep.dependente ASC;