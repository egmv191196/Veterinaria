$(document).ready(function() {
    $('#codigo').trigger('focus');
    $('#Pagar').on('shown.bs.modal', function () {
        $('#modal_Pago').trigger('focus')
      })
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
            var cantidad=parseFloat(producto.Cantidad).toFixed(2);
            var precioUnitario=parseFloat(producto.Precio).toFixed(2);
            var subtotal=parseFloat(producto.Subtotal).toFixed(2);
            //alert("El producto es "+producto.Nombre )
            document.getElementById("Productos").insertRow(-1).innerHTML = '<td>'+producto.Id+'</td><td>'+producto.Nombre+'</td><td>'
            +precioUnitario+'</td><td>'+cantidad+'</td><td>'+subtotal+'</td><td><button type="button" onclick="devolucionProducto(this);" class="btn btn-danger"><i class="fa fa-trash"></i></button></td>';
            var total=parseFloat($('#Total').val());
            var subtotal=parseFloat(producto.Subtotal); 
            //var resume_table = document.getElementById("Productos");
            total=(total+subtotal).toFixed(2);
            /*for (var i = 1, row; row = resume_table.rows[i]; i++) {
                    col=row.cells[4];
                    precio=parseInt( col.innerText);
                    total=total+precio;
            }*/
            console.log(total);
            $('#Total').val(total);
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
    var Subtotal=parseFloat($(id).parents("tr").find("td")[4].innerHTML);
    var total=parseFloat($('#Total').val());
    total=(total-Subtotal).toFixed(2);
    $('#Total').val(total);
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
function pagar_modal(){
    $('#modal_Total').val($('#Total').val());   
    $('#modal_Cambio').val((0.00).toFixed(2)); 
    $("#Pagar").modal();       
}
function pago(){
    var producto=[];
    var list_Productos=[];
    var resume_table = document.getElementById("Productos");
    for (var i = 1, row; row = resume_table.rows[i]; i++) {
        id_Pro = row.cells[0];
        p_Unit = row.cells[2];
        Cant = row.cells[3];
        p_total = row.cells[4];
        producto=[`${id_Pro.innerText}`,`${p_Unit.innerText}`,`${Cant.innerText}`,`${p_total.innerText}`];
        list_Productos.push(producto);        
    }
    datos={
        "Operacion": 'Pago',
        Productos: list_Productos,
        Total : document.getElementById("modal_Total").value,
        Efectivo : document.getElementById("modal_Pago").value,
        Cambio : document.getElementById("modal_Cambio").value
    };
    $.ajax({
        type: "POST",
        url: "./php/venta.php",
        data: datos,
    }).done(function(response){
        alert(response);
        location.reload();
        /*if(response==1){
            alert("Todo bien");
            location.reload();
        }else{
            alert("Error"+response);
        }*/
        
    }).fail(function(response){
        console.log("error"+response);
    });
    console.log(list_Productos);
}
function calcular_cambio(){
    var total=parseFloat($('#modal_Total').val()).toFixed(2);
    var efectivo=parseFloat($('#modal_Pago').val()).toFixed(2);
    var cambio=(efectivo-total).toFixed(2);
    console.log(total);
    console.log(efectivo);
    console.log(cambio);
    $('#modal_Cambio').val(cambio); 
    
}
function recorrerTabla(){
    var resume_table = document.getElementById("rwd-table-id");
    for (var i = 1, row; row = resume_table.rows[i]; i++) {
    //alert(cell[i].innerText);
    for (var j = 0, col; col = row.cells[j]; j++) {
        //alert(col[j].innerText);
        console.log(`Txt: ${col.innerText} \tFila: ${i} \t Celda: ${j}`);
    }
    }
}