<!doctype html>
<html lang="es" xmlns:th="http://www.w3.org/1999/xhtml">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="bootstrap-4.1.3-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"/>
    <script src="https://kit.fontawesome.com/8c9db8153c.js" crossorigin="anonymous"></script>
      <link rel="stylesheet" href=".//css/cabezapie.css">
    <link rel="stylesheet" href=".//css/prove.css">
    <script type="text/javascript" src="./js/Mostrar.js"></script>
    <title>Venta</title>
  </head>
  <body>
    <div id="Home">
      <!---- Navigation -->
        <nav class="navbar navbar-expand-md navbar-black fixed-top">
          <a class="btn btn-info" href="menu.php" hidden><i class="fa fa-arrow-left"></i>&nbsp;Volver</a>
          <a class="navbar-brand" href="menu.php"><img src="img/BALBI-sin-fondo.png"></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive">
            <img src="img/Enca/menu.svg" class="img-fluid">
          </button>
          <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
              <li class="nav-item">
                <h1>Veterinaria Balbi</h1>
              </li>
            </ul>
            <ul class="navbar-nav ml-auto">
                  <li class="nav-item">
                    <div id="hora"><script type="text/javascript">Mostrar();</script></div>
                  </li>
                  <li class="nav-item">
                    <a href="" class="nav-link">
                      <i class="fa fa-user fa-2x" aria-hidden="true"></i>
                    </a>
                </li>
                  <li class="nav-item">
                      <a href="" class="nav-link">
                        <i class="fa fa-sign-out fa-2x" aria-hidden="true"></i>
                      </a>
                  </li>
          </ul>
          </div>
        </nav>
    </div>	
    <div class="header">
        <div class="col-12">
              <h1 class="text-center">Venta<i class="fa fa-cart-plus"></i></h1>
            <div class="row">
                  <label class="col-1" for="id_cliente">Cliente</label>
                  <input type="hidden" id="Descuento" value="0">
                  <select required class="form-control col-2" name="id_cliente" id="id_cliente" onchange="Descuento();">
                          <option value="">cliente general</option>   
                            <?php
                              require_once('./php/conexion.php');
                              $result= mysqli_query($conexion, "select * from cliente");
                              while ($row = mysqli_fetch_array($result)) {
                                  echo '<option value="'.$row['id_Cliente'].'" >'.$row['Nombre'].' - '.$row['Telefono'].'</option>';
                              }
                            ?>      
                  </select>
                  <label class="col-1" for="cantidad">Cantidad</label>
                  <input id="cantidad" autocomplete="off" name="cantidad" type="number" value=1
                          class="form-control col-2" placeholder="Cantidad de productos">
                  <label class="col-2" for="codigo">Código de barras</label>
                  <input id="codigo" autocomplete="off" required name="codigo" type="text"
                          class="form-control col-3" onchange="leer();"
                          placeholder="Código de barras">
            </div>
                <h2>Total: </h2>
                <div class="table-responsive">
                    <table class="table table-bordered" id="Productos">
                        <thead>
                        <tr>
                            <th width=20%>Código de barras</th>
                            <th width=35%>Descripción</th>
                            <th width=15%>Precio unitario</th>
                            <th width=5%>Cantidad</th>
                            <th width=5%>Subtotal</th>
                            <th width=10%>Quitar</th>
                        </tr>
                        </thead>
                        <tbody>
                            <tr>

                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="form-group">
                    <button name="accion" value="terminar" type="submit" class="btn btn-success">Terminar
                        venta
                    </button>
                    <button name="accion" value="cancelar" type="submit" class="btn btn-danger">Cancelar
                        venta
                    </button>
                </div>
        </div>
    </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
    <script src="./js/venta.js"></script>
  </body>
</html>