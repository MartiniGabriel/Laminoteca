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
		sql.append("insert into LAMINA");
		sql.append(
				" (codTubo, codSetor, codMaterial, descDiagnostico, codPosicao, nome) values (");
	
		Connection conn = Conexao.getConexaoMySQL();

		sql.append("\'");
		sql.append(l.getCodigoTubo());
		sql.append("\', \'");
		sql.append(l.getCodSetor());
		sql.append("\', \'");
		sql.append(l.getCodMaterial());
		sql.append("\', \'");
		sql.append(l.getDescDiagnostico());
		sql.append("\', \'");
		sql.append(l.getCodPosicao());
		sql.append("\', \'");
		sql.append(l.getNome());
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
	
	public boolean update(Lamina l) {
		/* Define a SQL */
		StringBuilder sql = new StringBuilder();
		sql.append("update lamina set");
		
		/* Abre a conexão que criamos o retorno é armazenado na variavel conn */
		Connection conn = Conexao.getConexaoMySQL();

		sql.append(" codTubo = \'");
		sql.append(l.getCodigoTubo());
		sql.append("\', codSetor = \'");
		sql.append(l.getCodSetor());
		sql.append("\', codMaterial = \'");
		sql.append(l.getCodMaterial());
		sql.append("\', descDiagnostico = \'");
		sql.append(l.getDescDiagnostico());
		sql.append("\', codPosicao = \'");
		sql.append(l.getCodPosicao());
		sql.append("\', nome = \'");
		sql.append(l.getNome());
		sql.append("\'"
				+ " where id = "
				+  l.getId() 
				+ ";");

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
	
	public boolean delete(Lamina l) {

		StringBuilder sql = new StringBuilder();
		sql.append("delete from lamina");
		sql.append(" where id ='");
		sql.append(l.getId());
		sql.append("';");
		
		
		Connection conn = Conexao.getConexaoMySQL();
		
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
	
	public Lamina selectLamina() {
		Lamina l = null;
		return l;
	}
	
	public List<Lamina> select() {
		System.out.println("teste");
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT l.id, l.codTubo, l.codSetor, s.descSetor, l.codMaterial, m.descMaterial, l.descDiagnostico, l.dataCadastro, l.codPosicao, l.nome \r\n" + 
				"from lamina l \r\n" + 
				"	JOIN material m\r\n" + 
				"		ON m.id = l.codMaterial\r\n" + 
				"	JOIN setor s\r\n" + 
				"		ON s.id = l.codSetor\r\n");
		
		Connection conn = Conexao.getConexaoMySQL();
		PreparedStatement comando;
		try {
			System.out.println(sql.toString());
			comando = conn.prepareStatement(sql.toString());
		
		ResultSet resultado = comando.executeQuery();

		List<Lamina> lista = new ArrayList<Lamina>();
		
		
		while (resultado.next()) {
			Lamina linha = new Lamina();
			linha.setId(resultado.getString("ID"));
			linha.setCodigoTubo(resultado.getString("codTubo"));
			linha.setCodSetor(resultado.getString("codSetor"));
			linha.setDescSetor(resultado.getString("descSetor"));
			linha.setCodMaterial(resultado.getString("codMaterial"));
			linha.setDescMaterial(resultado.getString("descMaterial"));
			linha.setDescDiagnostico(resultado.getString("descDiagnostico"));
			linha.setDataCadastro(resultado.getString("dataCadastro"));
			linha.setCodPosicao(resultado.getString("codPosicao"));
			linha.setNome(resultado.getString("nome"));
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
	
	public Lamina buscaLamina(Lamina l) {
		
		List<Lamina> lista = new ArrayList<Lamina>();
		lista = select();
		
		for(int i=0;i<lista.size();i++){
			if(lista.get(i).getId().equals(l.getId())) {
				return lista.get(i);
			}
		}
		
		
		return null;
		
	}

}