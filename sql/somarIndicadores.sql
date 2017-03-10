USE indicadores;
DROP PROCEDURE somarIndicadores;
CREATE PROCEDURE somarIndicadores()
BEGIN
  truncate table indicadores_loja_ano;
  truncate table indicadores_loja_mes;
  truncate table indicadores_loja_dia;

  CREATE TEMPORARY TABLE IF NOT EXISTS movimentos_temp AS (select a.loja,
                                                                  a.dataVenda,
                                                                  a.totalVenda,
                                                                  b.id_loja,
                                                                  b.inicio_expediente,
                                                                  b.final_expediente,
                                                                  now() dt_cadastro
                                                          from movimento a
                                                          INNER JOIN loja b
                                                            on b.cnpj=a.loja
                                                          where year(a.dataVenda)=year(now()));


  INSERT INTO indicadores_loja_ano (id_loja,
                                    movimento_ano,
                                    clientes_ano,
                                    media_mov_ano,
                                    vendas_periodo,
                                    media_horas,
                                    dt_cadastro)
  select a.id_loja, 
         sum(a.totalVenda) movimento_ano,
         count(1) clientes_ano,
         avg(a.totalVenda) media_mov_ano,
         sum(a.totalVenda) vendas_periodo,
         a.final_expediente-a.inicio_expediente media_horas,
         dt_cadastro dataAtual
   from movimentos_temp a
   group by a.id_loja,
            media_horas,
            dt_cadastro;
          
   drop table movimentos_temp;
   
   CREATE TEMPORARY TABLE IF NOT EXISTS movimentos_temp AS (select a.loja,
                                                                  a.dataVenda,
                                                                  a.totalVenda,
                                                                  b.id_loja,
                                                                  b.inicio_expediente,
                                                                  b.final_expediente,
                                                                  now() dt_cadastro
                                                          from movimento a
                                                          INNER JOIN loja b
                                                            on b.cnpj=a.loja
                                                          where month(a.dataVenda)=month(now()));
   
   INSERT INTO indicadores_loja_mes (id_loja,
                                    movimento_mes,
                                    clientes_mes,
                                    media_mov_mes,
                                    vendas_periodo,
                                    media_horas,
                                    dt_cadastro)
  select a.id_loja, 
         sum(a.totalVenda) movimento_mes,
         count(1) clientes_mes,
         avg(a.totalVenda) media_mov_mes,
         sum(a.totalVenda) vendas_periodo,
         a.final_expediente-a.inicio_expediente media_horas,
         dt_cadastro dataAtual
   from movimentos_temp a
   group by a.id_loja,
            media_horas,
            dt_cadastro;
  
   drop table movimentos_temp;
   
   CREATE TEMPORARY TABLE IF NOT EXISTS movimentos_temp AS (select a.loja,
                                                                  a.dataVenda,
                                                                  a.totalVenda,
                                                                  b.id_loja,
                                                                  b.inicio_expediente,
                                                                  b.final_expediente,
                                                                  now() dt_cadastro
                                                          from movimento a
                                                          INNER JOIN loja b
                                                            on b.cnpj=a.loja
                                                          where day(a.dataVenda)=day(now()));
   
   INSERT INTO indicadores_loja_dia (id_loja,
                                    movimento_dia,
                                    clientes_dia,
                                    media_mov_dia,
                                    vendas_periodo,
                                    media_horas,
                                    dt_cadastro)
  select a.id_loja, 
         sum(a.totalVenda) movimento_dia,
         count(1) clientes_dia,
         avg(a.totalVenda) media_mov_dia,
         sum(a.totalVenda) vendas_periodo,
         a.final_expediente-a.inicio_expediente media_horas,
         dt_cadastro dataAtual
   from movimentos_temp a
   group by a.id_loja,
            media_horas,
            dt_cadastro;
            
   drop table movimentos_temp;
END;