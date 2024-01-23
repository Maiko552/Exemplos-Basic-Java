<%-- 
    Document   : Deletar.jsp
    Created on : 9 de jun. de 2023, 19:33:03
    Author     : Maikon
--%>

<%@page import="java.text.*" import="java.lang.*" import="java.sql.*" import="java.util.Date"%>
<%@page import="com.VendasCarros.bean.Proprietario" %>
<%@page import="com.VendasCarros.bean.Carro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de automóveis</title>
    </head>
    <body>
        <h1>Apagando registros</h1>
        <%
            /*-- Entrada --*/
            int idCarro = 0; // Recebendo do .html
            String nomeProprietario = request.getParameter("nome_proprietario");
            String Dono = request.getParameter("dono");
            
            String idCarroStr = request.getParameter("idCarro");
            if (idCarroStr != null && !idCarroStr.isEmpty()) {
                idCarro = Integer.parseInt(idCarroStr);
            }

            /*-- Consulta --*/
            try {
                Class.forName("com.mysql.cj.jdbc.Driver"); // Driver para MySQL -- Registra a Dll
                String url = "jdbc:mysql://localhost:3306/veiculos"; // Determina o servidor e banco(DB)
                Connection conexao = DriverManager.getConnection(url, "root", "");
                
                String deleteCarros = "DELETE FROM carros WHERE idCarro = ?";
                    PreparedStatement stmtCarros = conexao.prepareStatement(deleteCarros);
                    stmtCarros.setInt(1, idCarro);
                    int rowsDeletedCarros = stmtCarros.executeUpdate();
                    stmtCarros.close();
                    
                String deleteProprietario = "DELETE FROM proprietario WHERE nome_proprietario = ?";
                    PreparedStatement stmtProprietario = conexao.prepareStatement(deleteProprietario);
                    stmtProprietario.setString(1, nomeProprietario);
                    int rowsDeletedProprietario = stmtProprietario.executeUpdate();
                    stmtProprietario.close();
                    
                // Excluir carros com base no dono
                String deleteDono = "DELETE FROM carros WHERE dono = ?";
                    PreparedStatement stmtDono = conexao.prepareStatement(deleteDono);
                    stmtDono.setString(1, Dono);
                    int rowsDeletedDono = stmtDono.executeUpdate();
                    stmtDono.close();

                    if (rowsDeletedCarros > 0 || rowsDeletedProprietario > 0 || rowsDeletedDono > 0) {
                        out.println("<br> Registros removidos com sucesso!");
                    } else {
                        out.println("<br> Nenhum registro encontrado para exclusão.");
                    }
                

               conexao.close();
            } catch (Exception ex) {
                out.println("<br> Erro:" + ex);
            }

        %>   
        <br><br>
        <button onclick="document.location = 'index.html'"> Início</button>
    </body>
</html>
