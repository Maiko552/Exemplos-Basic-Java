<%-- 
    Document   : Consulta_Geral
    Created on : 11 de jun. de 2023, 21:30:05
    Author     : Pichau
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.VendasCarros.bean.Proprietario" %>
<%@page import="com.VendasCarros.bean.Carro"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultando resigistros</title>
        <style>
            table {
                border-collapse: collapse;
                width: 100%;
            }
            th, td{
                padding: 4px;
                text-align: left;
                border: 1px solid #DDD;
            }
            tr:hover {
                background-color: #D6EEEE;
            }
            .material-symbols-outlined {
                font-variation-settings:
                    'FILL' 0,
                    'wght' 400,
                    'GRAD' 0,
                    'opsz' 24
            }
        </style>
    </head>
    <body>
        <h1>Registros salvos!</h1>
        <%             
    /*-- Consulta --*/                         
    try{
        Class.forName("com.mysql.cj.jdbc.Driver"); // Driver para MySQL -- Registra a Dll
        String url = "jdbc:mysql://localhost:3306/veiculos"; // Determina o servidor e banco(DB)
        Connection conexao = DriverManager.getConnection(url, "root", "");           

        Statement stmt = conexao.createStatement(); // Criar uma instrução com base na conexão.                
        String sql = "SELECT * FROM carros";       
                
        ResultSet rs = stmt.executeQuery(sql);
        %>        

        <table style="width:100%">
            <tr bgcolor="F3F3F3">
                <th>#</th>
                <th>Id.</th>
                <th>Marca</th>
                <th>Ano</th>
                <th>Nome Carro</th>
                <th>Cor</th>
                <th>Preço</th>
                <th>Dono</th>
                <th>Atualizar </th>
            </tr>

            <%
                    while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getRow() %></td>
                <td><%= rs.getString("idCarro") %></td>
                <td><%= rs.getString("marca") %></td>
                <td><%= rs.getString("ano") %></td>
                <td><%= rs.getString("nome_carro") %></td>
                <td><%= rs.getString("cor") %></td>
                <td><%= rs.getString("preco") %></td>
                <td><%= rs.getString("dono") %></td>
                <td> <a href="Atualizar1.jsp?id=<%= rs.getString("idCarro") %> "> <span class="material-symbols-outlined">update</span> </td>
            </tr>
            <%
                    }    
            %>
        </table>
        <%
                stmt.close();             
            } catch (Exception ex) {
                out.println("<br> Erro:" + ex);
            }
        %>    
        <br><br>
    </body>
</html>
