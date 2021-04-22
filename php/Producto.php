<?php
    $Operacion=$_POST['Operacion'];
    require_once('./conexion.php'); 
    if($Operacion=="Insertar"){
        $id_Producto=$_POST['id_Producto'];
        $Nombre=$_POST['Nombre'];
        $Proveedor=$_POST['Proveedor'];
        $p_Compra=$_POST['p_Compra'];
        $p_VentaC=$_POST['p_VentaC'];
        $p_VentaM=$_POST['p_VentaM'];
        $p_VentaMa=$_POST['p_VentaMa'];
        $stock=$_POST['stock'];
        $consulta = "INSERT INTO producto (id_Producto, Nombre, Cantidad, p_Compra, p_ventaN, p_VentaMe, p_VentaMa) VALUES (
            {$id_Producto},'{$Nombre}',{$stock},{$p_Compra},{$p_VentaC},{$p_VentaM},{$p_VentaMa})";
        echo mysqli_query($conexion,$consulta);   
    }else if($Operacion=="Eliminar"){
        $id_Producto=$_POST['id_Producto'];
        $consulta = "DELETE FROM producto WHERE id_Producto='$id_Producto'";
        echo mysqli_query($conexion,$consulta);
    }
    else if($Operacion=="Modificar"){
        $id_Producto=$_POST['id_Producto'];
        $Nombre=$_POST['Nombre'];
        $p_Compra=$_POST['p_Compra'];
        $p_VentaN=$_POST['p_VentaC'];
        $p_VentaM=$_POST['p_VentaM'];
        $p_VentaMa=$_POST['p_VentaMa'];
        $stock=$_POST['stock'];
        $consulta = "UPDATE producto SET Nombre='$Nombre', Cantidad=$stock , p_Compra=$p_Compra , p_VentaN=$p_VentaN , p_VentaMe=$p_VentaM , p_VentaMa=$p_VentaMa
         WHERE id_Producto=$id_Producto";
        echo mysqli_query($conexion,$consulta);
    }
?> 