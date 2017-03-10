-- CONSTRAINTS DE FILTROS;
-- alter table filtro_lojas add CONSTRAINT FK_LOJAS_FILTRO FOREIGN KEY (id_loja) REFERENCES loja(id_loja);
-- alter table filtro_lojas add CONSTRAINT FK_USUARIOS_FILTRO FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario);

-- CONSTRAINTS DOS GRUPOS DE USUÁRIO;
-- alter table usuario_grupo add constraint FK_USUARIO_USUARIO_GRUPO FOREIGN KEY (id_usuario) references usuario(id_usuario);
-- alter table usuario_grupo add constraint FK_GRUPO_USUARIO_GRUPO FOREIGN KEY (id_grupo) references grupo(id_grupo);


-- CONSTRAINTS DE LOJAS
-- ALTER table loja ADD CONSTRAINT FK_GRUPO_LOJA FOREIGN KEY (id_grupo) REFERENCES grupo(id_grupo);

SELECT * FROM loja;
-- CONSTRAINTS DOS INDICADORES;

-- alter table indicadores_loja_ano ADD constraint FK_LOJA_INDICADORES_LOJA_ANO FOREIGN KEY (id_loja) references loja(id_loja);
-- alter table indicadores_loja_dia ADD constraint FK_LOJA_INDICADORES_LOJA_DIA FOREIGN KEY (id_loja) references loja(id_loja);
-- alter table indicadores_loja_mes ADD constraint FK_LOJA_INDICADORES_LOJA_MES FOREIGN KEY (id_loja) references loja(id_loja);

-- CONSTRAINTS DOS GRUPOS;
-- alter table top5GruposAno ADD CONSTRAINT fk_loja_top5GruposAno foreign key (id_loja) REFERENCES loja(id_loja);
-- alter table top5GruposDia  ADD CONSTRAINT fk_loja_top5GruposDia  foreign key (id_loja) REFERENCES loja(id_loja);
-- alter table top5GruposMes  ADD CONSTRAINT fk_loja_top5GruposMes  foreign key (id_loja) REFERENCES loja(id_loja);
-- alter table top5ProdutosAno ADD CONSTRAINT fk_loja_top5ProdutosAno  foreign key (id_loja) REFERENCES loja(id_loja);
-- alter table top5ProdutosDia ADD CONSTRAINT fk_loja_top5ProdutosDia  foreign key (id_loja) REFERENCES loja(id_loja);
-- alter table top5ProdutosMes ADD CONSTRAINT fk_loja_top5ProdutosMes  foreign key (id_loja) REFERENCES loja(id_loja); 
-- alter table top5VendedorAno ADD CONSTRAINT fk_loja_top5VendedorAno foreign key (id_loja) REFERENCES loja(id_loja); 
-- alter table top5VendedorDia ADD CONSTRAINT fk_loja_top5VendedorDia foreign key (id_loja) REFERENCES loja(id_loja);
-- alter table top5VendedorMes ADD CONSTRAINT fk_loja_top5VendedorMes foreign key (id_loja) REFERENCES loja(id_loja);

-- 
-- delete from top5GruposAno;
-- delete from top5GruposDia;
-- delete from top5GruposMes;
-- delete from top5ProdutosAno;
-- delete from top5ProdutosDia;
-- delete from top5ProdutosMes;
-- delete from top5VendedorAno;
-- delete from top5VendedorDia;
-- delete from top5VendedorMes;


-- ALTER TABLE usuario_grupo ADD CONSTRAINT UN_USUARIO_GRUPO UNIQUE (id_usuario)

