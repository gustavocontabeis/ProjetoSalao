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

import br.com.projetosalao.entity.Servico;

@WebServlet("/CadastroServicoServlet")
public class CadastroServicoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		//response.setContentType("text/html");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/cadastro-servico.jsp");
		dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Busca objetos da sessão
		List<Servico> servicos = null;
		if(request.getSession().getAttribute("servicos") == null){
			servicos = new ArrayList<Servico>();
			request.getSession().setAttribute("servicos", servicos);
		}else {
			servicos = (List<Servico>) request.getSession().getAttribute("servicos");
		}
		
		//Pega valores do request
		String codigo = request.getParameter("codigo");
		String nome = request.getParameter("nome");
		String tempo = request.getParameter("tempo");
		String valor = request.getParameter("valor");
		String acao = request.getParameter("acao");
		String index = request.getParameter("index");
		
		//monta os objeto
		Servico servico = new Servico();
		if(codigo != null && !codigo.equals("")){
			servico.setCodigo(new Integer(codigo));
		}
		servico.setNome(nome);
		servico.setTempo(tempo);
		if(valor != null && !valor.equals("")){
			servico.setValor(new Float(valor));
		}
		
		//valida os vobjetos
		
		//Executa as ações
		if(acao != null && !acao.equals("")){
			if("Novo".equals(acao)){
				servico = new Servico();
			}
			if("Cadastrar".equals(acao)){
				if(codigo != null && !codigo.equals("")){
					Integer codigoInt = new Integer(codigo);
					
					for(Servico servi :servicos){
						if(servi.getCodigo().equals(codigoInt)){
							servico = servi;
							servico.setNome(nome);
							servico.setTempo(tempo);
							if(valor != null && !valor.equals("")){
								servico.setValor(new Float(valor));
							}
						}
					}
				}else{
					servico.setCodigo((int)servicos.size()+1);
					servicos.add(servico);
				}
			}
			if("Selecionar".equals(acao)){
				if(index != null && !index.equals("")){
					servico = servicos.get(new Integer(index));
				}
			}
			if("Excluir".equals(acao)){
				if(codigo!= null && !codigo.equals("")){
					Integer codigoInt = new Integer(codigo);
					for(Servico servi :servicos){
						if(servi.getCodigo().equals(codigoInt)){
							servico = servi;
						}
					}
					servicos.remove(servico);
					servico = new Servico();
				}
			}
			if("Cancelar".equals(acao)){
				response.setContentType("text/html");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/menu.jsp");
				dispatcher.forward(request, response);
				return;
			}
		}
		
		//Insere no escopo
		request.getSession().setAttribute("servico", servico);
		
		//Redireciona para a view
		response.setContentType("text/html");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/cadastro-servico.jsp");
		dispatcher.forward(request, response);
		
	}

}
