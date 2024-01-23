package com.VendasCarros.bean;

public class Proprietario {
    private String nome_proprietario;
    private String estado;

    public Proprietario(String nome_proprietario, String estado) {
        this.nome_proprietario = nome_proprietario;
        this.estado = estado;
    }

    public Proprietario() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public String getNome_proprietario() {
        return nome_proprietario;
    }

    public void setNome_proprietario(String nome_proprietario) {
        this.nome_proprietario = nome_proprietario;
    }

    public String getEstado() {
        return estado;
    }
    
    public void setEstado(String estado) {
        this.estado = estado;
    }
    
}
