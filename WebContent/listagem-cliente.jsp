<%@ page import="br.com.projetosalao.entity.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Listagem de clientes</title>
</head>
<body>
	<a href="${pageContext.request.contextPath}/menu.jsp">Menu</a>
	<h3>Listagem de clientes</h3>
	<form action="${pageContext.request.contextPath}/CadastroClienteServlet" method="post">
		<table border="2" width="100%">
			<tr>
				<td>Código</td>
				<td>Nome</td>
				<td>Sexo</td>
				<td>CPF</td>
				<td>Endereço</td>
			</tr>
			<%
				List<Cliente> list = (List<Cliente>) session.getAttribute("clientes");
				if (list != null) {
					for (Object obj : list) {
						Cliente cliente = (Cliente) obj;
			%>
			<tr>
				<td><input type="radio" name="index" value="<%=list.indexOf(obj)%>" /></td>
				<td><%=cliente.getCodigo()%></td>
				<td><%=cliente.getNome()%></td>
				<td><%=cliente.getSexo()%></td>
				<td><%=cliente.getCpf()%></td>
				<td><%=cliente.getEndereco()%></td>
			</tr>
			<%
					}
				}
			%>
		</table>
		<input type="submit" name="acao" value="Selecionar" />
	</form>

</body>
</html>