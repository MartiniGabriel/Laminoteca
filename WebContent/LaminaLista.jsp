<%@page import="Aplicacao.Lamina"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="CRUD.LaminaCRUD"%>
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
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.quicksearch/2.3.1/jquery.quicksearch.js"></script>

</head>
<%
	List<Lamina> lista = new ArrayList<Lamina>();
	LaminaCRUD lc = new LaminaCRUD();
	
	lista = lc.select();

%>
<body>

	<div class="d-flex" id="wrapper">

		<!-- Sidebar -->
		<div class="bg-light border-right" id="sidebar-wrapper">
			<div class="sidebar-heading">Laminoteca</div>
			<div class="list-group list-group-flush">
				<a href="#" class="list-group-item list-group-item-action bg-light">Listagem
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
				<h1 class="mt-4">Listagem de Lâmina</h1>
				<p>Catálogo de lâminas do sistema.</p>
				<p></p>
				<div class="card-body">
					<div class="table-responsive">
						<div class="form-group input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-search"></i></span> <input name="consulta"
								id="txt_consulta" placeholder="Consultar" type="text"
								class="form-control">
						</div>
						<table class="table" id="tabela">
							<thead>
								<tr>
									<th scope="col">ID</th>
									<th scope="col">Código Tubo</th>
									<th scope="col">Setor</th>
									<th scope="col">Material</th>
									<th scope="col">Diagnóstico</th>
									<th scope="col">Maleta</th>
									<th scope="col">Posição</th>
									<th scope="col">Alterar</th>
									<th scope="col">Excluir</th>
								</tr>
							</thead>
							<tbody>
								<%
									for (int i = 0; i < lista.size(); i++) {
										out.print("<tr>");
										out.print("<th scope=\"row\">" + lista.get(i).getId() + "</th>");
										out.print("<td>" + lista.get(i).getCodigoTubo() + "</td>");
										out.print("<td>" + lista.get(i).getDescSetor() + "</td>");
										out.print("<td>" + lista.get(i).getDescMaterial() + "</td>");
										out.print("<td>" + lista.get(i).getDescDiagnostico() + "</td>");
										out.print("<td>" + "Maleta " + lista.get(i).getCodMaleta() + "</td>");
										out.print("<td>" + "Posição " + lista.get(i).getCodPosicao() + "</td>");
										out.write("<td><a href=\"LaminaCadastro.jsp?up=0&cod=" + lista.get(i).getId()
												+ "\"><button type=\"button\" class=\"btn btn-primary\">Alterar</button></a></td>");
										out.write("<td><a href=\"LaminaCadastro.jsp?del=0&cod=" + lista.get(i).getId()
												+ "\"><button type=\"button\" class=\"btn btn-danger\">Excluir</button></a></td>");
										out.print("</tr>");
									}
								%>
							</tbody>
						</table>
						<script>
							$('input#txt_consulta').quicksearch(
									'table#tabela tbody tr');
						</script>
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