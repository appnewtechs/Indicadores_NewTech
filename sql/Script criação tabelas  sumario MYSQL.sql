-- alter table  top5GruposDia    DROP COLUMN LOJA;
-- alter table  top5GruposMes    DROP COLUMN LOJA;
-- alter table  top5ProdutosAno  DROP COLUMN LOJA;
-- alter table  top5ProdutosDia  DROP COLUMN LOJA;
-- alter table  top5ProdutosMes  DROP COLUMN LOJA;
-- alter table  top5VendedorAno  DROP COLUMN LOJA;
-- alter table  top5VendedorDia  DROP COLUMN LOJA;
-- alter table  top5VendedorMes  DROP COLUMN LOJA;
-- alter table  top5GruposAno ADD COLUMN id_loja int REFERENCES loja(id_loja);
-- alter table  top5GruposDia    ADD COLUMN id_loja int REFERENCES loja(id_loja);
-- alter table  top5GruposMes    ADD COLUMN id_loja int REFERENCES loja(id_loja);
-- alter table  top5ProdutosAno  ADD COLUMN id_loja int REFERENCES loja(id_loja);
-- alter table  top5ProdutosDia  ADD COLUMN id_loja int REFERENCES loja(id_loja);
-- alter table  top5ProdutosMes  ADD COLUMN id_loja int REFERENCES loja(id_loja);
-- alter table  top5VendedorAno  ADD COLUMN id_loja int REFERENCES loja(id_loja);
-- alter table  top5VendedorDia  ADD COLUMN id_loja int REFERENCES loja(id_loja);
-- alter table  top5VendedorMes  ADD COLUMN id_loja int REFERENCES loja(id_loja)









