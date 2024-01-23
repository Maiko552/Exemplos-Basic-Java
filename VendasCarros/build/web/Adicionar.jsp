<%-- 
    Document   : Adicionar.jsp
    Created on : 8 de jun. de 2023, 19:31:02
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
        <title>Cadastro de veículo</title>
    </head>
    <body>
        <<h1>Cadastrar novo automóvel</h1>
        
        <%
           /*-- Entrada --*/
        String nome_proprietario = request.getParameter("nome_proprietario");
        String estado = request.getParameter("estado");

        String nome_carro = request.getParameter("nome_carro");
        String marca = request.getParameter("marca");
        int ano = Integer.parseInt(request.getParameter("ano"));
        String cor = request.getParameter("cor");           
        float preco = Float.parseFloat(request.getParameter("preco"));
        String dono = request.getParameter("dono");

            /*-- Process --*/
        Proprietario prop = new Proprietario(nome_proprietario, estado);
        Carro carro = new Carro(0, nome_carro, marca, ano, cor, preco, dono);

            /*-- Gravação --*/                         
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Driver para MySQL -- Registra a Dll
            String url = "jdbc:mysql://localhost:3306/veiculos"; // Determina o servidor e banco(DB)
            Connection conexao = DriverManager.getConnection(url, "root", "");           

            Statement stmt = conexao.createStatement(); // Criar uma instrução com base na conexão.
    
            String mysql = "INSERT INTO proprietario (nome_proprietario, estado) VALUES ('" +
            prop.getNome_proprietario() + "', '" +
            prop.getEstado() + "')";

            String sql = "INSERT INTO carros(marca, ano, nome_carro, cor, preco, dono) VALUES ('" +
            carro.getMarca() + "', " +
            carro.getAno() + ", '" +
            carro.getNome_carro() + "', '" +
            carro.getCor() + "', " +
            carro.getPreco() + ", '" +
            carro.getDono() + "')";

            System.out.println(mysql); // Apenas para verificar a consulta SQL gerada
            System.out.println(sql);

            stmt.executeUpdate(mysql); // Inserir na tabela proprietario primeiro
            stmt.executeUpdate(sql); // Em seguida, inserir na tabela carros
            stmt.close();

            out.println("<br> Registro inserido com sucesso!");
            } catch (Exception ex) {
                out.println("<br> Erro:" + ex);
                }
        %>   
        <br><br>
        <button onclick="document.location='index.html'"> Início</button>
    </body>
</html>
