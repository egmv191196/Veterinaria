$(document).ready(function() {
    $('#codigo').trigger('focus');
});
function leer(){
    var datos = {
        "Operacion" : 'Venta',
        id_Producto : document.getElementById("codigo").value,
        Cantidad : document.getElementById("cantidad").value,
        precio : document.getElementById("Descuento").value,
    };
    $.ajax({
        type: "POST",
        url: "./php/venta.php",
        data: datos,
    }).done(function(response){ 
        //alert(response);
        if(response==2){
            alert("No se puede vender ese articulo, ya no hay piezas en el sistema, favor de revisar el inventario");
            $('#codigo').val(""); 
            $('#codigo').trigger('focus');
        }else if(response==0){
            alert("Por favor verificar el codigo, no se encontro en producto");
            $('#codigo').val(""); 
            $('#codigo').trigger('focus');
        }else if(response!=0){
            var producto=JSON.parse(response);
            //alert("El producto es "+producto.Nombre )
            document.getElementById("Productos").insertRow(-1).innerHTML = '<td>'+producto.Id+'</td><td>'+producto.Nombre+'</td><td>'
            +producto.Precio+'</td><td>'+producto.Cantidad+'</td><td>'+producto.Subtotal+'</td><td><button type="button" onclick="devolucionProducto(this);" class="btn btn-danger"><i class="fa fa-trash"></i></button></td>';
            $('#codigo').val(""); 
            $('#codigo').trigger('focus');
        }
    }).fail(function(response){
        alert("Hubo un error en el server, reintentelo de nuevo");
    });
}
function Descuento(){
    var datos = {
        "Operacion" : 'c_Descuento',
        id_Cliente : document.getElementById("id_cliente").value
    };
    $.ajax({
        type: "POST",
        url: "./php/Cliente.php",
        data: datos,
    }).done(function(response){ 
        //alert("El valor del hidden es "+ $('#Descuento').val());
        //alert(response);
        if(response==0){
            $('#Descuento').val(0);
        }else if(response==1){
            $('#Descuento').val(1);
        }else if(response==2){;
            $('#Descuento').val(2);
        }
        $('#codigo').trigger('focus');
        //alert("El nuevo valor del hidden es "+ $('#Descuento').val());
    }).fail(function(response){
        alert("Hubo un error en el server, reintentelo de nuevo");
    });
}
function devolucionProducto(id){
    var datos = {
        "Operacion" : "Devolucion",
        id_Producto : $(id).parents("tr").find("td")[0].innerHTML,
        Cantidad : $(id).parents("tr").find("td")[3].innerHTML
    };
    $.ajax({
        type: "POST",
        url: "./php/venta.php",
        data: datos,
    }).done(function(response){ 
        if(response==0){
            alert("Error al devolver el producto");
        }else if(response==1){
            $(id).closest('tr').remove();
        }
    }).fail(function(response){
        alert("Hubo un error en el server, reintentelo de nuevo");
    });

}