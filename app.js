var express=require('express');
var app=express();
var path = require("path");
var mysql = require('mysql');
var bodyParser=require('body-parser');
var usuario='andreas';
var id_usuario=1;

app.use(express.static(path.resolve(__dirname,'css')));
app.use(express.static(path.resolve(__dirname,'js')));
app.use(express.static(path.resolve(__dirname, 'img')));
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.set('view engine', 'ejs'); 

app.post("/consolidar",function(req,res){
    var cons_id_loja=req.body.cons_id_loja;
    var cons_selecionado=req.body.cons_selecionado;
    
   
    var connection = mysql.createConnection({
                            host     : '104.196.222.196',
                            user     : 'newtech',
                            password : 'newtech',
                            database : 'indicadores'});

    connection.connect(function(err){
        if(err) throw err;
        
        connection.query('delete from filtro_lojas where id_usuario=?',[id_usuario],function(err){
            if (err) throw err;    
        });
        
        for(i in cons_id_loja){
            if(cons_selecionado[i]=='1')
                {
                        connection.query('insert into filtro_lojas (id_usuario,id_loja) values (?,?)',[id_usuario,cons_id_loja[i]],function(err){
                            if (err) throw err;                            
                    });        
                }
        }
        
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

        res.render('dia',valores);
        
        connection.end();        
    });
});
});

app.post('/comparativoDias',function(req,res){
    var compDias_id_loja=req.body;
    //var compDias_selecionado=req.body.compDias_selecionado;
    //var compDias_datas=req.body.compDias_datas.split(',');
    console.log(compDias_id_loja);
    //console.log(compDias_selecionado);
    //console.log(compDias_datas);
    //enviar os filtros para a base;
    //MAKE CALL
    // DB
    res.send("Opa.... terminou aqui");
});


app.post('/comparativoMeses',function(req,res){
        //dec e conf var
    //MAKE CALL
    // DB
   res.render('comparativos_mes'); 
});

app.post('/comparativoHoje',function(req,res){
    //dec e conf var
    //MAKE CALL
    //DB
    
  res.render('comparativos_hoje');
});

app.get("/dia",function(req,res){    
            
   var connection = mysql.createConnection({
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
    
                res.render('dia',valores);
        });
        
        connection.end();        
    });          
});

app.get("/mes",function(req,res){
            
    var connection = mysql.createConnection({
                            host     : '104.196.222.196',
                            user     : 'newtech',
                            password : 'newtech',
                            database : 'indicadores'});

    connection.connect(function(err){
        if(err) throw err;
        
        connection.query('call buscaDados(?,?)',[2,usuario],function(err,rows){
           if(err) throw err;
            
                var top5vendedores=JSON.stringify(rows[0]);            
                var top5produtos=JSON.stringify(rows[1]);
                var top5grupos=JSON.stringify(rows[2]);
                var indicadores=JSON.stringify(rows[3]);
                var lojas=JSON.stringify(rows[4]);
                        
                var valores={"tipo" : "Mês",
                 "top5vendedores" : top5vendedores,
                 "top5produtos" : top5produtos,
                 "top5grupos" : top5grupos,
                 "indicadores" : JSON.parse(indicadores),
                 "lojas" : JSON.parse(lojas)};  
            
                res.render('dia',valores);
        });
        
        connection.end();        
    });       
});

app.get("/ano",function(req,res){
   var connection = mysql.createConnection({
                            host     : '104.196.222.196',
                            user     : 'newtech',
                            password : 'newtech',
                            database : 'indicadores'});

    connection.connect(function(err){
        if(err) throw err;
        
        connection.query('call buscaDados(?,?)',[3,usuario],function(err,rows){
           if(err) throw err;
            
                var top5vendedores=JSON.stringify(rows[0]);            
                var top5produtos=JSON.stringify(rows[1]);
                var top5grupos=JSON.stringify(rows[2]);
                var indicadores=JSON.stringify(rows[3]);
                var lojas=JSON.stringify(rows[4]);
            
                var valores={"tipo" : "Ano",
                 "top5vendedores" : top5vendedores,
                 "top5produtos" : top5produtos,
                 "top5grupos" : top5grupos,
                 "indicadores" : JSON.parse(indicadores),
                 "lojas" : JSON.parse(lojas)};  
    
                res.render('dia',valores);
        });
        
        connection.end();        
    });       
});

app.get("/login",function(req,res){
    res.render('login');
});

app.use(function(req,res){
    res.status(404).send("Arquivo não encontrado!");    
});

const PORT = process.env.PORT || 8080;
app.listen(PORT, () => {
  console.log(`App listening on port ${PORT}`);
  console.log('Press Ctrl+C to quit.');
});