
/*
call somarTop5Dia();
call somarTop5Mes();
call somarTop5Ano();
call somarIndicadores();
*/
select * from top5GruposMes;
select * from top5ProdutosMes;
select * from top5VendedorMes;

select * from top5GruposAno;
select * from top5ProdutosAno;
select * from top5VendedorAno;

select * from top5GruposDia;
select * from top5ProdutosDia;
select * from top5VendedorDia;

/*
delete from indicadores_loja_ano;
delete from indicadores_loja_dia;
delete from indicadores_loja_mes;
delete from top5GruposDia;
delete from top5ProdutosDia;
delete from top5VendedorDia;
delete from top5GruposAno;
delete from top5ProdutosAno;
delete from top5VendedorAno;
delete from top5GruposMes;
delete from top5ProdutosMes;
delete from top5VendedorMes;
*/

/*
select * FROM indicadores_loja_ano;
select * FROM indicadores_loja_mes;
select * FROM indicadores_loja_dia

select SYSDATE()
SHOW EVENTS FROM indicadores;
SHOW PROCESSLIST
SET GLOBAL event_scheduler = ON;
*/








