use ecommerce;
show tables;
desc sales;
select * from sales;

delimiter \\
create trigger stock_check before insert on sales
for each row
	begin
		case new.un_stock
			when 0 then set new.Avail_stock = 'Indisponível';
            when > 1 then set new.Aval_stock = 'Disponível';
		end case;
	end //
delimiter ;

delimiter //
create trigger null_email_check after insert on client_perfil
for each row
	if (new.Email is null) then
		insert into user_messages (message, idClient) values(concat('Atualize seu e-mail, ', new.Fname), new.IdClient);
    else
		insert into user_messages (message, idClient) values(concat('Error ', new.Fname), new.idClient);
	end if;