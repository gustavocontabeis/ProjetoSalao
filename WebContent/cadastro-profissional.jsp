<%@ page import="br.com.projetosalao.entity.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cadastro de profissional</title>
</head>
<body>
	<a href="${pageContext.request.contextPath}/menu.jsp">Menu</a>
	<h3>Cadastro de profissional</h3>
	<h3 style="color: red;">${mensagem}</h3>
	<form action="${pageContext.request.contextPath}/CadastroProfissionalServlet" method="post">
		<dl>
			<dt>Código</dt>
			<dd>
				<input name="codigo" value="${profissional.codigo}" readonly="readonly"/>
			</dd>
			<dt>Nome</dt>
			<dd>
				<input name="nome" value="${profissional.nome}" />
			</dd>
			<dt>CPF</dt>
			<dd>
				<input name="cpf" size="6" maxlength="14" value="${profissional.cpf}" />
			</dd>
			<dt>CEP</dt>
			<dd>
				<input name="cep" size="4" maxlength="9" value="${profissional.cep}" />
			</dd>
			<dt>Endereço</dt>
			<dd>
				<input name="endereco" size="50" maxlength="100" value="${profissional.endereco}" />
			</dd>
			<dt>Cidade</dt>
			<dd>
				<input name="cidade" value="${profissional.cidade}"/>
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