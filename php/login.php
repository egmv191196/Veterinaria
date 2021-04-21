<?php session_start();
$usu=$_POST['user'];
$pass=$_POST['passwd'];
echo "$usu <br>";
echo "$pass <br>";
    require_once('./conexion.php');
	$result= mysqli_query($conexion, "select Password,Puesto from usuario where usuario='$usu'");	
    if($row=mysqli_fetch_array($result)){
        $cargo=$row['Puesto'];
        echo "El cargo del usuario:$usu es $cargo";
        if($row['Password']==$pass){
            $_SESSION['k_user']=$usu;
			$_SESSION['cargo']=$row['Puesto'];
            header("Location:../menu.php");
		}else{
            echo "Contraseña incorrecta";
			header("Location:../../index.html");
		}
	}else{
		header("Location:../index.html");  
	}
?>  