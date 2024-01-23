<%-- 
    Document   : Consultar
    Created on : 6 de jun. de 2023, 02:37:49
    Author     : Maikon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.*" import="java.lang.*" import="java.sql.*" import="java.util.Date"%>
<%@page import="com.VendasCarros.bean.Proprietario" %>
<%@page import="com.VendasCarros.bean.Carro"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <title>Atualizar Registros</title>
    </head>
      <body>
        <h1>Atualizar Registros</h1>
        
        <%
        int idCarro = Integer.parseInt(request.getParameter("idCarro"));
        String nome_proprietario = request.getParameter("nome_proprietario");
        String estado = request.getParameter("estado");

        String marca = request.getParameter("marca");
        int ano = Integer.parseInt(request.getParameter("ano"));
        
        String cor = request.getParameter("cor");
        float preco = Float.parseFloat(request.getParameter("preco"));
        String dono = request.getParameter("dono");
        String nome_carro = request.getParameter("nome_carro");

        /* Processamento */
        Proprietario prop = new Proprietario(nome_proprietario, estado);
        Carro carro = new Carro(0, nome_carro, marca, ano, cor, preco, dono);

       /*-- Consulta --*/                         
            try{
                Class.forName("com.mysql.cj.jdbc.Driver"); // Driver para MySQL -- Registra a Dll
                String url = "jdbc:mysql://localhost:3306/veiculos"; // Determina o servidor e banco(DB)
                Connection conexao = DriverManager.getConnection(url, "root", "");           

                Statement stmt = conexao.createStatement(); // Criar uma instrução com base na conexão. 
                
                String sql = "SELECT * FROM carros WHERE idCarro LIKE '%" + idCarro + "%'"; 
                
               
                String updateProp = "UPDATE proprietario SET estado = ? WHERE nome_proprietario = ?";
                    PreparedStatement stmtProp = conexao.prepareStatement(updateProp);
                    stmtProp.setString(1, estado);
                    stmtProp.setString(2, nome_proprietario);
                    int rowsUpdatedProp = stmtProp.executeUpdate();
                    stmtProp.close();
                    
                    String updateCarro = "UPDATE carros SET marca = ?, ano = ?, cor = ?, preco = ? WHERE idCarro = ?";
                    PreparedStatement stmtCarro = conexao.prepareStatement(updateCarro);
                    stmtCarro.setString(1, marca);
                    stmtCarro.setInt(2, ano);
                    stmtCarro.setString(3, cor);
                    stmtCarro.setFloat(4, preco);
                    stmtCarro.setInt(5, idCarro);
                    int rowsUpdatedCarro = stmtCarro.executeUpdate();
                    stmtCarro.close(); 
                    
                    if (rowsUpdatedProp > 0 || rowsUpdatedCarro > 0) {
                        out.println("<br> Registros atualizados com sucesso!");
                    } else {
                        out.println("<br> Nenhum registro encontrado para atualização.");
                    }
                    
                
                String sqli = "SELECT * FROM carros";      
                
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
            out.println("<br> Erro: " + ex);
        }

        %>
  
        <button onclick="document.location='index.html'">Inicio</button>
    </body>
</html> 