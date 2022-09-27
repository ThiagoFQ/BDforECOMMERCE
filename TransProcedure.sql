 -- exemplo com transações
 -- sem determinar o rollback explicitamente ele não acontece
set @@autocommit = 0; 

-- startando uma transação
start transaction;
 -- query sql recuperando o id de order
	 select
        -- declarando uma variável com @
		@orderNumber:=max(orderNumbers)+1
	from
		orders;

	-- inserção de dados em order
	insert into orders( orderNumbers,
						orderDate,
						requiredDate,
						shippedDate,
						orderStatus	
					)
	values(@orderNumber,
			'2011-10-31',
			'2011-11-30',
			'2016-09-01',
			'EM PROGRESSO'
			);

	savepoint insercao_em_order;
    
	select
        -- declarando uma variável com @
		@orderNumber:=max(orderNumbers)
	from
		orders;

	-- inserindo linhas de order
	insert into ordersDetails(orderNumbers,
							 productCode,
							 quantityOrder,
							 price
							 )
	values(@orderNumber,170354, 20, '136'), (@orderNumber,121124, 60, '12.90'); 
      
savepoint insercao_em_orderdetails;

-- comitando as modificações
commit;

-- ROLLBACK TO SAVEPOINT insercao_em_order;
rollback;