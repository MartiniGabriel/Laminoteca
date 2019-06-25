<%@page import="Aplicacao.Setor"%>
<%@page import="CRUD.SetorCRUD"%>
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
	String descSetor = request.getParameter("descSetor");

	String cad = request.getParameter("cad");
	String up = request.getParameter("up");
	String cod = request.getParameter("cod");
	String del = request.getParameter("del");

	if (cad != null) {
		Setor s = new Setor();
		s.setDescSetor(descSetor);
		SetorCRUD sc = new SetorCRUD();
		if (sc.insert(s)) {
			out.print("<script>alert(\"Setor cadastrado com sucesso!\");window.location.href='SetorLista.jsp'</script>");
		} else {
			out.print("<script>alert(\"Erro ao cadastrar setor!!\");window.location.href='SetorLista.jsp'</script>");
		}
	}
	if (cod != null && descSetor != null && up.equals("2")) {
		Setor s = new Setor();
		s.setDescSetor(descSetor);
		s.setCodSetor(cod);
		SetorCRUD sc = new SetorCRUD();
			if (sc.update(s)) {
				out.print("<script>alert(\"Setor atualizado com sucesso!\");window.location.href='SetorLista.jsp'</script>");
			} else {
				out.print("<script>alert(\"Erro ao atualizar setor!!\");window.location.href='SetorLista.jsp'</script>");
			}
		
	}
	if (del != null && cod != null) {
		Setor s = new Setor();
		s.setDescSetor(descSetor);
		s.setCodSetor(cod);
		SetorCRUD sc = new SetorCRUD();
		if (sc.delete(s)) {
			out.print("<script>alert(\"Setor deletado com sucesso!\");window.location.href='SetorLista.jsp'</script>");
		} else {
			out.print("<script>alert(\"Erro ao deletado setor!!\");window.location.href='SetorLista.jsp'</script>");
		}
	}
%>

<body>

	<div class="d-flex" id="wrapper">

		<!-- Sidebar -->
		<div class="bg-light border-right" id="sidebar-wrapper">
			<div class="sidebar-heading">Laminoteca</div>
			<div class="list-group list-group-flush">
				<a href="LaminaLista.jsp"
					class="list-group-item list-group-item-action bg-light">Listagem
					de lâminas</a>
				<div class="list-group-item list-group-item-action bg-light">
					<ul class="navbar-nav ml-auto mt-2 mt-lg-0">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="LaminaLista.jsp"
							id="navbarDropdown" role="button" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> Lâmina </a>
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
				<button class="btn btn-primary" id="menu-toggle">Menu</button>

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
							aria-expanded="false"> Perfil </a>
							<div class="dropdown-menu dropdown-menu-right"
								aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="#">Usuário</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#">Sair</a>
							</div></li>
					</ul>
				</div>
			</nav>
			<div class="container-fluid">
				<h1 class="mt-4">Cadastro de Setor</h1>
				<p>Informe abaixo as informações do setor a ser cadastrado.</p>
				<p></p>
				<form method="POST" action="SetorCadastro.jsp?<%if(up!=null){out.print("up=2&cod="+cod);}else{out.print("cad=0");}%>">
					<div class="form-row col-md-8">
						<div class="form-group my-1 mr-2">
							<label for="inputCdTubo">Setor</label> <input type="text"
								class="form-control" id="inputCdTubo" name="descSetor"
								placeholder="Setor" 
								<%
									if(cod!=null&&up!=null){
										Setor s = new Setor();
										s.setCodSetor(cod);
										SetorCRUD sc = new SetorCRUD();
										s = sc.selectSetor(s);
										System.out.println(s.getDescSetor());
										out.print(" value=\"" + s.getDescSetor() + "\"");
									}
								%>
								>
						</div>
					</div>
					<div class="form-row col-md-8">
						<%
							if (up != null) {
								out.print("<button type=\"submit\" class=\"btn btn-success\">Atualizar</button>");
							} else {
								out.print("<button type=\"submit\" class=\"btn btn-success\">Cadastrar</button>");
							}
						%>
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