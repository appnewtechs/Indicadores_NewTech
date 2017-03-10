select * from indicadores_loja_dia;
select * from indicadores_loja_mes;
select * from indicadores_loja_ano;

-- insert into indicadores_loja_dia (id_loja,movimento_dia,clientes_dia,media_mov_dia,dt_cadastro) values (2,334.33,233,2323.44,NOW())
-- insert into indicadores_loja_dia (id_loja,movimento_dia,clientes_dia,media_mov_dia,dt_cadastro) values (2,277.33,222,355.99,NOW())

select * from indicadores_loja_dia;


-- MOVIMENTO_DIA -- SOMAR
-- CLIENTES_DIA -- SOMAR
-- MEDIA_MOV_DIA -- MÉDIA


        select sum(a.movimento_ano) movimento,
               SUM((a.vendas_periodo/a.media_horas)*(b.final_expediente-b.inicio_expediente)) projetado,          
               sum(a.clientes_ano) clientesDia,
               avg(a.media_mov_ano) valorMedio,
               sum((a.clientes_ano/a.media_horas)*(b.final_expediente-b.inicio_expediente)) projetadoClientes
              from indicadores_loja_ano a
              INNER JOIN loja b
                ON b.id_loja=a.id_loja
              INNER JOIN grupo c
                ON c.id_grupo=b.id_grupo
              INNER JOIN usuario_grupo d
                on d.id_grupo=c.id_grupo
              INNER JOIN usuario e
                ON e.id_usuario=d.id_usuario
              INNER JOIN filtro_lojas f
                ON f.id_usuario=e.id_usuario
                and f.id_loja=b.id_loja
              WHERE e.login=@ano;


select * from grupo
select * from filtro_lojas
select * from indicadores_loja_dia

-- update indicadores_loja_dia set vendas_periodo=334.33,media_horas=8 where id_loja=2

--insert into filtro_lojas (id_usuario,id_loja) values (1,2)