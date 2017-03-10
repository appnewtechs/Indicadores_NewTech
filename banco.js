  function() { var connection = mysql.createConnection({
                            host     : '104.196.222.196',
                            user     : 'newtech',
                            password : 'newtech',
                            database : 'indicadores'});

    connection.connect(function(err){
        if(err) throw err;
        
        connection.query('call buscaDados(?,?)',[1,usuario],function(err,rows){
            if(err) throw err;
        
                var top5vendedores=JSON.stringify(rows[0]);            
                var top5produtos=JSON.stringify(rows[1]);
                var top5grupos=JSON.stringify(rows[2]);
                var indicadores=JSON.stringify(rows[3]);
                var lojas=JSON.stringify(rows[4]);
            
            var valores={"tipo" : "Dia",
                 "top5vendedores" : top5vendedores,
                 "top5produtos" : top5produtos,
                 "top5grupos" : top5grupos,
                 "indicadores" : JSON.parse(indicadores),
                 "lojas" : JSON.parse(lojas)};  
    
                callback(valores);
        });
        
        connection.end();        
    });        
    }