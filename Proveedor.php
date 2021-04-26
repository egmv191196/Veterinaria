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
    <title>Menú-Veterinaria Balbi</title>
  </head>
  <body>
    <div id="Home">
      <!---- Navigation -->
        <nav class="navbar navbar-expand-md navbar-black fixed-top">
          <a class="navbar-brand" href="Index.html"><img src="img/BALBI-sin-fondo.png"></a>
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
        <h1>Proveedores <i class="fas fa-people-carry "></i></h1>
        <a href="#VenRegistrar" class="btn btn-success mb-2" data-toggle="modal">Agregar</a>
        <div class="table-responsive">
            <table class="table table-bordered">
                <thead>
                <tr style="text-align: center">
                    <th>Id </th>
                    <th>Nombre</th>
                    <th>Dirección</th>
                    <th>Telefono</th>
                    <th>e-mail</th>
                    <th>RFC</th>

                    <th>Editar</th>
                    <th>Eliminar</th>
                </tr>
                </thead>
                <tbody>
                  <?php
                    require_once('./php/conexion.php');
                    $result= mysqli_query($conexion, "select * from proveedor");
                    while ($row = mysqli_fetch_array($result)) {
                        echo '<tr style="text-align: center">';
                        echo '<td>'.$row['id_Proveedor'].'</td>';
                        echo '<td>'.$row['Nombre'].'</td>';
                        echo '<td>'.$row['Direccion'].'</td>';
                        echo '<td>'.$row['Telefono'].'</td>';
                        echo '<td>'.$row['Email'].'</td>';
                        echo '<td>'.$row['RFC'].'</td>';
                        echo '<td> <a class="btn btn-warning" onclick="editProveedor(this);"><i class="fa fa-edit"></i></a> </td>';
                        echo '<td> <form action="#" method="post">';
                        echo '<button type="submit" class="btn btn-danger" onclick="delProveedor(this);"> <i class="fa fa-trash"></i> </button>';
                        echo '</form></td>';
                        echo '</tr>';
                    }
                    ?>
                </tbody>
            </table>
        </div>
        <div class="modal fade" id="VenRegistrar">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button tyle="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h2 class="modal-title">Registrar Proveedor</h2>
              </div>
              <div class="modal-body">
                <form id="addProv">
          
                  <div class="form-group">
                      <label class="label">Id </label>
                      <input required autocomplete="off" name="codigo_barras" class="form-control"
                             type="text" placeholder="Código ">
                  </div>
                  <div class="form-group">
                      <label class="label">Nombre</label>
                      <input required autocomplete="off" name="Nombre" class="form-control"
                             type="text" placeholder="Nombre">
                  </div>
                  <div class="form-group">
                    <label class="label">Direccion</label>
                    <input required autocomplete="off" name="Direccion" class="form-control"
                           type="text" placeholder="Direccion">
                </div>
                  <div class="form-group">
                      <label class="label">Telefono</label>
                      <input required autocomplete="off" name="Telefono" class="form-control"
                             type="text" placeholder="Tellefono">
                  </div>
                  <div class="form-group">
                      <label class="label">E-mail</label>
                      <input required autocomplete="off" name="Email" class="form-control"
                             type="text" placeholder="E-mail">
                  </div>
                  <div class="form-group">
                    <label class="label">RFC</label>
                    <input required autocomplete="off" name="RFC" class="form-control"
                           type="text" placeholder="RFC>
                </div>
                  <input type="hidden" name="Operacion" id="Operacion" value="Insertar" />
                  <button class="btn btn-success" onclick="addProveedor();">Guardar</button>
                  <button type="button"class="btn btn-primary" data-dismiss="modal">Cerrar</button>
              </form>
              </div>
            </div>
          </div>
        </div>

        <div class="modal fade" id="VenActualizar">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button tyle="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h2 class="modal-title">Registrar Proveedor</h2>
              </div>
              <div class="modal-body">
                <form id="upPro">
          
                  <div class="form-group">
                      <label class="label">Id </label>
                      <input required autocomplete="off" name="id_Proveedor" class="form-control" id="id_Proveedor"
                             type="text" placeholder="Código " readonly>
                  </div>
                  <div class="form-group">
                      <label class="label">Nombre</label>
                      <input required autocomplete="off" name="Nombre" class="form-control" id="Nombre"
                             type="text" placeholder="Nombre">
                  </div>
                  <div class="form-group">
                    <label class="label">Direccion</label>
                    <input required autocomplete="off" name="Direccion" class="form-control" id="Direccion"
                           type="text" placeholder="Proveedor">
                </div>
                  <div class="form-group">
                      <label class="label">Telefono</label>
                      <input required autocomplete="off" name="Telefono" class="form-control" id="Telefono"
                             type="decimal(9,2)" placeholder="Precio de compra">
                  </div>
                  <div class="form-group">
                      <label class="label">E-mail</label>
                      <input required autocomplete="off" name="Email" class="form-control" id="Email"
                             type="decimal(9,2)" placeholder="Precio de venta normal">
                  </div>
                  <div class="form-group">
                    <label class="label">RFC</label>
                    <input required autocomplete="off" name="RFC" class="form-control" id="RFC"
                           type="decimal(9,2)" placeholder="Precio de venta medico">
                </div>
                  <input type="hidden" name="Operacion" id="Operacion" value="Modificar" />
                  <button class="btn btn-success" onclick="updateProveedor();">Guardar</button>
                  <button type="button"class="btn btn-primary" data-dismiss="modal">Cerrar</button>
              </form>
              </div>
            </div>
          </div>
        </div>

    </div>
  </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
    <script src="./js/Funciones.js"></script>
  </body>
  </body>
</html>