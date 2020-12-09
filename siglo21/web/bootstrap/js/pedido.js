/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
    var newoneEnt=[];
    var newtwoEnt=[];
    var newthreeEnt=[];
    
    // if(idCarta>2 && idCarta<7)--> principales
    // if(idCarta==7)--> postres
    

function addEnt(){

    var one=document.getElementById('cboEntrada').value;
    var two=cboEntrada.options[cboEntrada.selectedIndex].text;
//    var three=document.getElementById('txtCantidad').value;
    newoneEnt.push(one);
    newtwoEnt.push(two);
//    newthreeEnt.push(three);
    listshow();
    }

function listshow(){
    var list="";
    for(var i=0;i<newoneEnt.length;i++){
    list+= "<tr>\n\
            <td class='text-black'>"+(i+1)+"</td>"+"\
            <td class=ocultar><input class='form-control tblViewGarzon' id=idEnt"+[i]+"  name=entradas[] value='"+newoneEnt[i]+"' readonly></td>"+"\
            <td><input class='form-control tblViewGarzon' id=nomEnt"+[i]+" value='"+newtwoEnt[i]+"' readonly></td>"+"\
            <td>"+"<button class=' btn btn-danger ' onclick='del("+i+")'>Eliminar</button>"+"\
            </td>\n\
            </tr>";

    }
    document.getElementById('dataEnt').innerHTML=list;
    }

    var load="";
function edt(edit){
    load=edit;
    document.getElementById('cboEntrada').value=newoneEnt[edit];
    //document.getElementById('txtCantidad').value=newthreeEnt[edit];
    }

function updateEnt(){
    newoneEnt[load]=document.getElementById('cboEntrada').value;
    //newthreeEnt[load]=document.getElementById('txtCantidad').value;
    listshow();
    }

function del(dok){
    newoneEnt.splice(dok,1);
    newtwoEnt.splice(dok,1);
   // newthreeEnt.splice(dok,1);
    listshow();
    }
        


//Principal
    
    var newonePrin=[];
    var newtwoPrin=[];
    var newthreePrin=[];
    
    // if(idCarta>2 && idCarta<7)--> principales
    // if(idCarta==7)--> postres
    


function addPrin(){

    var one=document.getElementById('cboPrincipal').value;
    var two=cboPrincipal.options[cboPrincipal.selectedIndex].text;
   // var three=document.getElementById('txtCantidadprin').value;
    newonePrin.push(one);
    newtwoPrin.push(two);
    //newthreePrin.push(three);
    listshowPrin();
    }

function listshowPrin(){
    var list="";
    for(var i=0;i<newonePrin.length;i++){
    list+= "<tr>\n\
            <td class='text-black'>"+(i+1)+"</td>"+"\
            <td class=ocultar><input class='form-control tblViewGarzon' id=idPrin"+[i]+"  name='principal[]' value='"+newonePrin[i]+"' readonly></td>"+"\
            <td><input class='form-control tblViewGarzon' id=nomPrin"+[i]+" value='"+newtwoPrin[i]+"' readonly></td>"+"\            \n\
            <td>"+"<button class='btn btn-danger' onclick='delPrin("+i+")'>Eliminar</button>"+"</td></tr>";

    }
    document.getElementById('dataPrin').innerHTML=list;
    }

    var load="";
function edtPrin(edit){
    load=edit;
    document.getElementById('cboPrincipal').value=newonePrin[edit];
    //document.getElementById('txtCantidadprin').value=newthreePrin[edit];
    }

function updatePrin(){
    newonePrin[load]=document.getElementById('cboPrincipal').value;
    //newthreePrin[load]=document.getElementById('txtCantidadprin').value;
    listshowPrin();
    }

function delPrin(dok){
    newonePrin.splice(dok,1);
    newtwoPrin.splice(dok,1);
    //newthreePrin.splice(dok,1);
    listshowPrin();
    }
    

    //Bebestibles

    var newoneBeb=[];
    var newtwoBeb=[];
    var newthreeBeb=[];
    
    // if(idCarta>2 && idCarta<7)--> principales
    // if(idCarta==7)--> postres
    

function addBeb(){

    var one=document.getElementById('cboBebestible').value;
    var two=cboBebestible.options[cboBebestible.selectedIndex].text;
    //var three=document.getElementById('txtCantidadbeb').value;
    newoneBeb.push(one);
    newtwoBeb.push(two);
    //newthreeBeb.push(three);
    listshowBeb();
    }

function listshowBeb(){
    var list="";
    for(var i=0;i<newoneBeb.length;i++){
    list+= "<tr>\n\
            <td class='text-black'>"+(i+1)+"</td>"+"\
            <td class=ocultar><input class='form-control tblViewGarzon' id=idBeb"+[i]+"  name='bebestibles[]' value='"+newoneBeb[i]+"' readonly></td>"+"\
            <td><input class='form-control tblViewGarzon' id=nomBeb"+[i]+" value='"+newtwoBeb[i]+"' readonly></td>"+"\
            \n\
            <td>"+"<button class=' btn btn-danger' onclick='delBeb("+i+")'>Eliminar</button>"+"</td></tr>";

    }
    document.getElementById('dataBeb').innerHTML=list;
    }

    var load="";
function edtBeb(edit){
    load=edit;
    document.getElementById('cboBebestible').value=newoneBeb[edit];
    document.getElementById('txtCantidadbeb').value=newthreeBeb[edit];
    }

function updateBeb(){
    newoneBeb[load]=document.getElementById('cboBebestible').value;
    newthreeBeb[load]=document.getElementById('txtCantidadbeb').value;
    listshowBeb();
    }

function delBeb(dok){
    newoneBeb.splice(dok,1);
    newtwoBeb.splice(dok,1);
    newthreeBeb.splice(dok,1);
    listshowBeb();
    }


//Postres
    
    var newonePos=[];
    var newtwoPos=[];
    var newthreePos=[];
    

function addPos(){

    var one=document.getElementById('cboPostre').value;
    var two=cboPostre.options[cboPostre.selectedIndex].text;
    //var three=document.getElementById('txtCantidadpos').value;
    newonePos.push(one);
    newtwoPos.push(two);
    //newthreePos.push(three);
    listshowPos();
    }

function listshowPos(){
    var list="";
    for(var i=0;i<newonePos.length;i++){
    list+= "<tr>\n\
                <td class='text-black'>"+(i+1)+"</td>"+"\
                <td class=ocultar>\n\
                    <input class='form-control tblViewGarzon' id=idPos"+[i]+" name='postre[]' value='"+newonePos[i]+"' readonly>\n\
                </td>"+"\
                <td>\n\
                    <input class='form-control tblViewGarzon' id=nomPos"+[i]+" value='"+newtwoPos[i]+"' readonly>\n\
                </td>"+"\
                 \n\
                <td>"+"\
                    <button class=' btn btn-danger' onclick='delPos("+i+")'>Eliminar</button>"+"\
                </td>\n\
            </tr>";

    }
    document.getElementById('dataPos').innerHTML=list;
    }

    var load="";
function edtPos(edit){
    load=edit;
    document.getElementById('cboPostre').value=newonePos[edit];
    document.getElementById('txtCantidadpos').value=newthreePos[edit];
    }

function updatePos(){
    newonePos[load]=document.getElementById('cboPostre').value;
    newthreePos[load]=document.getElementById('txtCantidadpos').value;
    listshowPos();
    }

function delPos(dok){
    newonePos.splice(dok,1);
    newtwoPos.splice(dok,1);
    newthreePos.splice(dok,1);
    listshowPos();
    }


//Add Extra
    
    var newoneExt=[];
    var newtwoExt=[];
    var newthreeExt=[];

function addExt(){

    var one=document.getElementById('cboExtra').value;
    var two=cboExtra.options[cboExtra.selectedIndex].text;
   // var three=document.getElementById('txtCantidadExt').value;
    newoneExt.push(one);
    newtwoExt.push(two);
    //newthreeExt.push(three);
    listshowExt();
    }

function listshowExt(){
    var list="";
    for(var i=0;i<newoneExt.length;i++){
    list+= "<tr>\n\
            <td class='text-black'>"+(i+1)+"</td>"+"\
            <td class=ocultar><input class='form-control ocultar tblViewGarzon' id=idExt"+[i]+"  name='extra[]' value='"+newoneExt[i]+"' readonly></td>"+"\
            <td><input class='form-control tblViewGarzon' id=nomExt"+[i]+" value='"+newtwoExt[i]+"' readonly></td>"+"\
             \n\
            <td><button class=' btn btn-danger' onclick='delExt("+i+")'>Eliminar</button>"+"</td></tr>";

    }
    document.getElementById('dataExt').innerHTML=list;
    }

    var load="";
function edtExt(edit){
    load=edit;
    document.getElementById('cboExtra').value=newoneExt[edit];
    //document.getElementById('txtCantidadExt').value=newthreeExt[edit];
    }

function updateExt(){
    newoneExt[load]=document.getElementById('cboExtra').value;
   // newthreeExt[load]=document.getElementById('txtCantidadExt').value;
    listshowExt();
    }

function delExt(dok){
    newoneExt.splice(dok,1);
    newtwoExt.splice(dok,1);
    //newthreeExt.splice(dok,1);
    listshowExt();
    }
    