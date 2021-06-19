<?php 
    session_start();
    $usu=$_POST['user'];
    $pass=$_POST['passwd'];
    require_once('./conexion.php');
    $consulta="select Password,Puesto,id_User from usuario where usuario='$usu'";
	$result= mysqli_query($conexion, $consulta);	
    if($row=mysqli_fetch_array($result)){
        $cargo=$row['Puesto'];
        if($row['Password']==$pass){
            $_SESSION['k_user']=$usu;
			$_SESSION['cargo']=$row['Puesto'];
            $_SESSION['id_Empleado']=$row['id_User'];
            echo 1;
		}else{
            echo 2;
		}
	}else{
		echo 3; 
	}
?>  