<?php
    require_once('./conexion.php'); 
    $Operacion=$_POST['Operacion'];
    if($Operacion=="Venta"){
        $id_Producto=$_POST['id_Producto'];
        $cantidad=$_POST['Cantidad'];
        $consulta = "SELECT id_Producto, Nombre, Cantidad, p_VentaN FROM producto WHERE id_Producto=$id_Producto";
        //$res = mysqli_query($conexion,$consulta);
        
        if($res = mysqli_query($conexion,$consulta)){
            $numRows=mysqli_num_rows($res);
            if($numRows>0){
                $datos = mysqli_fetch_array($res);
                $Nombre=$datos['Nombre'];
                $stockReal= $datos['Cantidad'];
                $precio= $datos['p_VentaN'];
                $stockFinal=$stockReal-$cantidad;
                $update="";
                $producto=array('Id' => $id_Producto,'Nombre' => $Nombre,'Precio' => $precio,'Cantidad' => $cantidad);
                echo json_encode($producto);
            }else {
                echo 0;
            }   
        }else {
            echo 0;
        } 

    }
?> 