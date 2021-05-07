function leer(){
    var datos = {
        "Operacion" : 'Venta',
        id_Producto : document.getElementById("codigo").value,
        Cantidad : document.getElementById("cantidad").value
    };
    $.ajax({
        type: "POST",
        url: "./php/venta.php",
        data: datos,
    }).done(function(response){ 
        if(response!=0){
            var producto=JSON.parse(response);
            //alert("El producto es "+producto.Nombre )
            document.getElementById("Productos").insertRow(-1).innerHTML = '<td>'+producto.Id+'</td><td>'+producto.Nombre+'</td><td>'
            +producto.Precio+'</td><td>'+producto.Cantidad+'</td><td><button type="submit" class="btn btn-danger"><i class="fa fa-trash"></i></button></td>';
        }
        //alert(response);
    }).fail(function(response){
        alert("Hubo un error en el server, reintentelo de nuevo");
    });
}