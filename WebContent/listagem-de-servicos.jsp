<%@page import="java.util.List"%>
<%@ page import="br.com.projetosalao.entity.Servico" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>listagem de serviços</title>
</head>
<body>
	<a href="${pageContext.request.contextPath}/menu.jsp">Menu</a>
	<h1>listagem de serviços</h1>
<form action="${pageContext.request.contextPath}/CadastroServicoServlet" method="post">
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
			<td><input type="radio" name="index" value="<%= list.indexOf(obj) %>" /></td>
			<td><%= servico.getNome() %></td> 
			<td><%= servico.getTempo() %></td>
			<td><%= servico.getValor() %></td>
		</tr>
		<% }
		}%>
	</table>
	<input type="submit" name="acao" value="Selecionar" />
	</form>
</body>
</html>