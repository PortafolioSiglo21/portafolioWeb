$(document).ready(function()
{
    window.setTimeout(function() {
    $(".alert").fadeTo(1000, 0).slideUp(1000, function(){
         $(this).remove(); 
        });
    }, 5000);
    
    var letras = 'qwertyuiopasdfghjklñzxcvbnm' +
                 'QWERTYUIOPASDFGHJKLÑZXCVBNM ';
    var numeros ='1234567890';
    var especiales ='@.-';
    var rut = '0123456789-kK';
    var telefono = '0123456789+';
     
    
    // validación de ingreso (caracteres soportados por cada input)
    $('.txtRutCliRes').keypress(function(e)
    {
            var caracter = String.fromCharCode(e.which);
            if(rut.indexOf(caracter) < 0 )
                    return false;
    });
    
    $('.txtCantidadAsiste').keypress(function(e)
    {
            var caracter = String.fromCharCode(e.which);
            if(telefono.indexOf(caracter) < 0 )
                    return false;
    });
   
     
    $(function onlyRut()
    {
        // validación de ingreso (caracteres soportados por cada input)
        $('.txtRutCli').keypress(function(e)
        {
                var caracter = String.fromCharCode(e.which);
                if(rut.indexOf(caracter) < 0 )
                        return false;
        });
        
        

        // validación de ingreso (caracteres soportados por cada input)
        $('.txtRutCancela').keypress(function(e)
        {
                var caracter = String.fromCharCode(e.which);
                if(rut.indexOf(caracter) < 0 )
                        return false;
        });
    });
    
    // validar registro clientes
    $('.btnRegistrarCli').on('click', function()
    {
        var rutCli  = $('.txtRutCli').val();
        var nameCli = $('.txtNombresCli').val();
        var apeCli  = $('.txtApellidosCli').val();
        var fonoCli = $('.txtTelefonoCli').val();
        var emailCli= $('.txtEmailCli').val();
       
        var emailRegex = /^([0-9a-zA-Z]([.w][0-9a-zA-Z])@([0-9a-zA-Z][-w]*[0-9a-zA-Z].)+([a-zA-Z]{2,9}.)+[a-zA-Z]{2,3})$/;
       
        if(rutCli.length == 0)
        {
            alert('Ingrese rut');
            $('.txtRutCli').focus();
        }else if(rutCli.length <7 || rutCli.length >10)
        {
           alert('Longitud  de rut no corresponde');
           $('.txtRutCli').focus();
        }else if(rutCli.length >6 || rutCli.length <11)
        {
           if(VerificaRut(rutCli) == false)
           {
                alert('Rut incorrecto,\nPor favor, revise el rut ingresado');
                $('.txtRutCli').focus();
           }
        }else if(nameCli.length == 0)
        {
            alert('Ingrese nombres');
            $('.txtNombresCli').focus();
        }else if(apeCli == 0)
        {
            alert('Ingrese apellidos');
            $('.txtApellidosCli').focus();
        }else if(fonoCli.length == 0)
        {
            alert('Ingrese teléfono');
            $('.txtTelefonoCli').focus();
        }else if(fonoCli.length <11 || fonoCli.length >12)
        {
            alert('Ingrese teléfono correcto \nEj:+56987654321');
            $('.txtTelefonoCli').focus();
        }else if(!emailRegex.test($('.txtEmailCli').val()))
        {
            alert('El formato del correo no es válido, vuelva a intentar.');
            $('.txtEmailCli').focus();
            return false;
        }
       
       
       
   });
  
    
  
    
        
        
        
   

});

// validador de rut
/*
 * 
 * 
 * 
function onRutBlur(obj) 
{
    if (!VerificaRut(obj.value))
    {
        alert("Rut incorrecto");
        alert("valor onrutBlur: "+VerificaRut(obj));
        rut
        obj.focus();
    }
}
    
    
    var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.([a-zA-Z]{2,4})+$/
		if(!emailRegex.test($('.txtEmail').val()))
		{
			alert('El formato del correo no es válido, vuelva a intentar.');
			$('.txtEmail').focus();
			return false;
		}
    
*/


function VerificaRut(rut) {
    if (rut.toString().trim() != '' && rut.toString().indexOf('-') > 0) {
        var caracteres = new Array();
        var serie = new Array(2, 3, 4, 5, 6, 7);
        var dig = rut.toString().substr(rut.toString().length - 1, 1);
        rut = rut.toString().substr(0, rut.toString().length - 2);

        for (var i = 0; i < rut.length; i++) {
            caracteres[i] = parseInt(rut.charAt((rut.length - (i + 1))));
        }

        var sumatoria = 0;
        var k = 0;
        var resto = 0;

        for (var j = 0; j < caracteres.length; j++) {
            if (k == 6) {
                k = 0;
            }
            sumatoria += parseInt(caracteres[j]) * parseInt(serie[k]);
            k++;
        }

        resto = sumatoria % 11;
        dv = 11 - resto;

        if (dv == 10) {
            dv = "K";
        }
        else if (dv == 11) {
            dv = 0;
        }

        if (dv.toString().trim().toUpperCase() == dig.toString().trim().toUpperCase())
            return true;
        else
            return false;
    }
    else {
        return false;
    }
}
 
    
   
    
    
    


