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

import br.com.projetosalao.entity.Profissional;
import br.com.projetosalao.entity.Servico;

@WebServlet("/CadastroProfissionalServlet")
public class CadastroProfissionalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/cadastro-profissional.jsp");
		dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String destino = "/cadastro-profissional.jsp";
		
		//Busca objetos da sessão
		List<Profissional> profissionais = null;
		if(request.getSession().getAttribute("profissionais") == null){
			profissionais = new ArrayList<Profissional>();
			request.getSession().setAttribute("profissionais", profissionais);
		}else {
			profissionais = (List<Profissional>) request.getSession().getAttribute("profissionais");
		}
		
		//Pega valores do request
		String codigo = request.getParameter("codigo");
		String nome = request.getParameter("nome");
		String cpf = request.getParameter("cpf");
		String cep = request.getParameter("cep");
		String endereco = request.getParameter("endereco");
		String cidade = request.getParameter("cidade");
		String acao = request.getParameter("acao");
		String index = request.getParameter("index");
		String mensagem = null;
		
		//monta os objeto
		Profissional profissional = new Profissional();
		if(codigo != null && !codigo.equals("")){
			profissional.setCodigo(new Integer(codigo));
		}
		profissional.setNome(nome);
		profissional.setCpf(cpf);
		profissional.setCep(cep);
		profissional.setEndereco(endereco);
		profissional.setCidade(cidade);
		
		//valida os vobjetos
		
		//Executa as ações
		if(acao != null && !acao.equals("")){
			if("Novo".equals(acao)){
				profissional = new Profissional();
				mensagem = "Novo registro";
			}
			if("Cadastrar".equals(acao)){
				if(codigo != null && !codigo.equals("")){
					Integer codigoInt = new Integer(codigo);
					
					for(Profissional item : profissionais){
						if(item.getCodigo().equals(codigoInt)){
							profissional = item;
							profissional.setNome(nome);
							profissional.setCpf(cpf);
							profissional.setCep(cep);
							profissional.setEndereco(endereco);
							profissional.setCidade(cidade);
						}
					}
				}else{
					if(profissional.getNome().equals("")) {
						mensagem = "O nome é obrigatório.";
					}if(profissional.getCpf().equals("")) {
						mensagem = "O CPF é obrigatório.";
					}else {
						profissional.setCodigo((int)profissionais.size()+1);
						profissionais.add(profissional);
						mensagem = "Cadastrado o novo registro com sucesso.";
					}
					
				}
				request.getSession().setAttribute("profissional", profissional);
			}
			if("Selecionar".equals(acao)){
				if(index != null && !index.equals("")){
					profissional = profissionais.get(new Integer(index));
				}
			}
			if("Excluir".equals(acao)){
				if(codigo != null && !codigo.equals("")){
					Integer codigoInt = new Integer(codigo);
					for(Profissional servi :profissionais){
						if(servi.getCodigo().equals(codigoInt)){
							profissional = servi;
							break;
						}
					}
					profissionais.remove(profissional);
					profissional = new Profissional();
					mensagem = "Registro excluído com sucesso.";
				}else {
					mensagem = "Nenhum registro selecionado";
				}
			}
			if("Cancelar".equals(acao)){
				destino = "/menu.jsp";
			}
			if("Pesquisar".equals(acao)){
				destino = "/listagem-profissional.jsp";
			}
			
		}
		
		//Insere no escopo
		request.getSession().setAttribute("profissionais", profissionais);
		request.getSession().setAttribute("profissional", profissional);
		request.getSession().setAttribute("mensagem", mensagem);
		
		//Redireciona para a view
		response.setContentType("text/html");
		RequestDispatcher dispatcher = request.getRequestDispatcher(destino);
		dispatcher.forward(request, response);
		
	}

}
