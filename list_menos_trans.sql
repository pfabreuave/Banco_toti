-- AS 5 CONTAS COM MENOS TRANSAÇÕES

SELECT transacao.id_cliente_conta AS "CONTA CLIENTE", cliente.nome AS "NOME CLIENTE",
    	COUNT(*) AS Quantidade
        
FROM transacao
	
JOIN cliente 
	ON (transacao.id_cliente_conta = cliente.id)
        
    GROUP BY transacao.id_cliente_conta 
    ORDER BY Quantidade ASC
    LIMIT 5; 