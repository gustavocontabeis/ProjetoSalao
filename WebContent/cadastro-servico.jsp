<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<a href="/Projeto-Salao/menu.jsp">Menu</a>
<title>Cadastro de serviço</title>
</head>
<body>
	<h3>Cadastro de serviço </h3>
	<form action="/Projeto-Salao/CadastroServicoServlet" method="post">
	<dl>
		<dt>Código</dt>
		<dd>
			<input name="codigo" value="${servico.codigo}" readonly="readonly" />
		</dd>
		<dt>Nome</dt>
		<dd>
			<input name="nome" value="${servico.nome}" />
		</dd>
		<dt>Tempo</dt>
		<dd>
			<input name="tempo" value="${servico.tempo}" />
		</dd>
		<dt>Valor</dt>
		<dd>
			<input name="valor" value="${servico.valor}" />
		</dd>
		<dt></dt>
		<dd>
			<input type="submit" name="acao" value="Novo" /> 
			<input type="submit" name="acao" value="Cadastrar" /> 
			<input type="submit" name="acao" value="Excluir" /> 
			<input type="submit" name="acao" value="Cancelar" />
		</dd>
	</dl>
</form>
</body>
</html>