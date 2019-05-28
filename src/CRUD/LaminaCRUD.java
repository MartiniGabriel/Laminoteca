package CRUD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Aplicacao.Lamina;
import Conexao.Conexao;

public class LaminaCRUD {
	
	public boolean insert(Lamina l) throws SQLException {

		StringBuilder sql = new StringBuilder();
		sql.append("insert into USUARIO");
		sql.append(
				" (codSetor, codMaterial, descDiagnostico, codMaleta, codPosicao) values (");
	
		Connection conn = Conexao.getConexaoMySQL();

		sql.append("\'");
		sql.append(l.getCodSetor());
		sql.append("\', \'");
		sql.append(l.getCodMaterial());
		sql.append("\', \'");
		sql.append(l.getDescDiagnostico());
		sql.append("\', \'");
		sql.append(l.getCodMaleta());
		sql.append("\', \'");
		sql.append(l.getCodPosicao());
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
	
	public boolean update(Lamina l) {
		/* Define a SQL */
		StringBuilder sql = new StringBuilder();
		sql.append("update USUARIO set");
		sql.append(
				" (codSetor, codMaterial, descDiagnostico, codMaleta, codPosicao) values (");

		/* Abre a conexão que criamos o retorno é armazenado na variavel conn */
		Connection conn = Conexao.getConexaoMySQL();


		sql.append("\'");
		sql.append(l.getCodSetor());
		sql.append("\', \'");
		sql.append(l.getCodMaterial());
		sql.append("\', \'");
		sql.append(l.getDescDiagnostico());
		sql.append("\', \'");
		sql.append(l.getCodMaleta());
		sql.append("\', \'");
		sql.append(l.getCodPosicao());
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
	
	public boolean delete(Lamina l) {

		StringBuilder sql = new StringBuilder();
		sql.append("delete from USUARIO");
		sql.append("where id ='");
		sql.append(l.getId());
		sql.append("';");
		
		
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
	
	public Lamina selectLamina() {
		Lamina l = null;
		return l;
	}
	
	public List<Lamina> select() {
		System.out.println("teste");
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * ");
		sql.append("FROM LAMINA;");
		
		Connection conn = Conexao.getConexaoMySQL();
		PreparedStatement comando;
		try {
			System.out.println(sql.toString());
			comando = conn.prepareStatement(sql.toString());
		
		ResultSet resultado = comando.executeQuery();

		List<Lamina> lista = new ArrayList<Lamina>();
		Lamina linha = new Lamina();
		
		System.out.println(resultado.toString());

		while (resultado.next()) {
			System.out.println("!" + resultado.getString("descDiagnostico"));
			linha.setId(resultado.getString("ID"));
			linha.setCodSetor(resultado.getString("codSetor"));
			linha.setCodMaterial(resultado.getString("codMaterial"));
			linha.setDescDiagnostico(resultado.getString("descDiagnostico"));
			linha.setDataCadastro(resultado.getString("dataCadastro"));
			linha.setCodMaleta(resultado.getString("codMaleta"));
			linha.setCodPosicao(resultado.getString("codPosicao"));
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
	

}