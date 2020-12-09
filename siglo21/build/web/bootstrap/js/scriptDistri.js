$(document).ready(function ()
{
     
    
    var letras = 'qwertyuiopasdfghjklñzxcvbnm' +
                         'QWERTYUIOPASDFGHJKLÑZXCVBNM ';
    var numeros ='1234567890';
    var especiales ='@.-';
     
    $(function soloLetras()
    {
            // validación de ingreso (caracteres soportados por cada input)
            $('.txtNameProd').keypress(function(e)
            {
                    var caracter = String.fromCharCode(e.which);
                    if(letras.indexOf(caracter) < 0 )
                            return false;
            });
    });

    $(function soloNumeros()
    {
           
            // validación de ingreso (caracteres soportados por cada input)
            $('.txtPrecioProd').keypress(function(e)
            {
                    var caracter = String.fromCharCode(e.which);
                    if(numeros.indexOf(caracter) < 0 )
                            return false;
            });
    });


    $(function soloMail()
    {
        
        $('.txtEmail').keypress(function(e)
        {
            var todos = letras + numeros+ especiales;
            var caracter = String.fromCharCode(e.which);
            if(todos.indexOf(caracter) < 0 )
                    return false;
        });
        
        
    });
    
   
   
});


function preventBack()
{
    window.history.forward();
} 
setTimeout("preventBack()", 0); 
window.onunload=function(){null}; 




    