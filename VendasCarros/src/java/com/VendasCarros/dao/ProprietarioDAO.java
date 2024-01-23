package com.VendasCarros.dao;

import com.VendasCarros.bean.Proprietario;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;



public class ProprietarioDAO {
    
    
    public static Connection getConnection(){
        Connection con = null;
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/veiculos", "root", "" );
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return con;
    }
    
    public static List<Proprietario> getAllProprietarios(){
        List<Proprietario> list = new ArrayList<Proprietario>();
        
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from Proprietario");
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                Proprietario proprietario = new Proprietario();
                proprietario.setNome_proprietario(rs.getString("nome_proprietario"));
                proprietario.setEstado(rs.getString("estado"));
                list.add(proprietario);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
        
    }
}
