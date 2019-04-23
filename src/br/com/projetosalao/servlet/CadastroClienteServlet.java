package br.com.projetosalao.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.projetosalao.entity.Cliente;
import br.com.projetosalao.entity.Servico;
import br.com.projetosalao.entity.Sexo;

@WebServlet("/CadastroClienteServlet")
public class CadastroClienteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/cadastro-cliente.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String destino = "/cadastro-cliente.jsp";
		
		//Busca objetos da sessão
		List<Cliente> clientes = null;
		if(request.getSession().getAttribute("clientes") == null){
			clientes = new ArrayList<Cliente>();
			request.getSession().setAttribute("clientes", clientes);
		}else {
			clientes = (List<Cliente>) request.getSession().getAttribute("clientes");
		}
		
		//Pega valores do request
		String codigo = request.getParameter("codigo");
		String nome = request.getParameter("nome");
		String cpf = request.getParameter("cpf");
		String sexo = request.getParameter("sexo");
		String endereco = request.getParameter("endereco");
		String cidade = request.getParameter("cidade");
		String acao = request.getParameter("acao");
		String index = request.getParameter("index");
		String mensagem = null;
		
		//monta os objeto
		Cliente cliente = new Cliente();
		if(codigo != null && !codigo.equals("")){
			cliente.setCodigo(new Integer(codigo));
		}
		cliente.setNome(nome);
		cliente.setCpf(cpf);
		if(sexo!=null && !sexo.equals(sexo)) {
			cliente.setSexo(Sexo.valueOf(sexo));
		}
		cliente.setEndereco(endereco);
		
		//valida os vobjetos
		
		//Executa as ações
		if(acao != null && !acao.equals("")){
			if("Novo".equals(acao)){
				cliente = new Cliente();
				mensagem = "Novo registro";
			}
			if("Cadastrar".equals(acao)){
				if(codigo != null && !codigo.equals("")){
					Integer codigoInt = new Integer(codigo);
					
					for(Cliente item : clientes){
						if(item.getCodigo().equals(codigoInt)){
							cliente = item;
							cliente.setNome(nome);
							cliente.setCpf(cpf);
							cliente.setSexo(Sexo.valueOf(sexo));
							cliente.setEndereco(endereco);
						}
					}
				}else{
					if(cliente.getNome().equals("")) {
						mensagem = "O nome é obrigatório.";
					}if(cliente.getCpf().equals("")) {
						mensagem = "O CPF é obrigatório.";
					}else {
						cliente.setCodigo((int)clientes.size()+1);
						clientes.add(cliente);
						mensagem = "Cadastrado o novo registro com sucesso.";
					}
				}
			}
			if("Selecionar".equals(acao)){
				if(index != null && !index.equals("")){
					cliente = clientes.get(new Integer(index));
				}
			}
			if("Excluir".equals(acao)){
				if(codigo != null && !codigo.equals("")){
					Integer codigoInt = new Integer(codigo);
					for(Cliente servi :clientes){
						if(servi.getCodigo().equals(codigoInt)){
							cliente = servi;
							break;
						}
					}
					clientes.remove(cliente);
					cliente = new Cliente();
					mensagem = "Registro excluído com sucesso.";
				}else {
					mensagem = "Nenhum registro selecionado";
				}
			}
			if("Cancelar".equals(acao)){
				destino = "/menu.jsp";
			}
			if("Pesquisar".equals(acao)){
				destino = "/listagem-cliente.jsp";
			}
			
		}
		
		//Insere no escopo
		request.getSession().setAttribute("clientes", clientes);
		request.getSession().setAttribute("cliente", cliente);
		request.getSession().setAttribute("mensagem", mensagem);
		
		//Redireciona para a view
		response.setContentType("text/html");
		RequestDispatcher dispatcher = request.getRequestDispatcher(destino);
		dispatcher.forward(request, response);
		
	}

}
