USE indicadores;
DROP PROCEDURE somarTop5Ano;
CREATE PROCEDURE somarTop5Ano
()
BEGIN
  truncate table top5VendedorAno;
  truncate table top5GruposAno;
  truncate table top5ProdutosAno;
  
  CREATE TEMPORARY TABLE IF NOT EXISTS movimentos_temp AS (select a.descricaoProduto,
                                                                  a.nomeUsuarioVenda,
                                                                  a.descricaoGrupo,
                                                                  now() dt_cadastro,
                                                                  id_loja
                                                          from movimento a
                                                          INNER JOIN loja b
                                                            on b.cnpj=a.loja
                                                          where year(a.dataVenda)=year(now()));                           
  
  INSERT INTO top5ProdutosAno (qtde,descricaoProduto,id_loja)
  select count(1) qtde,descricaoProduto,id_loja
  from movimentos_temp
  group by descricaoProduto,id_loja
  order by qtde desc
  LIMIT 5;
  
  INSERT INTO top5GruposAno (qtde,descricaoGrupo,id_loja)
  select count(1) qtde,descricaoGrupo,id_loja
  from movimentos_temp
  group by descricaoGrupo,id_loja
  order by qtde desc
  LIMIT 5;
  
  INSERT INTO top5VendedorAno (qtde,nomeUsuarioVenda,id_loja)
  select count(1) qtde,nomeUsuarioVenda,id_loja
  from movimentos_temp
  group by nomeUsuarioVenda,id_loja
  order by qtde desc
  LIMIT 5;
  
  drop table movimentos_temp;
END;