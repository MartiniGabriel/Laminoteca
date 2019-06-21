package CRUD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Aplicacao.Maleta;
import Conexao.Conexao;

public class MaletaCRUD {
	
	public boolean insert(Maleta m) throws SQLException {

		StringBuilder sql = new StringBuilder();
		sql.append("insert into maleta");
		sql.append(
				" (descMaleta, codMaleta, codPosicao, statusPosicao) values (");
	
		Connection conn = Conexao.getConexaoMySQL();

		sql.append("\'");
		sql.append(m.getDescMaleta());
		sql.append("\', \'");
		sql.append(m.getCodMaleta());
		sql.append("\', \'");
		sql.append(m.getCodPosicao());
		sql.append("\', \'");
		sql.append("Disponível");
		sql.append("\');");

		System.out.println(sql.toString());
		
		Statement st;
		try {
			st = conn.createStatement();
			st.executeUpdate(sql.toString());
			st.close();
			conn.close();
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean update(Maleta m) {
		/* Define a SQL */
		StringBuilder sql = new StringBuilder();
		sql.append("update Maleta set");
		sql.append(" descMaleta=");

		/* Abre a conexão que criamos o retorno é armazenado na variavel conn */
		Connection conn = Conexao.getConexaoMySQL();
		

		sql.append("\'");
		sql.append(m.getDescMaleta());
		sql.append("\', ");
		sql.append("statusPosicao=\'");
		sql.append(m.getStatusPosicao());
		sql.append("\' where id='");
		sql.append(m.getCodMaleta());
		sql.append("';");

		System.out.println(sql.toString());
		
		Statement st;
		try {
			st = conn.createStatement();
			st.executeUpdate(sql.toString());
			st.close();
			conn.close();
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

	}
	
	public boolean delete(Maleta m) {

		StringBuilder sql = new StringBuilder();
		sql.append("delete from Maleta");
		sql.append(" where id ='");
		sql.append(m.getCodMaleta());
		sql.append("';");
		
		System.out.print(sql.toString());
		
		Connection conn = Conexao.getConexaoMySQL();
		
		
		Statement st;
		try {
			st = conn.createStatement();
			st.executeUpdate(sql.toString());
			st.close();
			conn.close();
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

	}
	
	public List<Maleta> select() {

		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * ");
		sql.append("FROM Maleta;");
		
		Connection conn = Conexao.getConexaoMySQL();
		PreparedStatement comando;
		try {
			comando = conn.prepareStatement(sql.toString());
		
		ResultSet resultado = comando.executeQuery();

		List<Maleta> lista = new ArrayList<Maleta>();
		
		while (resultado.next()) {
			Maleta linha = new Maleta();
			linha.setCodMaleta(resultado.getString("codMaleta"));
			linha.setDescMaleta(resultado.getString("descMaleta"));
			linha.setCodPosicao(resultado.getString("codPosicao"));
			linha.setStatusPosicao(resultado.getString("statusPosicao"));
			lista.add(linha);
		}

		resultado.close();
		comando.close();
		conn.close();
		return lista;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		
	}
	

	public Maleta selectMaleta(Maleta m) {

		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * ");
		sql.append("FROM Maleta");
		sql.append(" WHERE id = '");
		sql.append(m.getCodMaleta());
		sql.append("';");
		
		Connection conn = Conexao.getConexaoMySQL();
		PreparedStatement comando;
		try {
			comando = conn.prepareStatement(sql.toString());
			
			System.out.println(comando.toString());
		
		ResultSet resultado = comando.executeQuery();

		Maleta linha = new Maleta();
		
		while (resultado.next()) {
			linha.setCodMaleta(resultado.getString("codMaleta"));
			linha.setDescMaleta(resultado.getString("descMaleta"));
			linha.setCodPosicao(resultado.getString("codPosicao"));
			linha.setStatusPosicao(resultado.getString("statusPosicao"));
		}

		resultado.close();
		comando.close();
		conn.close();
		return null;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		
	}
	
	public void insertPosicoesMaleta(Maleta m) {
		for(int i=0;i<Integer.parseInt(m.getQtdPosicoes());i++) {
			m.setCodPosicao(Integer.toString(i+1));
			try {
				insert(m);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public String getUltimaMaleta() {
		List<Maleta> lista = new ArrayList<Maleta>();
		lista = select();
		
		String maior = "0";
		for(int i=0;i<lista.size();i++) {
			if(Integer.parseInt(lista.get(i).getCodMaleta())>Integer.parseInt(maior)) {
				maior = lista.get(i).getCodMaleta();
			}
		}
		return maior;
	}

}