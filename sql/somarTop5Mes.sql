USE indicadores;
DROP PROCEDURE somarTop5Mes;
CREATE PROCEDURE somarTop5Mes
()
BEGIN
  truncate table top5VendedorMes;
  truncate table top5GruposMes;
  truncate table top5ProdutosMes;
  
  CREATE TEMPORARY TABLE IF NOT EXISTS movimentos_temp AS (select a.descricaoProduto,
                                                                  a.nomeUsuarioVenda,
                                                                  a.descricaoGrupo,
                                                                  now() dt_cadastro,
                                                                  id_loja
                                                          from movimento a
                                                          INNER JOIN loja b
                                                            on b.cnpj=a.loja
                                                          where month(a.dataVenda)=month(now()));                           
  INSERT INTO top5ProdutosMes (qtde,descricaoProduto,id_loja)
  select count(1) qtde,descricaoProduto,id_loja
  from movimentos_temp
  group by descricaoProduto,id_loja
  order by qtde desc
  LIMIT 5;
  
  INSERT INTO top5GruposMes (qtde,descricaoGrupo,id_loja)
  select count(1) qtde,descricaoGrupo,id_loja
  from movimentos_temp
  group by descricaoGrupo,id_loja
  order by qtde desc
  LIMIT 5;
  
  INSERT INTO top5VendedorMes (qtde,nomeUsuarioVenda,id_loja)
  select count(1) qtde,nomeUsuarioVenda,id_loja
  from movimentos_temp
  group by nomeUsuarioVenda,id_loja
  order by qtde desc
  LIMIT 5;
  
  drop table movimentos_temp;
END;