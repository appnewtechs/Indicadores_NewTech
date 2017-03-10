$(document).ready(function(){
    $("[id^=consolidar_check]").each(function(){
        $(this).on('change',function(){
        var objCheck=$(this);
        var objetos=$(this).siblings();
                            
        objetos.each(function(){
            var objeto=$(this);
            if (objeto.prop("name")=="cons_selecionado")
                    objeto.prop('value',objCheck.prop('checked') ? 1 : 0);
                });        
    });
                                 
})});

$(document).ready(function(){
    $('#confirma_Comp_dia').on('click',function(){
       event.preventDefault();        
        
       $('#bloco_top5_vendedores').prop('hidden',true);
       $('#bloco_top5_grupos').prop('hidden',true);
       $('#bloco_top5_produtos').prop('hidden',true);
       $('#bloco_movimento_diario').prop('hidden',true);
       $('#bloco_movimento_do_dia').prop('hidden',true);
       $('#bloco_clientes_do_dia').prop('hidden',true);
       $('#bloco_faturamento_mes').prop('hidden',true);
       $('#bloco_faturamento_hoje').prop('hidden',true);
       $('#bloco_faturamento_retroativo').prop('hidden',false);
        
        var valores=[
          ['Dias', 'Loja 1', 'Loja 2', 'Loja 3'],
          ['01', 1000, 400, 200],
          ['02', 1170, 460, 250],
          ['03', 660, 1120, 300],
          ['04', 1030, 540, 350]
        ];
        
        var form_comparar_dias=JSON.stringify($('#form_comparar_dias').serializeArray());
        console.log(form_comparar_dias);
        
        $.ajax({
            method: 'POST',
            context: form_comparar_dias,
            url:'/comparativoDias',
            complete: function(dados){
                console.log('retorno requisição ajax');
                console.log(dados);
            }
        });
            
        
        google.charts.setOnLoadCallback(drawChart4('Nome do Grupo/Empresas',
                                                   'Comparativo por Dias X Lojas',
                                                   'horizontal',
                                                    valores,
                                                    document.getElementById('barchart_material_dias'))) ;
       
    });
});

$(document).ready(function(){
    $('#confirma_Comp_meses').on('click',function(){
       event.preventDefault();        
        
       $('#bloco_top5_vendedores').prop('hidden',true);
       $('#bloco_top5_grupos').prop('hidden',true);
       $('#bloco_top5_produtos').prop('hidden',true);
       $('#bloco_movimento_diario').prop('hidden',true);
       $('#bloco_movimento_do_dia').prop('hidden',true);
       $('#bloco_clientes_do_dia').prop('hidden',true);       
       $('#bloco_faturamento_retroativo').prop('hidden',true);
       $('#bloco_faturamento_mes').prop('hidden',false);
        
        var valores=[
          ['Meses', 'Loja 1', 'Loja 2', 'Loja 3'],
          ['01', 1000, 400, 200],
          ['02', 1170, 460, 250],
          ['03', 660, 1120, 300],
          ['04', 1030, 540, 350]
        ];
                
       google.charts.setOnLoadCallback(drawChart4('Nome do Grupo/Empresas',
                                                 'Comparativo por Meses X Lojas',
                                                 'horizontal',
                                                 valores,
                                                 document.getElementById('barchart_material_meses'))); 
     
       
    });
});




$(document).ready(function(){
    $('#confirma_Comp_meses').on('click',function(){
       event.preventDefault();        
        
       $('#bloco_top5_vendedores').prop('hidden',true);
       $('#bloco_top5_grupos').prop('hidden',true);
       $('#bloco_top5_produtos').prop('hidden',true);
       $('#bloco_movimento_diario').prop('hidden',true);
       $('#bloco_movimento_do_dia').prop('hidden',true);
       $('#bloco_clientes_do_dia').prop('hidden',true);       
       $('#bloco_faturamento_retroativo').prop('hidden',true);
       $('#bloco_faturamento_hoje').prop('hidden',true);
        
       $('#bloco_faturamento_mes').prop('hidden',false);
        
        var valores=[
          ['Meses', 'Loja 1', 'Loja 2', 'Loja 3'],
          ['01', 1000, 400, 200],
          ['02', 1170, 460, 250],
          ['03', 660, 1120, 300],
          ['04', 1030, 540, 350]
        ];
                
       google.charts.setOnLoadCallback(drawChart4('Nome do Grupo/Empresas',
                                                 'Comparativo por Meses X Lojas',
                                                 'horizontal',
                                                 valores,
                                                 document.getElementById('barchart_material_meses'))); 
     
       
    });
});



$(document).ready(function(){
    $('#confirma_Comp_hoje').on('click',function(){
       event.preventDefault();        
        alert('Item indisponível');
       /* 
       $('#bloco_top5_vendedores').prop('hidden',true);
       $('#bloco_top5_grupos').prop('hidden',true);
       $('#bloco_top5_produtos').prop('hidden',true);
       $('#bloco_movimento_diario').prop('hidden',true);
       $('#bloco_movimento_do_dia').prop('hidden',true);
       $('#bloco_clientes_do_dia').prop('hidden',true);       
       $('#bloco_faturamento_retroativo').prop('hidden',true);
       $('#bloco_faturamento_mes').prop('hidden',true);
       $('#bloco_faturamento_hoje').prop('hidden',false);
        
        var valores=[
          ['Meses', 'Loja 1', 'Loja 2', 'Loja 3'],
          ['01', 1000, 400, 200],
          ['02', 1170, 460, 250],
          ['03', 660, 1120, 300],
          ['04', 1030, 540, 350]
        ];
                
       google.charts.setOnLoadCallback(drawChart4('Nome do Grupo/Empresas',
                                                 'Comparativo por Dias X Lojas',
                                                 'horizontal',
                                                 valores,
                                                 document.getElementById('barchart_diaX_lojas'))); 
        
        
        google.charts.setOnLoadCallback(drawChart4('Nome do Grupo/Empresas',
                                                 'Comparativo por Meses X Lojas',
                                                 'horizontal',
                                                 valores,
                                                 document.getElementById('barchart_mesesX_lojas'))); 
        
        google.charts.setOnLoadCallback(drawChart4('Nome do Grupo/Empresas',
                                                 'Comparativo por Ano X Lojas',
                                                 'horizontal',
                                                 valores,
                                                 document.getElementById('barchart_anoX_lojas')));
                                                 
                                                 */
        
    });
});