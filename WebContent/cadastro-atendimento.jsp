<%@page import="br.com.projetosalao.entity.Cliente"%>
<%@page import="br.com.projetosalao.entity.Servico"%>
<%@page import="br.com.projetosalao.entity.Profissional"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cadastro de atendimento</title>
</head>
<body>
	<a href="${pageContext.request.contextPath}/menu.jsp">Menu</a>
	<h3>Cadastro de atendimento</h3>

	<dl>
		<dt>Data</dt>
		<dd>
			<input />
		</dd>
		<dt>Cliente</dt>
		<dd>
			<select>
				<option>-- Selecione --</option>
			<%
				List<Cliente> listaCliente = (List<Cliente>) session.getAttribute("clientes");
				if (listaCliente != null) {
					for (Object obj : listaCliente) {
						Cliente cliente = (Cliente) obj;
			%>
				<option><%=cliente.getNome()%></option>
			<%
					}
				}
			%>
			</select>
		</dd>
		<dt>Serviço</dt>
		<dd>
			<select>
				<option>-- Selecione --</option>
			<%
				List<Servico> listaServicos = (List<Servico>) session.getAttribute("servicos");
				if (listaServicos != null) {
					for (Object obj : listaServicos) {
						Servico servico = (Servico) obj;
			%>
				<option><%=servico.getNome()%></option>
			<%
					}
				}
			%>
			</select>
		</dd>
		<dt>Profissional</dt>
		<dd>
			<select>
				<option>-- Selecione --</option>
			<%
				List<Profissional> listaProfissionais = (List<Profissional>) session.getAttribute("profissionais");
				if (listaProfissionais != null) {
					for (Object obj : listaProfissionais) {
						Profissional profissional = (Profissional) obj;
			%>
				<option><%=profissional.getNome()%></option>
			<%
					}
				}
			%>
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
		<dt></dt>
		<dd>
			<input type="button" value="Cadastrar" />
			<input type="button" value="Excluir" />
			<input type="button" value="Cancelar" />
		</dd>
	</dl>

</body>
</html>