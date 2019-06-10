package CRUD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Aplicacao.Material;
import Conexao.Conexao;

public class MaterialCRUD {
	
	public boolean insert(Material m) throws SQLException {

		StringBuilder sql = new StringBuilder();
		sql.append("insert into material");
		sql.append(
				" (descMaterial) values (");
	
		Connection conn = Conexao.getConexaoMySQL();

		sql.append("\'");
		sql.append(m.getDescMaterial());
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
	
	public boolean update(Material m) {
		/* Define a SQL */
		StringBuilder sql = new StringBuilder();
		sql.append("update material set");
		sql.append(" descMaterial=");

		/* Abre a conexão que criamos o retorno é armazenado na variavel conn */
		Connection conn = Conexao.getConexaoMySQL();
		

		sql.append("\'");
		sql.append(m.getDescMaterial());
		sql.append("\' where id='");
		sql.append(m.getCodMaterial());
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
	
	public boolean delete(Material m) {

		StringBuilder sql = new StringBuilder();
		sql.append("delete from material");
		sql.append(" where id ='");
		sql.append(m.getCodMaterial());
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
	
	public List<Material> select() {

		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * ");
		sql.append("FROM Material;");
		
		Connection conn = Conexao.getConexaoMySQL();
		PreparedStatement comando;
		try {
			comando = conn.prepareStatement(sql.toString());
		
		ResultSet resultado = comando.executeQuery();

		List<Material> lista = new ArrayList<Material>();
		
		while (resultado.next()) {
			Material linha = new Material();
			linha.setCodMaterial(resultado.getString("id"));
			linha.setDescMaterial(resultado.getString("descMaterial"));
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
	

	public Material selectSetor(Material m) {

		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * ");
		sql.append("FROM Material");
		sql.append(" WHERE id = '");
		sql.append(m.getCodMaterial());
		sql.append("';");
		
		Connection conn = Conexao.getConexaoMySQL();
		PreparedStatement comando;
		try {
			comando = conn.prepareStatement(sql.toString());
			
			System.out.println(comando.toString());
		
		ResultSet resultado = comando.executeQuery();

		
		while (resultado.next()) {
			Material linha = new Material();
			linha.setCodMaterial(resultado.getString("id"));
			linha.setDescMaterial(resultado.getString("descMaterial"));
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