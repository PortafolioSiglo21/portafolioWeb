$(document).ready(function(){
    
    
    $.datepicker.regional['es'] = {
    closeText: 'Cerrar',
    prevText: '< Ant',
    nextText: 'Sig >',
    currentText: 'Hoy',
    monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
    monthNamesShort: ['Ene','Feb','Mar','Abr', 'May','Jun','Jul','Ago','Sep', 'Oct','Nov','Dic'],
    dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
    dayNamesShort: ['Dom','Lun','Mar','Mié','Juv','Vie','Sáb'],
    dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','Sá'],
    weekHeader: 'Sm',
    dateFormat: 'dd/mm/yy',
    firstDay: 1,
    isRTL: false,
    showMonthAfterYear: false,
    yearSuffix: ''
    };
    $.datepicker.setDefaults($.datepicker.regional['es']);
    $( function() {
        $( "#dateNacimientoEmp" ).datepicker({ minDate: "-65Y", maxDate: "-18Y" });
    } );
    
    
    $('.txtNumMesaEdit').attr('readonly','readonly');
    $('.txtNumMesaEdit').attr('readonly',true);
    $('.txtIdNumMesa').attr('readonly','readonly');
    $('.txtIdNumMesa').attr('readonly',true);
    $('.txtIdPedido').attr('readonly','readonly');
    $('.txtIdPedido').attr('readonly',true);
    $('.txtIdPedido').attr('hidden','hidden');
    // 
    // para email
    // var caract = new RegExp(/^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/);
    // jsp editarPersonal
     $('.txtIdEmp').attr('readonly','readonly');
     $('.txtNombresEmpEdit').attr('readonly','readonly');
     $('.txtApellidosEmpEdit').attr('readonly','readonly');
     $('.dateNacimientoEmpEdit').attr('readonly','readonly');
     $('.txtUserEmpEdit').attr('readonly','readonly');
     
    // jsp clientes
    $('.txtRutCliEdit').attr('readonly','readonly');
    
    // jsp proveedores
    $('.IdProveList').attr('readonly','readonly');
    $('.IdProveList').attr('hidden','hidden');
    $('.txtIdProv').attr('readonly','readonly');
    $('.txtIdProv').attr('hidden','hidden');
    $('.txtRutProvEdit').attr('readonly','readonly');
    $('.txtIdAdmin').attr('readonly','readonly');
    $('.txtIdAdmin').attr('hidden','hidden');
    $('.txtUserAdmin').attr('readonly','readonly');
    $('.txtUserAdmin').attr('hidden','hidden');
  
    // jsp insumos
    $('.txtIdPedido').attr('readonly','readonly');
    $('.txtIdPedido').attr('hidden','hidden');
    $('.txtIdPedidoEnviar').attr('readonly','readonly');
    $('.txtIdPedidoEnviar').attr('hidden','hidden');
   
});



$(function soloNumeros()
{
	var numbers = '1234567890';
        var telefono = '1234567890+';
	// validación de ingreso (caracteres soportados por cada input)
	$('.txtCapMesaEdit').keypress(function(e)
	{
		var caracter = String.fromCharCode(e.which);
		if(numbers.indexOf(caracter) < 0 )
                {
                    return false;
                }
                if(event.key==='.' || event.key===',')
                {
                    event.preventDefault(); 
                    alert('No puede usar decimales\n solo números enteros')
                }
	});
        
        $('.txtNumMesa').keypress(function(e)
	{
		var caracter = String.fromCharCode(e.which);
		if(numbers.indexOf(caracter) < 0 )
                {
                    return false;
                }
                if(event.key==='.' || event.key===',')
                {
                    event.preventDefault(); 
                    alert('No puede usar decimales\n solo números enteros')
                }
	});
        
        $('.txtCapMesa').keypress(function(e)
	{
		var caracter = String.fromCharCode(e.which);
		if(numbers.indexOf(caracter) < 0 )
                {
                    return false;
                }
                if(event.key==='.' || event.key===',')
                {
                    event.preventDefault(); 
                    alert('No puede usar decimales\n solo números enteros')
                }
	});
        
        $('.txtSalarioEmp').keypress(function(e)
	{
		var caracter = String.fromCharCode(e.which);
		if(numbers.indexOf(caracter) < 0 )
                {
                    return false;
                }
                if(event.key==='.' || event.key===',')
                {
                    event.preventDefault(); 
                    alert('No puede usar decimales\n solo números enteros')
                }
	});
        $('.txtTelefonoEmp').keypress(function(e)
	{
		var caracter = String.fromCharCode(e.which);
		if(telefono.indexOf(caracter) < 0 )
                {
                    return false;
                }
                if(event.key==='.' || event.key===',')
                {
                    event.preventDefault(); 
                    alert('No puede usar decimales\n solo números enteros')
                }
                
	});
       
      
        
        
        
        // CLIENTES
       $('.txtTelefonoCliEdit').keypress(function(e)
	{
            var caracter = String.fromCharCode(e.which);
            if(telefono.indexOf(caracter) < 0 )
            {
                return false;
            }
            if(event.key==='.' || event.key===',')
            {
                event.preventDefault(); 
                alert('Solo se permite numeros y + \nEj: +56123456789')
            }
	});
        
       $('.number').text(function () { 
       var str = $(this).html() + ''; 
       x = str.split('.'); 
       x1 = x[0]; x2 = x.length >  1 ? '.' + x[1] : ''; 
       var rgx = /(\d+)(\d{3})/; 
       while (rgx.test(x1)) { 
           x1 = x1.replace(rgx,' $1' + '.' + '$2'); 
       } 
       $(this).html(x1 + x2); 
});
       
        
        
});


$(function soloLetras()
{
	var letras = 'qwertyuiopasdfghjklñzxcvbnm' +
                     'QWERTYUIOPASDFGHJKLÑZXCVBNM ';
        var especiales = "-'";
        var especiales2= "._@-";
        var ambos = letras + especiales;
	// validación de ingreso (caracteres soportados por cada input)
	$('.txtNombresEmp').keypress(function(e)
	{
            var full = letras + especiales;
            var caracter = String.fromCharCode(e.which);
            if(full.indexOf(caracter) < 0 )
                    return false;
	});
        
        $('.txtApellidosEmp').keypress(function(e)
	{
            var full = letras + especiales;
            var caracter = String.fromCharCode(e.which);
            if(full.indexOf(caracter) < 0 )
                    return false;
	});
        
        $('.txtEmailEmp').keypress(function(e)
	{
            var numeros = '1234567890';
            var email = letras+ especiales2+numeros;
            var caracter = String.fromCharCode(e.which);
            if(email.indexOf(caracter) < 0 )
                return false;
	});
        
         // CLIENTES
        $('.txtNombresCliEdit').keypress(function(e)
	{
            var full = letras + especiales;
            var caracter = String.fromCharCode(e.which);
            if(full.indexOf(caracter) < 0 )
                    return false;
	});
        
        $('.txtApellidosCliEdit').keypress(function(e)
	{
            var full = letras + especiales;
            var caracter = String.fromCharCode(e.which);
            if(full.indexOf(caracter) < 0 )
                    return false;
	});
        
        $('.txtEmailCliEdit').keypress(function(e)
	{
            var numeros = '1234567890';
            var email = letras+ especiales2+numeros;
            var caracter = String.fromCharCode(e.which);
            if(email.indexOf(caracter) < 0 )
                return false;
	});
        
        $('.txtEmailProv').keypress(function(e)
	{
            var numeros = '1234567890';
            var email = letras+ especiales2+numeros;
            var caracter = String.fromCharCode(e.which);
            if(email.indexOf(caracter) < 0 )
                return false;
	});
        
      
});


$(function mixto()
{
    var letras = 'qwertyuiopasdfghjklñzxcvbnm' +
                     'QWERTYUIOPASDFGHJKLÑZXCVBNM ';
    var especiales = "-'";
    var especiales2= "._@-";
    var numbers = '1234567890';
    var rut = '1234567890-Kk';
    var web = letras +'.-_' + numbers;
    var telefono = '1234567890+';

     // PROVEEDORES
    $('.txtRutProv').keypress(function(e)
    {
        var caracter = String.fromCharCode(e.which);
        if(rut.indexOf(caracter) < 0 )
            return false;
    });
    
    $('.txtNombreProv').keypress(function(e)
    {
        var nameProv = letras + numbers + especiales;
        var caracter = String.fromCharCode(e.which);
        if(nameProv.indexOf(caracter) < 0 )
            return false;
    });
    
    $('.txtContactoProv').keypress(function(e)
    {
        var nameCon = letras +  especiales;
        var caracter = String.fromCharCode(e.which);
        if(nameCon.indexOf(caracter) < 0 )
            return false;
    });
    
    $('.txtTelefonoProv').keypress(function(e)
     {
         
         var caracter = String.fromCharCode(e.which);
         if(telefono.indexOf(caracter) < 0 )
         {
             return false;
         }
         if(event.key==='.' || event.key===',')
         {
             event.preventDefault(); 
             alert('Solo se permite numeros y + \nEj: +56123456789')
         }
     });
    
     $('.txtWebProv').keypress(function(e)
    {
        var caracter = String.fromCharCode(e.which);
        if(web.indexOf(caracter) < 0 )
            return false;
    });
});