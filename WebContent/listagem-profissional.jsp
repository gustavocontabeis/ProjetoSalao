<%@ page import="br.com.projetosalao.entity.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Listagem de profissionais</title>
</head>
<body>
	<a href="${pageContext.request.contextPath}/menu.jsp">Menu</a>
	<h3>Listagem de profissionais</h3>
	<form action="${pageContext.request.contextPath}/CadastroProfissionalServlet" method="post">
		<table border="2" width="100%">
			<tr>
				<td></td>
				<td>Nome</td>
				<td>CPF</td>
				<td>CEP</td>
				<td>Endereço</td>
				<td>Cidade</td>
			</tr>
			<%
				List<Profissional> list = (List<Profissional>) session.getAttribute("profissionais");
				if (list != null) {
					for (Object obj : list) {
						Profissional profissional = (Profissional) obj;
			%>
			<tr>
				<td><input type="radio" name="index" value="<%=list.indexOf(obj)%>" /></td>
				<td><%=profissional.getNome()%></td>
				<td><%=profissional.getCpf()%></td>
				<td><%=profissional.getCep()%></td>
				<td><%=profissional.getEndereco()%></td>
				<td><%=profissional.getCidade()%></td>
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