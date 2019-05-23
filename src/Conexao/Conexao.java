package Conexao;

import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;

public class Conexao {
 
             public static String status = "Não conectou...";
 
        public Conexao() {
        }
 
  
 
public static java.sql.Connection getConexaoMySQL() {

    Connection connection = null;
 
    try {

    	String driverName = "com.mysql.jdbc.Driver";                        
        Class.forName(driverName);
 
            String serverName = "127.0.0.1";
            String mydatabase = "Laminoteca";
            String url = "jdbc:mysql://" + serverName + "/" + mydatabase;
            String username = "admin";
            String password = "12345";
            connection = (Connection) DriverManager.getConnection(url, username, password);

            if (connection != null) {
                status = ("STATUS--->Conectado com sucesso!");
            } else {
                status = ("STATUS--->Não foi possivel realizar conexão");
            }
            return connection;
 
        } catch (ClassNotFoundException e) {
        	System.out.println("O driver expecificado nao foi encontrado.");
             return null;
        } catch (SQLException e) {
            System.out.println("Nao foi possivel conectar ao Banco de Dados."); 
            return null;
        }
    }
 
 
    public static String statusConection() {
        return status;
    }
 
 
    public static boolean FecharConexao() {
        try {
            Conexao.getConexaoMySQL().close();
            return true;
        } catch (SQLException e) {
            return false;
        }
    }
 
 
    public static java.sql.Connection ReiniciarConexao() {
        FecharConexao();
        return Conexao.getConexaoMySQL();
    }
 
}