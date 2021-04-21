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
                    <tr style="text-align: center">
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>
                            <a class="btn btn-warning" href="#">
                                <i class="fa fa-edit"></i>
                            </a>
                        </td>
                        <td>
                            <form action="#" method="post">
                                <button type="submit" class="btn btn-danger">
                                    <i class="fa fa-trash"></i>
                                </button>
                            </form>
                        </td>
                    </tr>
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
                <form method="POST" action="{{route("productos.store")}}">
          
                  <div class="form-group">
                      <label class="label">Id </label>
                      <input required autocomplete="off" name="codigo_barras" class="form-control"
                             type="text" placeholder="Código ">
                  </div>
                  <div class="form-group">
                      <label class="label">Nombre</label>
                      <input required autocomplete="off" name="descripcion" class="form-control"
                             type="text" placeholder="Nombre">
                  </div>
                  <div class="form-group">
                    <label class="label">Direccion</label>
                    <input required autocomplete="off" name="precio_compra" class="form-control"
                           type="text" placeholder="Proveedor">
                </div>
                  <div class="form-group">
                      <label class="label">Telefono</label>
                      <input required autocomplete="off" name="precio_compra" class="form-control"
                             type="decimal(9,2)" placeholder="Precio de compra">
                  </div>
                  <div class="form-group">
                      <label class="label">E-mail</label>
                      <input required autocomplete="off" name="precio_venta" class="form-control"
                             type="decimal(9,2)" placeholder="Precio de venta normal">
                  </div>
                  <div class="form-group">
                    <label class="label">RFC</label>
                    <input required autocomplete="off" name="precio_venta" class="form-control"
                           type="decimal(9,2)" placeholder="Precio de venta medico">
                </div>
                  <button class="btn btn-success">Guardar</button>
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
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
  </body>
</html>