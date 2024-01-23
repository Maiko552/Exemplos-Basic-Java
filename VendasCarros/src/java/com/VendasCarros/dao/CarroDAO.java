
package com.VendasCarros.dao;

import com.VendasCarros.bean.Carro;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;



public class CarroDAO {
    
    
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
    
    public static List<Carro> getAllCarros(){
        List<Carro> list = new ArrayList<Carro>();
        
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from Carros");
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                Carro carro = new Carro();
                carro.setIdCarro(rs.getInt("idCarro"));
                carro.setMarca(rs.getString("marca"));
                carro.setAno(rs.getInt("ano"));
                carro.setNome_carro(rs.getString("nome_carro"));
                carro.setCor(rs.getString("cor"));
                carro.setPreco(rs.getFloat("preco"));
                list.add(carro);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
        
    }
}


