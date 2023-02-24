-- operações de conta

SELECT t.id_cliente_conta AS "NUMERO DE CONTA", 
	   c.nome AS "NOME CLIENTE", 
	   tt.descricao AS "DESCRICAO",
    	COUNT(*) AS "Quant Operaciones", SUM(t.valor) AS TOTAL
					  	         
FROM transacao AS t
JOIN tipo_transacao AS tt
	ON (id_tipo_transacao = tt.id) 

JOIN cliente AS c
	ON (t.id_cliente_conta = c.id)

GROUP BY t.id_cliente_conta, id_tipo_transacao 
	
ORDER BY t.id_cliente_conta ASC;
	