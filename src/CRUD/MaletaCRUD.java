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
				" (descMaleta, qtdPosicoes) values (");
	
		Connection conn = Conexao.getConexaoMySQL();

		sql.append("\'");
		sql.append(m.getDescMaleta());
		sql.append("\', \'");
		sql.append(m.getQtdPosicoes());
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
			linha.setCodMaleta(resultado.getString("id"));
			linha.setDescMaleta(resultado.getString("descMaleta"));
			linha.setQtdPosicoes(resultado.getString("qtdPosicoes"));
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

		
		while (resultado.next()) {
			Maleta linha = new Maleta();
			linha.setCodMaleta(resultado.getString("id"));
			linha.setDescMaleta(resultado.getString("descMaleta"));
			linha.setQtdPosicoes(resultado.getString("qtdPosicoes"));
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