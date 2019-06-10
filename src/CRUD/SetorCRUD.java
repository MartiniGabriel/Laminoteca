package CRUD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Aplicacao.Setor;
import Conexao.Conexao;

public class SetorCRUD {
	
	public boolean insert(Setor s) throws SQLException {

		StringBuilder sql = new StringBuilder();
		sql.append("insert into SETOR");
		sql.append(
				" (descSetor) values (");
	
		Connection conn = Conexao.getConexaoMySQL();

		sql.append("\'");
		sql.append(s.getDescSetor());
		sql.append("\');");

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
	
	public boolean update(Setor s) {
		/* Define a SQL */
		StringBuilder sql = new StringBuilder();
		sql.append("update SETOR set");
		sql.append(" descSetor=");

		/* Abre a conexão que criamos o retorno é armazenado na variavel conn */
		Connection conn = Conexao.getConexaoMySQL();
		

		sql.append("\'");
		sql.append(s.getDescSetor());
		sql.append("\' where id='");
		sql.append(s.getCodSetor());
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
	
	public boolean delete(Setor s) {

		StringBuilder sql = new StringBuilder();
		sql.append("delete from SETOR");
		sql.append(" where id ='");
		sql.append(s.getCodSetor());
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
	
	public List<Setor> select() {

		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * ");
		sql.append("FROM SETOR;");
		
		Connection conn = Conexao.getConexaoMySQL();
		PreparedStatement comando;
		try {
			comando = conn.prepareStatement(sql.toString());
		
		ResultSet resultado = comando.executeQuery();

		List<Setor> lista = new ArrayList<Setor>();
		
		while (resultado.next()) {
			Setor linha = new Setor();
			linha.setCodSetor(resultado.getString("id"));
			linha.setDescSetor(resultado.getString("descSetor"));
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
	

	public Setor selectSetor(Setor s) {

		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * ");
		sql.append("FROM SETOR");
		sql.append(" WHERE id = '");
		sql.append(s.getCodSetor());
		sql.append("';");
		
		Connection conn = Conexao.getConexaoMySQL();
		PreparedStatement comando;
		try {
			comando = conn.prepareStatement(sql.toString());
			
			System.out.println(comando.toString());
		
		ResultSet resultado = comando.executeQuery();

		
		while (resultado.next()) {
			Setor linha = new Setor();
			linha.setCodSetor(resultado.getString("id"));
			linha.setDescSetor(resultado.getString("descSetor"));
			return linha;
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

}