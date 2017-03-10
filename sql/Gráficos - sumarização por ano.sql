INSERT INTO top5VendedorAno (qtde,nomeUsuarioVenda)
select count(1) qtde,nomeUsuarioVenda
from movimento
where year(dataVenda)=year(SYSDATE()) 
group by nomeUsuarioVenda
order by qtde desc
LIMIT 5;

insert into top5GruposAno (qtde,descricaoGrupo)
select count(1) qtde,descricaoGrupo
from movimento
where year(dataVenda)=year(SYSDATE()) 
group by descricaoGrupo
order by qtde desc
LIMIT 5;

INSERT INTO top5ProdutosAno (qtde,descricaoProduto)
select count(1) qtde,descricaoProduto
from movimento
where year(dataVenda)=year(SYSDATE()) 
group by descricaoProduto
order by qtde desc
LIMIT 5


select * from top5ProdutosAno;
select * from top5GruposAno;
select * from top5VendedorAno;


update top5ProdutosAno set id_loja=2;
update top5GruposAno set id_loja=2;
update top5VendedorAno set id_loja=2


