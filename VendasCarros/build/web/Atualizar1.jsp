<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.VendasCarros.bean.Proprietario" %>
<%@page import="com.VendasCarros.bean.Carro"%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Atualizar Registros</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style.css" type="text/css">
        <style></style>
    </head>
    <body>
        <%
    /*-- Consulta --*/                         
    try {
        Class.forName("com.mysql.cj.jdbc.Driver"); // Driver para MySQL -- Registra a Dll
        String url = "jdbc:mysql://localhost:3306/veiculos"; // Determina o servidor e banco(DB)
        Connection conexao = DriverManager.getConnection(url, "root", "");           

        Statement stmt = conexao.createStatement(); // Criar uma instrução com base na conexão. 
                
        /*-- "SELECT * FROM produto WHERE nome LIKE '%de%'" --*/
        String idCarro = request.getParameter("id");
        String sql = "SELECT c.*, p.nome_proprietario, p.estado " +
             "FROM carros c " +
             "INNER JOIN proprietario p ON c.dono = p.nome_proprietario " +
             "WHERE c.idCarro = " + idCarro;

        ResultSet rs = stmt.executeQuery(sql);
        if (rs.next()) {
            String idCarroValue = rs.getString("idCarro");
            String nomeProprietarioValue = rs.getString("nome_proprietario");
            String estadoValue = rs.getString("estado");
            String marcaValue = rs.getString("marca");
            int anoValue = rs.getInt("ano");
            String corValue = rs.getString("cor");
            float precoValue = rs.getFloat("preco");
            String nomeCarroValue = rs.getString("nome_carro");
        %>
        <h1>Atualizar Registros</h1>
        <form name="frmAtualizar" method="post" action="Atualizar.jsp"> <br>
            ID:<input type="number"  placeholder="ID" name="idCarro" value="<%= idCarroValue %>"><br>
            Nome do Proprietario do veículo:<input type="text"  placeholder="Digite nome cadastrado" name="nome_proprietario" value="<%= nomeProprietarioValue %>"><br><br><br>
            Estado residente:<input type="text"  placeholder="Estado" name="estado" value="<%= estadoValue %>"><br>
            Marca do veículo:<input type="text"  placeholder="Marca" name="marca" value="<%= marcaValue %>"><br>
            Ano:<input type="number"  placeholder="ano" name="ano" value="<%= anoValue %>"><br>
            Cor:<input type="text" placeholder="Cor" name="cor" value="<%= corValue %>"><br>
            Valor R$:<input type="number"  placeholder="R$" name="preco" value="<%= precoValue %>"><br>
            Nome do veículo:<input type="text"  placeholder="nome do carro" name="nome_carro" value="<%= nomeCarroValue %>"><br>

            <input type="submit" value="Atualizar">
        </form>
        <%                      
            } else {
        %>
        <h1>Nenhum registro encontrado</h1>
        <%
            }
            stmt.close();
        } catch (Exception ex) {
            out.println("<br> Erro:" + ex);
        }
        %>
    </body>
</html>
