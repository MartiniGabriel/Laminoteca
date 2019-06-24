<%@page import="Aplicacao.Maleta"%>
<%@page import="CRUD.MaletaCRUD"%>
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
		
		System.out.println("desc: " + descMaleta + " pos: " + qtdPosicoes);

	String cad = request.getParameter("cad");
	String up = request.getParameter("up");
	String cod = request.getParameter("cod");
	String del = request.getParameter("del");

	if (cad != null) {
		Maleta m = new Maleta();
		m.setDescMaleta(descMaleta);
		m.setQtdPosicoes(qtdPosicoes);
		MaletaCRUD mc = new MaletaCRUD();
		m.setCodMaleta(Integer.toString(Integer.parseInt(mc.getUltimaMaleta())+1));
		if (mc.insertPosicoesMaleta(m)) {
			out.print("<script>alert(\"Maleta cadastrado com sucesso!\");</script>");
		} else {
			out.print("<script>alert(\"Erro ao cadastrar maleta!!\");</script>");
		}
	}
	if (cod != null && descMaleta != null && up.equals("2")) {
		Maleta m = new Maleta();
		m.setDescMaleta(descMaleta);
		m.setCodMaleta(cod);
		MaletaCRUD sc = new MaletaCRUD();
			if (sc.update(m)) {
				out.print("<script>alert(\"Maleta atualizada com sucesso!\");</script>");
			} else {
				out.print("<script>alert(\"Erro ao atualizar maleta!!\");</script>");
			}
		
	}
	if (del != null && cod != null) {
		Maleta m = new Maleta();
		m.setDescMaleta(descMaleta);
		m.setCodMaleta(cod);
		MaletaCRUD mc = new MaletaCRUD();
		if (mc.delete(m)) {
			out.print("<script>alert(\"Maleta deletada com sucesso!\");</script>");
		} else {
			out.print("<script>alert(\"Erro ao deletar maleta!!\");</script>");
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
				<h1 class="mt-4">Cadastro de Maletas</h1>
				<p>Informe abaixo as informações da maleta a ser cadastrada.</p>
				<p></p>
				<form method="POST" action="MaletaCadastro.jsp?<%if(up!=null){out.print("up=2&cod="+cod);}else{out.print("cad=0");}%>">
					<div class="form-row col-md-6">
						<div class="form-group my-1 mr-2">
							<label for="inputCdTubo">Descrição</label> <input type="text"
								class="form-control" id="inputCdTubo"
								placeholder="Descrição da Maleta" name="descMaleta" <%
									if(cod!=null&&up!=null){
										Maleta m = new Maleta();
										m.setCodMaleta(cod);
										MaletaCRUD mc = new MaletaCRUD();
										m = mc.selectMaleta(m);
										out.print(" value=\"" + m.getDescMaleta() + "\"");
									}
								%>>
						</div>
					</div>
					<div class="form-row col-md-6">
						<label class="form-group my-1 mr-2" for="selectSetor">Quantidade de Posições</label>
						<div class="col-10">
							<input class="form-control" type="number" value="50" id="example-number-input" name="qtdPosicoes">
						</div>
					</div>
					<div class="form-row col-md-6">
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