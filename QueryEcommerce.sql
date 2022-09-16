-- inserção de dados e queries
use ecommerce;

show tables;
-- idCLient, Fname, Minit, Lname, CPF, Address
insert into Clients (Fname, Minit, Lname, CPF, Address)
	   values('John', 'J', 'Jons', 789456123, 'rua contorno sul 512, Marte - Entropia'),
			(),
            (),
            (),
            (),
            ();
            
            
	-- idProduct, Pname, classification_kids boolean, category('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis'), avaliação, size
    insert into product (Pname, classification_kids, category, avaliação, size) values
									('Fone de ouviso', false, 'Eletrônico', '4',null),
                                    ('Barbie Elsa',true,'Brinquedos','3',null),
                                    ('Body Carters',true,'Vestimenta','5',null),
                                    ('Microfone Vedo - Youtube', False,'Eletrônico','4',null),
                                    ('Sofá retrátil',False,'Móveis','3','3x0.57x0.80'),
                                    ('Farinha de arroz', False,'Alimentos','2',null),
                                    ('Fire Stick Amazon',False,'Eletrônico','3',null);
				
select * from clients;
select * from product;
-- idOrder, idOrderClient, orderStatus, orderDescription, sendValue, paymentCash
insert into ordes (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values
									(1, default,'compra via aplicativo',null,1),
                                    (2, default,'compra via aplicativo',50,0),
                                    (3,'Confirmado',null,null,1),
                                    (4, default,'compra via web site',150,0);
                                    
-- idPOproduct, idPOorder, poQunatity, poStatus
select * from orders;
insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus) values
						(1,5,2,null),
                        (2,5,1,null),
                        (3,6,1,null);

-- storageLocation, quantity
insert into productStorage (storageLocation,quantity) values
							('Rio de Janeiro',1000),
                            ('Rio de Janeiro',500),
                            ('São Paulo',10),
                            ('São Paulo',100),
                            ('São Paulo',10),
                            ('Brasília',60);

-- idLproduct, idLstorage, location
insert into storageLocation (idLproduct, idLstorage, location) values
							(1,2,'RJ'),
                            (2,6,'GO');
                            
-- idSupplier, SocialName, CNPJ, contact
insert into supplier (SocialName, CNPJ, contact) values
					('Almeida e filhos', 023456789000112,'21985474'),
                    ('Almeida e filhos', 011045781000101,'21598745'),
                    ('Eletrônicos Valma', 054125874000164,'30145215');
                    
select * from supplier;
-- idPsSupplier, idPsProduct, quantity
insert into productSupplier (idPsSupplier, idPsProduct, quantity) values
						(1,1,500),
                        (1,2,400),
                        (2,4,633),
                        (3,3,5),
                        (2,5,10);
                        
-- idSeller, SocialName, AbstName, CNPJ, CPF, location, contact
insert into seller (SocialName, AbstName, CNPJ, CPF, location, contact) values
					('Tech eletronics', null, 023456451000112, null, 'Rio de Janeiro', 219946287),
                    ('Botique Durgas', null, 01245632169, null, 'Rio de Janeiro', 269845110),
                    ('Kids World', null, 011063251000165, null, 'São Paulo', 917458811);
                    
select * from seller;
-- idPseller, idPproduct, prodQuantity
insert into productSeller (idPseller, idPproduct, prodQuantity) values
						(1,6,80),
                        (2,7,10);

select * from productSeller;

-- Saber o número de clientes
select count(*) from clients;

-- Verificar os pedidos feitos pelos clientes
select * from clients c, orders o where c.idClient = idOrderClient;
-- especificar os atributos recuperados
select Fname,Lname, idOrder, orderStatus from clients c, orders o where c.idClient = idOrderClient;
select concat(Fname,' ',Lname) as Client, idOrder as Request, orderStatus as Status from clients c, orders o where c.idClient = idOrderClient;

select count(*) from clients c, orders o
			where c.idClient = o.idOrderClient;

-- Recupera pedido com produto associado
select c.idClient, Fname, count(*) as Number_of_orders from clients c 
					inner join orders o ON c.idClient = o.idOrderClient
					inner join product p on p.idPOorder = o.idOrder
			group by idCLient;

-- Recuperar quantos pedidos foram realizados pelos clientes
select c.idClient, Fname, count(*) as Number_of_orders from clients c 
					inner join orders o ON c.idClient = o.idOrderClient
			group by idCLient;

                                    
                                    