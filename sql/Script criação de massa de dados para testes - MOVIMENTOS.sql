select codigoLoja,codigoVenda,codigoMovimento,dataVenda,hora
 from movimento limit 100;
 
 
 -- drop table movimentos_temp2
 
 
 insert INTO movimento (codigoLoja, codigoVenda, codigoMovimento, dataVenda, horaVenda, totalVenda, totalProduto, valorUnitario, precoCusto, codigoProduto, descricaoProduto, descricaoGrupo, descricaoSubGrupo, nomeUsuarioVenda, loja, controle, hash, idFechamentoProduto, createdAt, updatedAt)
  select
  codigoLoja, codigoVenda, codigoMovimento, dataVenda, horaVenda, totalVenda, totalProduto, valorUnitario, precoCusto, codigoProduto, descricaoProduto, descricaoGrupo, descricaoSubGrupo, nomeUsuarioVenda, '47173976000120' loja, controle, hash, idFechamentoProduto, createdAt, updatedAt
  from movimento a
  where not exists(select 1
                   from movimento b
                   where a.loja=b.loja 
                   and b.loja='47173976000120')
  limit 500;
 
  
  -- update loja set cnpj='47173976000120',dt_alter=now(),descricao='Loja teste' where id_loja=4;
   
  
 -- select count(1) from movimento where loja='47173976000120'
 
 
 
 