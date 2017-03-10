USE indicadores;
DROP PROCEDURE somarTop5Dia;
CREATE PROCEDURE somarTop5Dia()
BEGIN
  truncate table top5VendedorDia;
  truncate table top5GruposDia;
  truncate table top5ProdutosDia;
  
  CREATE TEMPORARY TABLE IF NOT EXISTS movimentos_temp AS (select a.descricaoProduto descricaoProduto,
                                                                  a.nomeUsuarioVenda nomeUsuarioVenda,
                                                                  a.descricaoGrupo descricaoGrupo,
                                                                  now() dt_cadastro,
                                                                  id_loja
                                                          from movimento a
                                                          INNER JOIN loja b
                                                            on b.cnpj=a.loja
                                                          where day(a.dataVenda)=day(now()));
                                                          
  INSERT INTO top5ProdutosDia (qtde,descricaoProduto,id_loja)
  select count(1) qtde,descricaoProduto,id_loja
  from movimentos_temp
  group by descricaoProduto,id_loja
  order by qtde desc
  LIMIT 5;
  
  INSERT INTO top5GruposDia (qtde,descricaoGrupo,id_loja)
  select count(1) qtde,descricaoGrupo,id_loja
  from movimentos_temp
  group by descricaoGrupo,id_loja
  order by qtde desc
  LIMIT 5;
  
  INSERT INTO top5VendedorDia (qtde,nomeUsuarioVenda,id_loja)
  select count(1) qtde,nomeUsuarioVenda,id_loja
  from movimentos_temp
  group by nomeUsuarioVenda,id_loja
  order by qtde desc
  LIMIT 5;
  
  drop table movimentos_temp;
END;