$(document).ready(function(){
    
});


function getNewVal(item)
{
    if(item.value == "0")
    {
        $('.crearMenu').css("display", "none");
        $('.editMenu').css("display", "none");
    }else if(item.value == "Crear")
    {
        $('.crearMenu').css("display", "block");
        $('.editMenu').css("display", "none");
    }else if(item.value == "Editar")
    {
        $('.crearMenu').css("display", "none");
        $('.editMenu').css("display", "block");
    }

}



