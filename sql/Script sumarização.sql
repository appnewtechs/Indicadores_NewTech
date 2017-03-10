-- create table top5ProdutosDia (descricaoProduto varchar(255),qtde int)
-- create table top5ProdutosMes (descricaoProduto varchar(255),qtde int)
-- create table top5ProdutosAno (descricaoProduto varchar(255),qtde int)
-- 
-- create table top5VendedorDia (nomeUsuarioVenda varchar(255),qtde int)
-- create table top5VendedorMes (nomeUsuarioVenda varchar(255),qtde int)
-- create table top5VendedorAno (nomeUsuarioVenda varchar(255),qtde int)
--                             
-- create table top5GruposDia (descricaoGrupo varchar(255),qtde int)
-- create table top5GruposMes (descricaoGrupo varchar(255),qtde int)
-- create table top5GruposAno (descricaoGrupo varchar(255),qtde int)


-- INSERT INTO top5ProdutosMes (qtde,descricaoProduto)
-- select count(1) qtde,descricaoProduto
-- from movimento
-- where month(dataVenda)=month(SYSDATE()) 
-- group by descricaoProduto
-- order by qtde desc
-- LIMIT 5

select descricaoProduto,qtde from top5ProdutosMes


-- INSERT INTO top5VendedorMes (qtde,nomeUsuarioVenda)
-- select count(1) qtde,nomeUsuarioVenda
-- from movimento
-- where month(dataVenda)=month(SYSDATE()) 
-- group by nomeUsuarioVenda
-- order by qtde desc
-- LIMIT 5



-- insert into top5GruposMes (qtde,descricaoGrupo)
-- select count(1) qtde,descricaoGrupo
-- from movimento
-- where month(dataVenda)=month(SYSDATE()) 
-- group by descricaoGrupo
-- order by qtde desc
-- LIMIT 5


select nomeUsuarioVenda,qtde from top5VendedorMes
select descricaoProduto,qtde from top5ProdutosMes
select * from top5GruposMes


-- update top5ProdutosMes set id_loja=2
-- update top5VendedorMes set id_loja=2
-- update top5GruposMes set id_loja=2

select * from filtro_lojas

-- insert into filtro_lojas (id_usuario,id_loja) values (1,2)
















