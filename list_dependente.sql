--- DEPENDIENTES

SELECT DISTINCT 
	   c.nome AS "NOME CLIENTE", 
	   rep.id_conta AS "NUMERO CONTA",
       CASE WHEN rep.dependente = false 
       THEN 'REPRESENTANTE' ELSE '' END AS GERARQUIA
FROM cliente_conta AS dep 
JOIN cliente_conta AS rep ON (dep.id_conta = rep.id_conta)
JOIN cliente c ON (rep.id_cliente = c.id)
WHERE dep.dependente = true
ORDER BY rep.id_conta DESC;