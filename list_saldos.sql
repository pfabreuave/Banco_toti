-- LISTA DE SALDO DE CONTAS

SELECT conta.numero AS "NUMERO CONTA", cliente.nome AS "NOME CLIENTE",
                 ROUND(conta.saldo, 2) AS "SALDO CONTA"
				        
FROM conta
JOIN cliente ON (conta.id = cliente.id)
ORDER BY numero;