<%@ page import="br.com.projetosalao.entity.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cadastro de profissional</title>
</head>
<body>
	<a href="/Projeto-Salao/menu.jsp">Menu</a>
	<h3>Cadastro de profissional</h3>

	<dl>
		<dt>Nome</dt>
		<dd>
			<input name="nome" />
		</dd>
		<dt>CPF</dt>
		<dd>
			<input name="cpf" size="6" maxlength="14"/>
		</dd>
		<dt>CEP</dt>
		<dd>
			<input name="cep" size="4" maxlength="9" />
		</dd>
		<dt>Endereço</dt>
		<dd>
			<input name="endereco" size="50" maxlength="100" />
		</dd>
		<dt>Cidade</dt>
		<dd>
			<input name="cidade" />
		</dd>
		<dt> </dt>
		<dd>
			<table border="2" width="100%">
				<tr>
					<td></td>
					<td>Nome do serviço</td>
					<td>tempo para execução</td>
					<td>Valor</td>
				</tr>
				<% List<Servico> list = (List<Servico>) session.getAttribute("servicos"); 
				if(list != null){
				for(Object obj : list){
					Servico servico = (Servico) obj; %>
				<tr>
					<td><input type="checkbox" name="<%= servico.getCodigo() %>" value="<%= list.indexOf(obj) %>" /></td>
					<td><%= servico.getNome() %></td> 
					<td><%= servico.getTempo() %></td>
					<td><%= servico.getValor() %></td>
				</tr>
				<% }
				}%>
			</table>		
		</dd>
		<dd>
			<input type="button" value="Cadastrar" />
			<input type="button" value="Excluir" />
			<input type="button" value="Cancelar" />
		</dd>
	</dl>
		

</body>
</html>