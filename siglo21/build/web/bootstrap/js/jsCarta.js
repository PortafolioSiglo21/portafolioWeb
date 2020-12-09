$(document).ready(function()
{
   
   var sum=0;
    $('.calcularSubCosto').each(function() {  
        sum += parseFloat($(this).text().replace(/,/g, ''), 10);  
        alert(sum);
    }); 
   
   
    
    
    // ajax de cboCategoria
    $('#cboCategoriaProdCarta').on('change',function()
    {
        // consultas ajax
        $.ajax({
            type: 'GET',
            url: 'controlCategorias',
            data:'codigoCategoria='+$('#cboCategoriaProdCarta').val(),
            statusCode:{
                404: function (){
                    alert('Dato no encontrado');
                },
                500: function ()
                {
                    alert('no existen datos');
                }
            },
            success: function(dados){
               $('select[name=cboProductosCatCarta] option').remove();
                var pegaDados = dados.split(":");
                $('input[name="precio"]').val('');
                $('select[name=cboProductosCatCarta]').append('<option value="0">Seleccionar producto</option>');
                for(var i =0 ; i <pegaDados.length -1 ; i++)
                {
                    var codigoProd = pegaDados[i].split("-")[0];
                    var nombreProd = pegaDados[i].split("-")[1];
                   
                    $('select[name=cboProductosCatCarta]').append('<option value="'+codigoProd+'">'+nombreProd+'</option>');
                }
            }
        });
        // fin ajax
    });
    
    // ajax de cboProd
    $('select[name=cboProductosCatCarta]').on('change',function()
    {
        if( $('select[name=cboProductosCatCarta]') == 0 )
        {
             $('input[name=precio]').val("");
        }
        // consultas ajax
        $.ajax({
            type: 'GET',
            url: 'controlGetPrecioProducto',
            data:'codigoProducto='+$('#cboProductosCatCarta').val(),
            statusCode:{
                404: function (){
                    alert('Dato no encontrado');
                },
                500: function ()
                {
                    alert('no existen datos');
                }
            },
            success: function(dados2){
               $('input[name=precio]').val("");
                
               if(dados2 != 0)
               {
                   var precio = dados2;
                   $('input[name=precio]').val(precio);
               }else
               {
                    $('input[name=precio]').val("");
               }
              
            }
        });
        // fin ajax
    });
 
});


var newNameCat=[];
var newidCat=[];

var newNameProd=[];
var newIdProd=[];

var newPrecio=[];
var newCantidad=[];
var newCosto=[];

function add(){
    
    // Select Categoria
    var codCate = document.getElementById("cboCategoriaProdCarta").value;
        //alert(codCate);        
    var comboCat = document.getElementById("cboCategoriaProdCarta");
    var nombreCat = comboCat.options[comboCat.selectedIndex].text;
        //alert(nombreCat);

    // Select Productos
    var codProd = document.getElementById("cboProductosCatCarta").value;
        //alert(codProd);        
    var comboProd = document.getElementById("cboProductosCatCarta");
    var nombreProd = comboProd.options[comboProd.selectedIndex].text;
        //alert(nombreProd);

    // input precio prod
    var precioProd =  $('input[name=precio]').val();
        //alert(precioProd);

    // input Cantidad a usar
    var cantidadProd =  $('input[name=cantidad]').val();
        //alert(cantidadProd);

    // Calcular Costo
    var costo = precioProd.valueOf()*cantidadProd.valueOf();
        //alert('Costo ='+costo);
    
    
    newNameCat.push(nombreCat);
    newidCat.push(codCate);
    
    newNameProd.push(nombreProd);
    newIdProd.push(codProd);
    
    newPrecio.push(precioProd);
    newCantidad.push(cantidadProd);
    newCosto.push(costo);
    
    /*
    newidCat.push(codCate);
    newIdProd.push(two);
    newCantidad.push(three);
    newCosto.push(four);*/
    listshow();
    findTotal();
    $('.cboCategoriaProdCarta').val("0");
    $('.cboProductosCatCarta').val("0");
    $('input[name=precio]').val("");
    $('input[name=cantidad]').val("");
}
            
function listshow(){
    var list="";
    for(var i=0;i<newNameCat.length;i++)
    {
        list+= "<tr>\n\
                <td class='text-black'><a name=contador>"+(i+1)+"</a></td>"+"\
                <td><a id='newNameCat"+[i]+"' value='"+newNameCat[i]+"' class='text-center'>"+newNameCat[i]+"</a></td>"+"\
                <td><a id='newNameProd"+[i]+"' value='"+newNameProd[i]+"' class='text-center'>"+newNameProd[i]+"</a></td>"+"\
                <td><input id='newCantidad"+[i]+"' value='"+newCantidad[i]+"' class='text-center'></td>"+"\
                <td><input name=costo id='newCosto"+[i]+"' value='"+newCosto[i]+"' class='text-center calcularSubCosto'></td>"+"\
                <td>"+"<button class='btn btn-danger text-center' onclick='del("+i+")'>Eliminar</button>"+"</td></tr>";
    }
    document.getElementById('data').innerHTML=list;
}

function del(dok){
    newNameCat.splice(dok,1)
    newNameProd.splice(dok,1)
    newCantidad.splice(dok,1)
    newCosto.splice(dok,1)
    listshow();
    findTotal();
}



function findTotal(){
    var arr = document.getElementsByName('costo');
    var tot=0;
    for(var i=0;i<arr.length;i++){
        if(parseInt(arr[i].value))
            tot += parseInt(arr[i].value);
    }
    $('input[name=costoMenu]').val('$'+tot);
   // document.getElementById('total').value = tot;
}