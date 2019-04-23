<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>faturamento diaro</title>
</head>
<body>
	<a href="${pageContext.request.contextPath}/menu.jsp">Menu</a>
	<h1>faturamento diaro</h1>
	de:
	<input value="08/04/2018" /> ate:
	<input value="08/04/2018" />
	<input type="button" value="pesquisar" />
	<!--  -->
	<table border="1">
		<tr>
			<td>cliente</td>
			<td>serviço</td>
			<td>profcional</td>
			<td>horario</td>
			<td>valor</td>
		</tr>
		<tr>
			<td>maeia da graça</td>
			<td>corte femenino</td>
			<td>luana</td>
			<td>8:30</td>
			<td>40,00</td>
		</tr>
		<tr>
			<td>bruna pereira</td>
			<td>mao</td>
			<td>luana</td>
			<td>9:00</td>
			<td>17,00</td>
		</tr>
		<tr>
			<td>laura nobre</td>
			<td>hidrataçao</td>
			<td>cristina</td>
			<td>8:30</td>
			<td>85,00</td>
		</tr>
	</table>
	total 142,00
	<br /> comissao 44,30
</body>
</html>