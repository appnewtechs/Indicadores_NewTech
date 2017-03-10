-- CREATE TABLE usuario(id_usuario int not null AUTO_INCREMENT ,
--                      login varchar(20) not null,
--                       nome varchar(60),
--                       email varchar(100),
--                       senha varchar(30),
--                       dt_cadastro datetime,
--                       dt_alter datetime,
--                       PRIMARY KEY (id_usuario))

--    CREATE TABLE grupo(id_grupo int not null AUTO_INCREMENT ,
--                       descricao varchar(60) not null,
--                       dt_cadastro datetime,
--                       dt_alter datetime,
--                       PRIMARY KEY (id_grupo))            
                      
--   CREATE TABLE loja (id_loja int not null AUTO_INCREMENT,
--                      id_grupo int not null REFERENCES grupo(id_grupo),
--                       descricao varchar(60),
--                       cnpj varchar(20),
--                          matriz bit,
--                       inicio_expediente int,
--                       final_expediente int,
--                       dt_cadastro datetime,
--                       dt_alter datetime,
--                       PRIMARY KEY (id_loja))
--                       
-- CREATE table usuario_grupo (id_usuario_grupo int not null AUTO_INCREMENT, 
--                             id_grupo int not null REFERENCES grupo(id_grupo),
--                             id_usuario int not null REFERENCES usuario(id_usuario),
--                             PRIMARY KEY (id_usuario_grupo))
--       
-- alter table top5GruposAno ADD COLUMN loja varchar(60)
-- alter table top5GruposDia  ADD COLUMN loja varchar(60);
-- alter table top5GruposMes ADD COLUMN loja varchar(60);
-- alter table top5ProdutosAno ADD COLUMN loja varchar(60);
-- alter table top5ProdutosDia ADD COLUMN loja varchar(60);
-- alter table top5ProdutosMes ADD COLUMN loja varchar(60);
-- alter table top5VendedorAno ADD COLUMN loja varchar(60);
-- alter table top5VendedorDia ADD COLUMN loja varchar(60);
-- alter table top5VendedorMes ADD COLUMN loja varchar(60);


-- CONSULTA LOJAS (TELA)
select DISTINCT a.descricao as loja   
from loja a
INNER JOIN grupo b
  on b.id_grupo=a.id_grupo
INNER JOIN usuario_grupo c
  on c.id_grupo=b.id_grupo
INNER JOIN usuario d
  on d.id_usuario=c.id_usuario  
WHERE d.login='andreas'
ORDER BY a.descricao ASC;
                      



                      
                      
                     
                      
                      
                      
                      
                     