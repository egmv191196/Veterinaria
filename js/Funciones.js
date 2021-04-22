function signIn(){
    var datos=$('#formSignIn').serialize();
    $.ajax({
        type: "POST",
        url: "./php/login.php",
        data: datos,
    }).done(function(response){   
        if(response==1){
            location.href ="./menu.php";
        }else if(response==2){
            alert("La contraseña es incorrecta");
        }else if(response==3){
            alert("El usuario no existe en la base de datos");
        }    
    }).fail(function(response){
        alert("Hubo un error en el server, reintentelo de nuevo");
    });
}
function mostrarModal(){
    
}
//--------Producto--------
function addProducto(){
    var datos=$('#addPro').serialize();
    $.ajax({
        type: "POST",
        url: "./php/Producto.php",
        data: datos,
    }).done(function(response){   
        if(response == 1 ){
            alert("Producto agregado correctamente");
            location.href ="./productos.php";
        }else{
            alert("Error al agregar el producto");
        }   
    }).fail(function(response){
        alert("Hubo un error en el server, reintentelo de nuevo");
    });

}
function delProducto(id){
    var datos = {
            "Operacion" : 'Eliminar',
            "id_Producto" : $(id).parents("tr").find("td")[0].innerHTML
        };
        $.ajax({
            type: "POST",
            url: "./php/Producto.php",
            data: datos,
        }).done(function(response){      
            alert("El producto fue eliminado correctamente");
            location.reload();
        }).fail(function(response){
            alert("Hubo un error en el server, reintentelo de nuevo");
        });
}
function updatePro(){
    var datos=$('#upPro').serialize();
    $.ajax({
        type: "POST",
        url: "./php/Producto.php",
        data: datos,
    }).done(function(response){   
        if(response == 1 ){
            alert("Producto modificado correctamente");
            location.href ="./productos.php";
        }else{
            alert("Error al agregar el producto");
        }   
    }).fail(function(response){
        alert("Hubo un error en el server, reintentelo de nuevo");
    });

}
function editProducto(id) {
    $('#id_Producto').val($(id).parents("tr").find("td")[0].innerHTML);  
    $('#Nombre').val($(id).parents("tr").find("td")[1].innerHTML); 
    $('#p_Compra').val($(id).parents("tr").find("td")[3].innerHTML); 
    $('#p_VentaC').val($(id).parents("tr").find("td")[4].innerHTML); 
    $('#p_VentaM').val($(id).parents("tr").find("td")[5].innerHTML);  
    $('#p_VentaMa').val($(id).parents("tr").find("td")[6].innerHTML);
    $('#stock').val($(id).parents("tr").find("td")[7].innerHTML);
    $("#VenActualizar").modal();
}
//-------Proveedor-------
function addProveedor(){
    var datos=$('#addProv').serialize();
    $.ajax({
        type: "POST",
        url: "./php/Proveedor.php",
        data: datos,
    }).done(function(response){   
        if(response == 1 ){
            alert("Proveedor agregado correctamente");
            location.href ="./Proveedor.php";
        }else{
            alert("Error al agregar el proveedor");
        }  
    }).fail(function(response){
        alert("Hubo un error en el server, reintentelo de nuevo");
    });

}
function delProveedor(id){
    var datos = {
            "Operacion" : 'Eliminar',
            "id_Proveedor" : $(id).parents("tr").find("td")[0].innerHTML
        };
        $.ajax({
            type: "POST",
            url: "./php/Proveedor.php",
            data: datos,
        }).done(function(response){      
            alert("El proveedor fue eliminado correctamente");
            location.reload();
        }).fail(function(response){
            alert("Hubo un error en el server, reintentelo de nuevo");
        });
}
function updateProveedor(){
    var datos=$('#upPro').serialize();
    $.ajax({
        type: "POST",
        url: "./php/Proveedor.php",
        data: datos,
    }).done(function(response){ 
        if(response == 1 ){
            alert("Proveedor modificado correctamente");
            location.href ="./Proveedor.php";
        }else{
            alert("Error al modificar el proveedor");
        }   
    }).fail(function(response){
        alert("Hubo un error en el server, reintentelo de nuevo");
    });

}
function editProveedor(id) {
    $('#id_Proveedor').val($(id).parents("tr").find("td")[0].innerHTML);  
    $('#Nombre').val($(id).parents("tr").find("td")[1].innerHTML); 
    $('#Direccion').val($(id).parents("tr").find("td")[2].innerHTML); 
    $('#Telefono').val($(id).parents("tr").find("td")[3].innerHTML); 
    $('#Email').val($(id).parents("tr").find("td")[4].innerHTML);  
    $('#RFC').val($(id).parents("tr").find("td")[5].innerHTML);
    $("#VenActualizar").modal();
}
/*--------------Cliente---------------*/
function addCliente(){
    var datos=$('#addCliente').serialize();
    $.ajax({
        type: "POST",
        url: "./php/Cliente.php",
        data: datos,
    }).done(function(response){   
        if(response == 1 ){
            alert("Proveedor agregado correctamente");
            location.href ="./Clientes.php";
        }else{
            alert("Error al agregar el proveedor");
        }  
    }).fail(function(response){
        alert("Hubo un error en el server, reintentelo de nuevo");
    });

}
function delCliente(id){
    var datos = {
            "Operacion" : 'Eliminar',
            "id_Cliente" : $(id).parents("tr").find("td")[0].innerHTML
        };
        $.ajax({
            type: "POST",
            url: "./php/Cliente.php",
            data: datos,
        }).done(function(response){      
            alert("El Cliente fue eliminado correctamente");
            location.reload();
        }).fail(function(response){
            alert("Hubo un error en el server, reintentelo de nuevo");
        });
}
function updateCliente(){
    var datos=$('#upCliente').serialize();
    $.ajax({
        type: "POST",
        url: "./php/Cliente.php",
        data: datos,
    }).done(function(response){  
        if(response == 1 ){
            alert("Cliente modificado correctamente");
            location.href ="./Clientes.php";
        }else{
            alert("Error al modificar el Cliente");
        }   
    }).fail(function(response){
        alert("Hubo un error en el server, reintentelo de nuevo");
    });

}
function editCliente(id) {
    $('#id_Cliente').val($(id).parents("tr").find("td")[0].innerHTML);  
    $('#Nombre').val($(id).parents("tr").find("td")[1].innerHTML); 
    $('#Direccion').val($(id).parents("tr").find("td")[2].innerHTML); 
    $('#Telefono').val($(id).parents("tr").find("td")[3].innerHTML); 
    $('#Email').val($(id).parents("tr").find("td")[4].innerHTML);  
    $('#RFC').val($(id).parents("tr").find("td")[5].innerHTML);
    $("#VenActualizar").modal();
}