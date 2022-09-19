delimiter \\
create procedure procedure_managment(
	in nome_p varchar(20),
    in email_p varchar(30),
    in senha_p varchar(60)
)
begin
	if(length(senha_p) < 10 and length(senha_p) > 7) then
		insert into user (nome, email, senha, data_cadastro) values(nome_p, email_p, md5(senha_p), now());
		select * from user;
	else
		select 'Forneça outra senha' as Message_error;
	end if;
        
end \\
        