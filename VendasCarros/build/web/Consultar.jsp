<%-- 
    Document   : Consultar
    Created on : 6 de jun. de 2023, 02:37:49
    Author     : Maikon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.*" import="java.lang.*" import="java.sql.*" import="java.util.Date"%>
<%@page import="com.VendasCarros.bean.Proprietario" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <title>Consulta de Veiculos</title>
    </head>
      <body>
        <h1>Automóveis</h1>
        <%
            /*-- Entrada --*/
            String nome_carro = request.getParameter("nome_carro");           

            /*-- Consulta --*/                         
            try{
                Class.forName("com.mysql.cj.jdbc.Driver"); // Driver para MySQL -- Registra a Dll
                String url = "jdbc:mysql://localhost:3306/veiculos"; // Determina o servidor e banco(DB)
                Connection conexao = DriverManager.getConnection(url, "root", "");           

                Statement stmt = conexao.createStatement(); // Criar uma instrução com base na conexão. 
                
                
                String sql = "SELECT * FROM carros WHERE nome_carro LIKE '%" + nome_carro + "%'";       
                
                ResultSet rs = stmt.executeQuery(sql);
                while (rs.next()) {
                    
                    out.println("<h4>Veículos cadastrados:</h4>" + rs.getRow());
                    out.println("<br> IdCarro: " + rs.getString("idCarro"));
                    out.println("<br> Marca: " + rs.getString("marca"));
                    out.println("<br> Ano: " + rs.getInt("ano"));
                    out.println("<br> Nome do carro: " + rs.getString("nome_carro"));
                    out.println("<br> Cor: " + rs.getString("cor"));
                    out.println("<br> Preço R$: " + rs.getFloat("preco"));
                    out.println("<br> Proprietario: " + rs.getString("dono"));
                    
                }                          
                stmt.close();                
                
            } catch (Exception ex) {
                out.println("<br> Erro:" + ex);
            }
        %>    
        
        <br><br>
        <button onclick="document.location='index.html'">Inicio</button>
      </body>
</html>

