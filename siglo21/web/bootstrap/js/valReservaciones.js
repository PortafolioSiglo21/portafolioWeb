/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function()
{
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
        $( "#Freserva" ).datepicker({ minDate: 0, maxDate: "+10D" });
    } );
    	
      // validar reservas
    $('.btnRegReserva').on('click',function()
    {
        var rutRes  = $('.txtRutCliRes').val();
        var cantRes = $('.txtCantidadAsiste').val();
        var fecRes  = $('.Freserva').val();
        var horaRes = $('.Hreserva').val();
        
       
        
        
        if(rutRes.length == 0)
        {
            alert('ingrese rut');
            $('.txtRutCliRes').focus();
        }else if(rutRes.length <7 || rutRes.length >10)
        {
           alert('Longitud  de rut no corresponde');
           $('.txtRutCliRes').focus();
        }else if(rutRes.length >6 || rutRes.length <11)
        {
           if(VerificaRut(rutRes) == false)
           {
                alert('Rut incorrecto,\nPor favor, revise el rut ingresado');
                $('.txtRutCliRes').focus();
           }
        }else if(cantRes.length == 0)
        {
            alert('Ingrese cantidad de asistentes');
            $('.txtCantidadAsiste').focus();
        }
        
        
        
        
    });
    
    
    
});

function checkDate() {
    var fecha = $('.Freserva').val();

    var startDate = new Date(fecha);
    var today = new Date();
   
    
    if (startDate.getTime() < (today.getTime(-1))) {
        alert("La fecha, no puede ser menor a la actual");
        $('.Freserva').focus();
    }  
}



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