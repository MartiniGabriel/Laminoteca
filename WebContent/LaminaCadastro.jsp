<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Aplicacao.Setor"%>
<%@page import="Aplicacao.Material"%>
<%@page import="Aplicacao.Maleta"%>
<%@page import="CRUD.MaletaCRUD"%>
<%@page import="CRUD.SetorCRUD"%>
<%@page import="CRUD.MaterialCRUD"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Laminoteca BP</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/simple-sidebar.css" rel="stylesheet">

</head>
<%
	String descMaleta = request.getParameter("descMaleta");
	String qtdPosicoes = request.getParameter("qtdPosicoes");

	String cad = request.getParameter("cad");
	String up = request.getParameter("up");
	String cod = request.getParameter("cod");
	String del = request.getParameter("del");
%>
<body>

	<div class="d-flex" id="wrapper">

		<!-- Sidebar -->
		<div class="bg-light border-right" id="sidebar-wrapper">
			<div class="sidebar-heading">Laminoteca</div>
			<div class="list-group list-group-flush">
				<a href="LaminaLista.jsp"
					class="list-group-item list-group-item-action bg-light">Listagem
					de l�minas</a>
				<div class="list-group-item list-group-item-action bg-light">
					<ul class="navbar-nav ml-auto mt-2 mt-lg-0">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="LaminaLista.jsp"
							id="navbarDropdown" role="button" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> L�mina </a>
							<div class="dropdown-menu dropdown-menu-right"
								aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="LaminaCadastro.jsp">Cadastrar</a>
								<a class="dropdown-item" href="LaminaLista.jsp">Listar</a>
							</div></li>
					</ul>
				</div>
				<div class="list-group-item list-group-item-action bg-light">
					<ul class="navbar-nav ml-auto mt-2 mt-lg-0">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="SetorLista.jsp"
							id="navbarDropdown" role="button" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> Setor </a>
							<div class="dropdown-menu dropdown-menu-right"
								aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="SetorCadastro.jsp">Cadastrar</a>
								<a class="dropdown-item" href="SetorLista.jsp">Listar</a>
							</div></li>
					</ul>
				</div>
				<div class="list-group-item list-group-item-action bg-light">
					<ul class="navbar-nav ml-auto mt-2 mt-lg-0">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="MaterialLista.jsp"
							id="navbarDropdown" role="button" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> Material </a>
							<div class="dropdown-menu dropdown-menu-right"
								aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="MaterialCadastro.jsp">Cadastrar</a>
								<a class="dropdown-item" href="MaterialLista.jsp">Listar</a>
							</div></li>
					</ul>
				</div>
				<div class="list-group-item list-group-item-action bg-light">
					<ul class="navbar-nav ml-auto mt-2 mt-lg-0">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="MaletaLista.jsp"
							id="navbarDropdown" role="button" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> Maleta </a>
							<div class="dropdown-menu dropdown-menu-right"
								aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="MaletaCadastro.jsp">Cadastrar</a>
								<a class="dropdown-item" href="MaletaLista.jsp">Listar</a>
							</div></li>
					</ul>
				</div>
			</div>
		</div>

		<!-- Page Content -->
		<div id="page-content-wrapper">

			<nav
				class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
				<button class="btn btn-primary" id="menu-toggle">Esconder
					Menu</button>

				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ml-auto mt-2 mt-lg-0">
						<li class="nav-item active"><a class="nav-link"
							href="LaminaLista.jsp">Home <span class="sr-only">(current)</span></a>
						</li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> Pefil </a>
							<div class="dropdown-menu dropdown-menu-right"
								aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="#">Usu�rio</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#">Sair</a>
							</div></li>
					</ul>
				</div>
			</nav>
			<div class="container-fluid">
				<h1 class="mt-4">Cadastro de L�mina</h1>
				<p>Informe abaixo as informa��es da l�mina a ser cadastrada.</p>
				<p></p>
				<form>
					<div class="form-row col-md-6">
						<div class="form-group my-1 mr-2">
							<label for="inputCdTubo">C�digo da l�mina (Tubo)</label> <input
								type="text" class="form-control" id="inputCdTubo" name="codTubo"
								placeholder="C�digo Tubo">
						</div>
					</div>
					<div class="form-row col-md-6">
						<label class="form-group my-1 mr-2" for="selectSetor">Setor</label>
						<select class="custom-select my-1 mr-sm-2" id="selectSetor"
							name="setor">
							<%
								SetorCRUD sc = new SetorCRUD();
								List<Setor> listaSetor = new ArrayList();

								listaSetor = sc.select();

								for (int i = 0; i < listaSetor.size(); i++) {
									out.print("<option value=\"" + listaSetor.get(i).getCodSetor() + "\">"
											+ listaSetor.get(i).getDescSetor() + "</option>");
								}
							%>
							<option selected disabled>Selecione...</option>
							<option value="1">Microscopia</option>
							<option value="2">Microbiologia</option>
							<option value="3">L�quidos</option>
						</select>
					</div>
					<div class="form-row col-md-6">
						<label class="my-1 mr-2" for="selectMaterial">Material</label> <select
							class="custom-select my-1 mr-sm-2" id="selectMaterial">
							<option selected disabled>Selecione...</option>
							<option value="1">L�quido Pleural</option>
							<option value="2">L�quido de Ascite</option>
							<option value="3">L�quido de Di�lise</option>
							<option value="3">L�quido Peric�rdico</option>
						</select>
					</div>
					<div class="form-row col-md-6">
						<label class="my-1 mr-2" for="selectMaleta">Maleta</label> <select
							class="custom-select my-1 mr-sm-2" id="selectMaleta">
							<option selected disabled>Selecione...</option>
							<option value="1">Maleta 1</option>
							<option value="2">Maleta 2</option>
							<option value="3">Maleta 3</option>
							<option value="3">Maleta 4</option>
						</select>
					</div>
					<div class="form-row col-md-6">
						<label class="my-1 mr-2" for="selectPosicaoMaleta">Posi��o
							na Maleta</label> <select class="custom-select my-1 mr-sm-2"
							id="selectPosicaoMaleta">
							<option selected disabled>Selecione...</option>
							<option value="1">Posi��o 1</option>
							<option value="2">Posi��o 2</option>
							<option value="3">Posi��o 3</option>
							<option value="3">Posi��o 4</option>
						</select>
					</div>
					<div class="form-row col-md-10">
						<label class="my-1 mr-2" for="selectPosicaoMaleta">Descri��o
							do diagn�stico</label>
						<textarea class="form-control" rows="5" id="descricao"></textarea>
					</div>
					<div class="form-row col-md-6">
						<button type="submit" class="btn btn-success">Cadastrar</button>
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