drop procedure sql_fail;

delimiter //
create procedure sql_fail()
begin
	-- sai da transação caso ocorra uma exeção sql
	declare exit handler for sqlexception
	begin
		rollback;
        select 'Erro na transação' as Resultado;
	end;
    start transaction;
    insert into orders values(3,'2011-10-31', '2011-11-30', '2016-09-01', 'EM PROGRESSO');     
	insert into ordersDetails values(3, '17_0354', 20, '136', 2), (3, '12_1124', 60, '12.90', 2);
end//

call sql_fail();

select * from orders;