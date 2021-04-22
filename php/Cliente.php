<?php
    $Operacion=$_POST['Operacion'];
    require_once('./conexion.php'); 
    if($Operacion=="Insertar"){
        $Nombre=$_POST['Nombre'];
        $Direccion=$_POST['Direccion'];
        $Telefono=$_POST['Telefono'];
        $Email=$_POST['Email'];
        $RFC=$_POST['RFC'];
        $consulta = "INSERT INTO cliente(Nombre, Direccion, Telefono, Email, RFC) VALUES (
            '{$Nombre}','{$Direccion}',{$Telefono},'{$Email}','{$RFC}')";
        echo mysqli_query($conexion,$consulta);   
    }else if($Operacion=="Eliminar"){
        $id_Cliente=$_POST['id_Cliente'];
        $consulta = "DELETE FROM cliente WHERE id_Cliente='$id_Cliente'";
        echo mysqli_query($conexion,$consulta);
    }
    else if($Operacion=="Modificar"){
        $id_Cliente=$_POST['id_Cliente'];
        $Nombre=$_POST['Nombre'];
        $Direccion=$_POST['Direccion'];
        $Telefono=$_POST['Telefono'];
        $Email=$_POST['Email'];
        $RFC=$_POST['RFC'];
        $consulta = "UPDATE cliente SET Nombre='$Nombre', Direccion='$Direccion', Telefono=$Telefono, Email='$Email', RFC='$RFC' WHERE id_Cliente=$id_Cliente";
        echo mysqli_query($conexion,$consulta);
    }
?> 