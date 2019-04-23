<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Entrar no sistema</title>
</head>
<body>
	<h3>Entrar no sistema</h3>
	<form action="${pageContext.request.contextPath}/menu.jsp" method="get">
	<dl>
		<dt>Usuário</dt>
		<dd>
			<input />
		</dd>
		<dt>Senha</dt>
		<dd>
			<input type="password" />
		</dd>
		<dt></dt>
		<dd>
			<button>Entrar</button>
			<button>Esqueci a senha</button>
			<button>Cancelar</button>
		</dd>
	</dl>
	</form>
</body>
</html>