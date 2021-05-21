<?php
    require_once('./conexion.php'); 
    $Operacion=$_POST['Operacion'];
    if($Operacion=="Venta"){
        $id_Producto=$_POST['id_Producto'];
        $cantidad=$_POST['Cantidad'];
        $Des=$_POST['precio'];
        $consulta = "SELECT * FROM producto WHERE id_Producto=$id_Producto";
        if($res = mysqli_query($conexion,$consulta)){
            $numRows=mysqli_num_rows($res);
            if($numRows>0){
                $datos = mysqli_fetch_array($res);
                $Nombre=$datos['Nombre'];
                $stockReal= $datos['Cantidad'];
                if($stockReal>=$cantidad){
                    if($Des==0){
                        $precio= $datos['p_ventaN'];
                    }else if($Des==1){
                        $precio= $datos['p_VentaMe'];
                    }else if($Des==2){
                        $precio= $datos['p_VentaMa'];
                    }         
                    $stockFinal=$stockReal-$cantidad;
                    $update = "UPDATE producto SET Cantidad=$stockFinal WHERE id_Producto=$id_Producto";
                    mysqli_query($conexion,$update);
                    $precioTotal=$precio*$cantidad;
                    $producto=array('Id' => $id_Producto,'Nombre' => $Nombre,'Precio' => $precio,'Cantidad' => $cantidad,'Subtotal'=>$precioTotal);
                    echo json_encode($producto);
                }else {
                    echo 2;
                }

                
            }else {
                echo 0;
            }   
        }else {
            echo 0;
        } 

    }else if($Operacion=="Devolucion"){
        $id_Producto=$_POST['id_Producto'];
        $cantidad=$_POST['Cantidad'];
        $consulta = "SELECT Cantidad FROM producto WHERE id_Producto=$id_Producto";
        if($res = mysqli_query($conexion,$consulta)){
            $datos = mysqli_fetch_array($res);
            $stock=$datos['Cantidad'];
            $stockNew=$stock+$cantidad;
            $consulta= "UPDATE producto SET Cantidad=$stockNew WHERE id_Producto=$id_Producto";
            mysqli_query($conexion,$consulta);
            echo 1;
        }else {
            echo 0;
        }
    }
?> 