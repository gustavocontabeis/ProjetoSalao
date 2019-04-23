<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Agendamento</title>
</head>
<body>
	<a href="${pageContext.request.contextPath}/menu.jsp">Menu</a>
	<h3>Agendamento</h3>

	<dl>
		<dt>Data</dt>
		<dd>
			<input />
		</dd>
		<dt>Cliente</dt>
		<dd>
			<select>
				<option>-- Selecione --</option>
			</select>
		</dd>
		<dt>Serviço</dt>
		<dd>
			<select>
				<option>-- Selecione --</option>
			</select>
		</dd>
		<dt>Profissional</dt>
		<dd>
			<select>
				<option>-- Selecione --</option>
			</select>
		</dd>
		<dt>Horário</dt>
		<dd>
			<input />
		</dd>
		<dt>Valor</dt>
		<dd>
			<input />
		</dd>
		<dt>Notificar cliente</dt>
		<dd>
			<label for="sms">SMS</label>
			<input name="sms" type="checkbox" />
			<label for="whats">Whatsapp</label>
			<input name="whats" type="checkbox" />
			<label for="email">E-mail</label>
			<input name="email" type="checkbox" />
			<input name="quant" size="1" />
			<select>
				<option>Horas</option>
				<option>Dias</option>
			</select>
		</dd>
		<dt></dt>
		<dd>
			<input type="button" value="Cadastrar" />
			<input type="button" value="Excluir" />
			<input type="button" value="Cancelar" />
		</dd>
	</dl>

</body>
</html>