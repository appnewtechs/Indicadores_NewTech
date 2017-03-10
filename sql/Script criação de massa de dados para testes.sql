-- insert into usuario (login,nome,email,senha,dt_cadastro) VALUES ('andreas','Andreas Werthm?ller','andreas.werthmuller@newtechs.com.br','testando',NOW());
-- select * from usuario

 -- insert into grupo (descricao,dt_cadastro) values ('Grupo diferente',NOW());
 -- select * from grupo

-- select * from movimento limit 10
-- 
-- insert into loja (id_grupo, descricao, cnpj, matriz, inicio_expediente, final_expediente, dt_cadastro)
-- values (2,'Loja da newtechs 1', '44189389999130',1,6,22,NOW())

-- select * from loja
--select * from grupo
select * from usuario_grupo;
-- insert into usuario_grupo (id_grupo,id_usuario) values (1,1)
 
 show index from usuario_grupo
-- drop index UN_USUARIO_GRUPO on usuario_grupo 

 
 -- alter table usuario_grupo drop index un_usuario_grupo
 
 -- alter table usuario_grupo drop constraint UN_USUARIO_GRUPO;
 -- alter table usuario_grupo drop FOREIGN KEY FK_GRUPO_USUARIO_GRUPO;


-- drop table usuario_grupo
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