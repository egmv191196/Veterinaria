<?php
    session_start();
    $empleado=$_SESSION['id_Empleado'];
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
    }else if($Operacion=="PagoEfectivo"){
        $Total = $_POST['Total'];
        $Efectivo = number_format($_POST['Efectivo'], 2, '.', '');
        $Cambio = $_POST['Cambio'];
        $Fecha=date('Y-m-d');
        $Hora=date('H:i:s');
        $cliente=$_POST['Cliente'];
        $data = $_POST['Productos'];
        $consulta= "INSERT INTO venta(id_Venta, Fecha, Hora, id_User, id_Cliente, Total, Pago, Cambio,forma_Pago) VALUES 
        (NULL,'$Fecha','$Hora' ,$empleado,$cliente,$Total,$Efectivo,$Cambio,0)"; 
        $res= mysqli_query($conexion,$consulta);
        if($res==1){
            $consulta = "SELECT id_Venta FROM venta WHERE id_User=$empleado AND id_Cliente=$cliente ORDER BY id_Venta DESC";
            $res=mysqli_query($conexion,$consulta);
            $datos = mysqli_fetch_array($res);
            $id_Venta=$datos[0];
            //$consulta="INSERT INTO productos_venta (id_Venta, id_Producto, Cantidad, precio_Unitario, precio_Total) VALUES ";
            $consulta="INSERT INTO productos_venta (id_Venta, id_Producto,Nombre, Cantidad, precio_Unitario, precio_Total) VALUES ";
            for ($i=0; $i <count($data); $i++) { 
                $cod=$data[$i][0];
                $Nombre=$data[$i][1];
                $p_Unitario=$data[$i][2];
                $Cant=$data[$i][3];
                $p_Total=$data[$i][4];
                if($i==0){
                    //$consulta =$consulta."({$id_Venta},{$cod},{$Cant},{$p_Unitario},{$p_Total})";
                    $consulta =$consulta."({$id_Venta},{$cod},'{$Nombre}',{$Cant},{$p_Unitario},{$p_Total})";
                }else{
                    //$consulta =$consulta.",({$id_Venta},{$cod},{$Cant},{$p_Unitario},{$p_Total})";
                    $consulta =$consulta.",({$id_Venta},{$cod},'{$Nombre}',{$Cant},{$p_Unitario},{$p_Total})";
                }
            }
            //echo $consulta;
            $res=mysqli_query($conexion,$consulta);
            if($res==1){
                echo $id_Venta;
            }else{
                echo 0;
            }
        }else {
            echo 0;
        }
    }else if ($Operacion=="PagoCredito") {
        $Total = $_POST['Total'];
        $Fecha=date('Y-m-d');
        $Hora=date('H:i:s');
        $cliente=$_POST['Cliente'];
        $data = $_POST['Productos'];
        $consulta= "INSERT INTO venta(id_Venta, Fecha, Hora, id_User, id_Cliente, Total, Pago, Cambio,forma_pago) VALUES 
        (NULL,'$Fecha','$Hora' ,$empleado,$cliente,$Total,0.0,0.0,1)"; 
        $res= mysqli_query($conexion,$consulta);
        if($res==1){
            $consulta = "SELECT id_Venta FROM venta WHERE id_User=$empleado AND id_Cliente=$cliente ORDER BY id_Venta DESC";
            $res=mysqli_query($conexion,$consulta);
            $datos = mysqli_fetch_array($res);
            $id_Venta=$datos[0];
            //Agregar a credito
            $consulta="INSERT INTO credito(id_Credito,Fecha, Hora, monto_Credito, monto_Abonado, Estado, id_Cliente, id_Venta) VALUES
                (NULL, '$Fecha','$Hora', $Total, 0.0, 1, $cliente, $id_Venta)";
            $res=mysqli_query($conexion,$consulta);
            if ($res==1) {
                $consulta="INSERT INTO productos_venta (id_Venta, id_Producto,Nombre, Cantidad, precio_Unitario, precio_Total) VALUES ";
                for ($i=0; $i <count($data); $i++) { 
                    $cod=$data[$i][0];
                    $Nombre=$data[$i][1];
                    $p_Unitario=$data[$i][2];
                    $Cant=$data[$i][3];
                    $p_Total=$data[$i][4];
                    if($i==0){
                        $consulta =$consulta."({$id_Venta},{$cod},'{$Nombre}',{$Cant},{$p_Unitario},{$p_Total})";
                    }else{
                        $consulta =$consulta.",({$id_Venta},{$cod},'{$Nombre}',{$Cant},{$p_Unitario},{$p_Total})";
                    }
                }
                //echo $consulta;
                $res=mysqli_query($conexion,$consulta);
                if($res==1){
                    echo $id_Venta;
                }else{
                    echo 0;
                }
            }else {
                echo 0;
            }
        }else {
            echo 0;
        }
    }
?> 