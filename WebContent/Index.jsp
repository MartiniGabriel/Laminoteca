<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Laminoteca BP</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/simple-sidebar.css" rel="stylesheet">

</head>

<body>

    <div class="d-flex" id="wrapper">

        <!-- Sidebar -->
        <div class="bg-light border-right" id="sidebar-wrapper">
            <div class="sidebar-heading">Laminoteca</div>
            <div class="list-group list-group-flush">
                <a href="#" class="list-group-item list-group-item-action bg-light">Listagem de lâminas</a>
                <div class="list-group-item list-group-item-action bg-light">
                    <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="LaminaLista.jsp" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Lâmina
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="LaminaCadastro.jsp">Cadastrar</a>
                                <a class="dropdown-item" href="LaminaLista.jsp">Listar</a>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="list-group-item list-group-item-action bg-light">
                    <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="SetorLista.jsp" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Setor
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="SetorCadastro.jsp">Cadastrar</a>
                                <a class="dropdown-item" href="SetorLista.jsp">Listar</a>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="list-group-item list-group-item-action bg-light">
                    <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="MaterialLista.jsp" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Material
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="MaterialCadastro.jsp">Cadastrar</a>
                                <a class="dropdown-item" href="MaterialLista.jsp">Listar</a>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="list-group-item list-group-item-action bg-light">
                    <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="MaletaLista.jsp" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Maleta
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="MaletaCadastro.jsp">Cadastrar</a>
                                <a class="dropdown-item" href="MaletaLista.jsp">Listar</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- Page Content -->
        <div id="page-content-wrapper">

            <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
                <button class="btn btn-primary" id="menu-toggle">Esconder Menu</button>

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
                        <li class="nav-item active">
                            <a class="nav-link" href="index.html">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Link</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Dropdown
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Another action</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Something else here</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
            <div class="container-fluid">
                <h1 class="mt-4">Simple Sidebar</h1>
                <p>The starting state of the menu will appear collapsed on smaller screens, and will appear non-collapsed on larger screens. When toggled using the button below, the menu will change.</p>
                <p>Make sure to keep all page content within the <code>#page-content-wrapper</code>. The top navbar is optional, and just for demonstration. Just create an element with the <code>#menu-toggle</code> ID which will toggle the menu when clicked.</p>
                <form>
                    <div class="form-row col-md-6">
                        <div class="form-group my-1 mr-2">
                            <label for="inputCdTubo">Código da lâmina (Tubo)</label>
                            <input type="text" class="form-control" id="inputCdTubo" placeholder="Código Tubo">
                        </div>
                    </div>
                    <div class="form-row col-md-6">
                        <label class="form-group my-1 mr-2" for="selectSetor">Setor</label>
                        <select class="custom-select my-1 mr-sm-2" id="selectSetor">
                            <option selected disabled>Selecione...</option>
                            <option value="1">Microscopia</option>
                            <option value="2">Microbiologia</option>
                            <option value="3">Líquidos</option>
                        </select>
                    </div>
                    <div class="form-row col-md-6">
                        <label class="my-1 mr-2" for="selectMaterial">Material</label>
                        <select class="custom-select my-1 mr-sm-2" id="selectMaterial">
                            <option selected disabled>Selecione...</option>
                            <option value="1">Líquido Pleural</option>
                            <option value="2">Líquido de Ascite</option>
                            <option value="3">Líquido de Diálise</option>
                            <option value="3">Líquido Pericárdico</option>
                        </select>
                    </div>
                    <div class="form-row col-md-6">
                        <label class="my-1 mr-2" for="selectMaleta">Maleta</label>
                        <select class="custom-select my-1 mr-sm-2" id="selectMaleta">
                            <option selected disabled>Selecione...</option>
                            <option value="1">Maleta 1</option>
                            <option value="2">Maleta 2</option>
                            <option value="3">Maleta 3</option>
                            <option value="3">Maleta 4</option>
                        </select>
                    </div>
                    <div class="form-row col-md-6">
                        <label class="my-1 mr-2" for="selectPosicaoMaleta">Posição na Maleta</label>
                        <select class="custom-select my-1 mr-sm-2" id="selectPosicaoMaleta">
                            <option selected disabled>Selecione...</option>
                            <option value="1">Posição 1</option>
                            <option value="2">Posição 2</option>
                            <option value="3">POsição 3</option>
                            <option value="3">Posição 4</option>
                        </select>
                    </div>
                    <div class="form-row col-md-10">
                        <label class="my-1 mr-2" for="selectPosicaoMaleta">Descrição do diagnóstico</label>
                        <textarea class="form-control" rows="5" id="descricao"></textarea>
                    </div>
                    <div class="form-row col-md-6">
                        <button type="submit" class="btn btn-primary">Cadastrar</button>
                    </div>
                </form>
            </div>
        </div>
        <!-- /#page-content-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Menu Toggle Script -->
    <script>
        $("#menu-toggle").click(function(e) {
            e.preventDefault();
            $("#wrapper").toggleClass("toggled");
        });

    </script>

</body>

</html>