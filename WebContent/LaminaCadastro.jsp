<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Aplicacao.Setor"%>
<%@page import="Aplicacao.Lamina"%>
<%@page import="Aplicacao.Material"%>
<%@page import="Aplicacao.Maleta"%>
<%@page import="CRUD.MaletaCRUD"%>
<%@page import="CRUD.LaminaCRUD"%>
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
	
	String codTubo = request.getParameter("codTubo");
	String codSetor = request.getParameter("setor");
	String codMaterial = request.getParameter("material");
	String codPosicao = request.getParameter("maleta");
	String descDiagnostico = request.getParameter("descDiagnostico");
	
	String cad = request.getParameter("cad");
	String up = request.getParameter("up");
	String cod = request.getParameter("cod");
	String del = request.getParameter("del");
	
	Lamina l = new Lamina();
	
	if(cod!=null){
		l.setId(cod);
		LaminaCRUD lc = new LaminaCRUD();
		l = lc.buscaLamina(l);
		System.out.println("Cod: " + cod);
	}

	if (cad != null) {
		
		l.setCodigoTubo(codTubo);
		l.setCodSetor(codSetor);
		l.setCodMaterial(codMaterial);
		l.setCodPosicao(codPosicao);
		l.setDescDiagnostico(descDiagnostico);
		
		LaminaCRUD lc = new LaminaCRUD();
		MaletaCRUD mc = new MaletaCRUD();
		if (lc.insert(l)) {
			mc.updatePosicao(l.getCodPosicao(), "Ocupado");
			out.print("<script>alert(\"Lamina cadastrada com sucesso!\");</script>");
		} else {
			out.print("<script>alert(\"Erro ao cadastrar lamina!!\");</script>");
		}
	}
	if (cod != null && codTubo != null && up.equals("2")) {
		
		Lamina lt = new Lamina();
		LaminaCRUD lc = new LaminaCRUD();
		MaletaCRUD mc = new MaletaCRUD();
		
		l.setCodigoTubo(codTubo);
		l.setCodSetor(codSetor);
		l.setCodMaterial(codMaterial);
		l.setCodPosicao(codPosicao);
		l.setDescDiagnostico(descDiagnostico);
		
		lt = lc.buscaLamina(l);
		System.out.println("POsição antiga: " + lt.getCodPosicao() + " posição autal: " + l.getCodPosicao());
		if(lt.getCodPosicao().equals(l.getCodPosicao())){
			
		}else{
			mc.updatePosicao(lt.getCodPosicao(), "Disponível");
			mc.updatePosicao(l.getCodPosicao(), "Ocupado");
		}
		
			if (lc.update(l)) {
				out.print("<script>alert(\"Lamina atualizada com sucesso!\");</script>");
			} else {
				out.print("<script>alert(\"Erro ao atualizar Lamina!!\");</script>");
			}
		
	}
	if (del != null && cod != null) {
		l.setId(cod);
		LaminaCRUD lc = new LaminaCRUD();
		MaletaCRUD mc = new MaletaCRUD();
		if (lc.delete(l)) {
			mc.updatePosicao(l.getCodPosicao(), "Disponivel");
			out.print("<script>alert(\"Lamina deletada com sucesso!\");</script>");
		} else {
			out.print("<script>alert(\"Erro ao deletar Lamina!!\");</script>");
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
							aria-expanded="false"> Pefil </a>
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
				<h1 class="mt-4">Cadastro de Lâmina</h1>
				<p>Informe abaixo as informações da lâmina a ser cadastrada.</p>
				<p></p>
				<form method="POST" action="LaminaCadastro.jsp?<%if(up!=null){out.print("up=2&cod="+cod);}else{out.print("cad=0");}%>">
					<div class="form-row col-md-6">
						<div class="form-group my-1 mr-2">
							<label for="inputCdTubo">Código da lâmina (Tubo)</label> 
								<%
								if(cod!=null){
									out.print("<input type=\"text\" class=\"form-control\" id=\"inputCdTubo\" name=\"codTubo\" placeholder=\"Código Tubo\" value=\"" + l.getCodigoTubo() + "\">");
								}else{		
									out.print("<input type=\"text\" class=\"form-control\" id=\"inputCdTubo\" name=\"codTubo\" placeholder=\"Código Tubo\" \">");
								}
							%>		
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

								if(cod!=null){
									for (int i = 0; i < listaSetor.size(); i++) {
										if(listaSetor.get(i).getCodSetor().equals(l.getCodSetor())){
											out.print("<option selected value=\"" + listaSetor.get(i).getCodSetor() + "\">"
													+ listaSetor.get(i).getDescSetor() + "</option>");											
										}else{
											out.print("<option value=\"" + listaSetor.get(i).getCodSetor() + "\">"
												+ listaSetor.get(i).getDescSetor() + "</option>");
										}
									}									
								}else{		
									out.print("<option selected disabled>Selecione...</option>");
									for (int i = 0; i < listaSetor.size(); i++) {
										out.print("<option value=\"" + listaSetor.get(i).getCodSetor() + "\">"
											+ listaSetor.get(i).getDescSetor() + "</option>");
									}
								}
							%>
						</select>
					</div>
					<div class="form-row col-md-6">
						<label class="my-1 mr-2" for="selectMaterial">Material</label> <select
							class="custom-select my-1 mr-sm-2" id="selectMaterial" name="material">
							<%
								MaterialCRUD mc = new MaterialCRUD();
								List<Material> listaMaterial = new ArrayList();

								listaMaterial= mc.select();

								if(cod!=null){
									for (int i = 0; i < listaMaterial.size(); i++) {
										if(listaMaterial.get(i).getCodMaterial().equals(l.getCodMaterial())){
											out.print("<option selected value=\"" + listaMaterial.get(i).getCodMaterial() + "\">"
													+ listaMaterial.get(i).getDescMaterial() + "</option>");											
										}else{
											out.print("<option value=\"" + listaMaterial.get(i).getCodMaterial() + "\">"
												+ listaMaterial.get(i).getDescMaterial() + "</option>");
										}
									}									
								}else{		
									out.print("<option selected disabled>Selecione...</option>");
									for (int i = 0; i < listaMaterial.size(); i++) {
										out.print("<option value=\"" + listaMaterial.get(i).getCodMaterial() + "\">"
											+ listaMaterial.get(i).getDescMaterial() + "</option>");
									}
								}
							%>
						</select>
					</div>
					<div class="form-row col-md-6">
						<label class="my-1 mr-2" for="selectMaleta">Maleta | Posição</label> <select
							class="custom-select my-1 mr-sm-2" id="selectMaleta" name="maleta">
							<%
								MaletaCRUD mac = new MaletaCRUD();
								List<Maleta> listaMaleta = new ArrayList();

								listaMaleta = mac.select();

								if(cod!=null){
									for (int i = 0; i < listaMaleta.size(); i++) {
										if(Integer.toString(listaMaleta.get(i).getId()).equals(l.getCodPosicao())){
											out.print("<option selected value=\"" + listaMaleta.get(i).getId() + "\">"
													+ listaMaleta.get(i).getDescMaleta() + " | Posição " + listaMaleta.get(i).getCodPosicao() + "</option>");											
										}else{
											if(listaMaleta.get(i).getStatusPosicao().equals("Disponível")){
											out.print("<option value=\"" + listaMaleta.get(i).getId() + "\">"
													+ listaMaleta.get(i).getDescMaleta() + " | Posição " + listaMaleta.get(i).getCodPosicao() + "</option>");		
											}
											}
									}									
								}else{		
									out.print("<option selected disabled>Selecione...</option>");
									for (int i = 0; i < listaMaleta.size(); i++) {
										if(listaMaleta.get(i).getStatusPosicao().equals("Disponível")){
											out.print("<option value=\"" + listaMaleta.get(i).getId() + "\">"
													+ listaMaleta.get(i).getDescMaleta() + " | Posição " + listaMaleta.get(i).getCodPosicao() + "</option>");	
										}
									}
								}
							%>
						</select>
					</div>
					<div class="form-row col-md-10">
						<label class="my-1 mr-2" for="selectPosicaoMaleta">Descrição do diagnóstico</label>
						<%
								if(cod!=null){
									out.print("<textarea class=\"form-control\" rows=\"5\" id=\"descricao\" name=\"descDiagnostico\">" + l.getDescDiagnostico() + "</textarea>");
								}else{		
									out.print("<textarea class=\"form-control\" rows=\"5\" id=\"descricao\" name=\"descDiagnostico\"></textarea>");
								}
							%>						
					</div>
					<div class="form-row col-md-6">
						&nbsp;
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