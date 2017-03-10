create table indicadores_loja_dia(id_loja int not null REFERENCES loja(id_loja),
                                  movimento_dia float,
                                  clientes_dia int,
                                  media_mov_dia float,
                                  dt_cadastro datetime);
                              
create table indicadores_loja_mes(id_loja int not null REFERENCES loja(id_loja),
                                  movimento_mes float,
                                  clientes_mes int,
                                  media_mov_mes float,
                                  dt_cadastro datetime);                                  
                                  
create table indicadores_loja_ano(id_loja int not null REFERENCES loja(id_loja),
                                  movimento_ano float,
                                  clientes_ano int,
                                  media_mov_ano float,
                                  dt_cadastro datetime);