DROP PROCEDURE buscaDados;
CREATE PROCEDURE buscaDados
(IN codigoPesquisa int, IN  usuario varchar(30))
BEGIN
    IF codigoPesquisa=1 THEN
        select a.nomeUsuarioVenda,
               SUM(a.qtde) qtde 
        from top5VendedorDia a
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
        WHERE e.login=usuario
        GROUP BY a.nomeUsuarioVenda;
        
        select a.descricaoProduto,
               SUM(a.qtde) qtde 
        from top5ProdutosDia a
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
        WHERE e.login=usuario
        GROUP BY a.descricaoProduto;
        
        select a.descricaoGrupo,
               SUM(a.qtde) qtde 
        from top5GruposDia a
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
        WHERE e.login=usuario
        GROUP BY a.descricaoGrupo;  
        
        select sum(a.movimento_dia) movimento,
               SUM((a.vendas_periodo/a.media_horas)*(b.final_expediente-b.inicio_expediente)) projetado,          
               sum(a.clientes_dia) clientesDia,
               avg(a.media_mov_dia) valorMedio,
               sum((a.clientes_dia/a.media_horas)*(b.final_expediente-b.inicio_expediente)) projetadoClientes
        from indicadores_loja_dia a
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
        WHERE e.login=usuario;
    END IF;
      
     IF codigoPesquisa=2 THEN
        select a.nomeUsuarioVenda,
               SUM(a.qtde) qtde 
        from top5VendedorMes a
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
        WHERE e.login=usuario
        GROUP BY a.nomeUsuarioVenda;
          
        select a.descricaoProduto,
               SUM(a.qtde) qtde 
        from top5ProdutosMes a
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
        WHERE e.login=usuario
        GROUP BY a.descricaoProduto;
        
        select a.descricaoGrupo,
               SUM(a.qtde) qtde 
        from top5GruposMes a
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
        WHERE e.login=usuario
        GROUP BY a.descricaoGrupo;
        
        select sum(a.movimento_mes) movimento,
               SUM((a.vendas_periodo/a.media_horas)*(b.final_expediente-b.inicio_expediente)) projetado,          
               sum(a.clientes_mes) clientesDia,
               avg(a.media_mov_mes) valorMedio,
               sum((a.clientes_mes/a.media_horas)*(b.final_expediente-b.inicio_expediente)) projetadoClientes
        from indicadores_loja_mes a
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
        WHERE e.login=usuario;
    END IF;
    
     IF codigoPesquisa=3 THEN      
        select a.nomeUsuarioVenda,
               SUM(a.qtde) qtde 
        from top5VendedorAno a
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
        WHERE e.login=usuario
        GROUP BY a.nomeUsuarioVenda;
                
        select a.descricaoProduto,
               SUM(a.qtde) qtde 
        from top5ProdutosAno a
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
        WHERE e.login=usuario
        GROUP BY a.descricaoProduto;
                       
        select a.descricaoGrupo,
               SUM(a.qtde) qtde 
        from top5GruposAno a
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
        WHERE e.login=usuario
        GROUP BY a.descricaoGrupo;
        
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
        WHERE e.login=usuario;
      END IF;     
        
     select  a.descricao,
        CASE WHEN e.id_loja is null THEN 0 else 1 END selecionado,
        a.id_loja
     from loja a
     INNER JOIN grupo b
       on b.id_grupo=a.id_grupo
     INNER JOIN usuario_grupo c
       on c.id_grupo=b.id_grupo
     INNER JOIN usuario d
       on d.id_usuario=c.id_usuario  
     LEFT JOIN filtro_lojas e
       on e.id_usuario=d.id_usuario
       and e.id_loja=a.id_loja
     WHERE d.login=usuario
     ORDER BY a.descricao ASC;
END