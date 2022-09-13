# BDforECOMMERCE
Trata-se de um esquema de EER de um projeto conceitual de um eCommerce. Requisito para avanço no bootcamp: Database Experience.
-------------------------------------------------------------------------------
Objetivos e Considerações:
* Cliente PJ e PF – Uma conta pode ser PJ ou PF, mas não pode ter as duas informações:
— Decidi por generalizar  CPF e CNPJ, trazendo a informação de número fiscal.  
* Pagamento – Pode ter cadastrado mais de uma forma de pagamento;
— Utilizei um especificação na entidade Pagamento, pois informações da forma de pagamento, bem como possíveis devoluções estariam de forma independente no esquema.
* Entrega – Possui status e código de rastreio;
— Incluí conforme o objetivo.
