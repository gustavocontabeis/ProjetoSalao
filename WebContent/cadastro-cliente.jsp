<%@ page import="br.com.projetosalao.entity.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cadastro de Cliente</title>
</head>
<body>
	<a href="${pageContext.request.contextPath}/menu.jsp">Menu</a>
	<h3>Cadastro de Cliente</h3>
	<h3 style="color: red;">${mensagem}</h3>
	<form action="${pageContext.request.contextPath}/CadastroClienteServlet" method="post">
		<dl>
			<dt>Código</dt>
			<dd>
				<input name="codigo" value="${cliente.codigo}" readonly="readonly"/>
			</dd>
			<dt>Nome</dt>
			<dd>
				<input name="nome" value="${cliente.nome}" />
			</dd>
			<dt>CPF</dt>
			<dd>
				<input name="cpf" size="6" maxlength="14" value="${cliente.cpf}" />
			</dd>
			<dt>Sexo</dt>
			<dd>
				Masculino: <input type="radio" name="sexo" value="MASCULINO" />
				Feminino: <input type="radio" name="sexo" value="FEMININO" />
			</dd>
			<dt>Endereço</dt>
			<dd>
				<input name="endereco" size="50" maxlength="100" value="${cliente.endereco}" />
			</dd>
			<dd>
				<input type="submit" name="acao" value="Novo" /> 
				<input type="submit" name="acao" value="Cadastrar" /> 
				<input type="submit" name="acao" value="Excluir" /> 
				<input type="submit" name="acao" value="Cancelar" />
				<input type="submit" name="acao" value="Pesquisar" />
			</dd>
		</dl>
	</form>

</body>
</html>