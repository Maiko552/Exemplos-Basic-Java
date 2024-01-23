package com.VendasCarros.bean;

public class Carro {
    private int idCarro;
    private String nome_carro;
    private String marca;
    private int ano;
    private String cor;
    private float preco;
    private String dono;

    public Carro(int idCarro, String nome_carro, String marca, int ano, String cor, float preco, String dono) {
        this.idCarro = idCarro;
        this.nome_carro = nome_carro;
        this.marca = marca;
        this.ano = ano;
        this.cor = cor;
        this.preco = preco;
        this.dono = dono;
    }
    public Carro() {
        throw new UnsupportedOperationException("Not supported yet."); 
    }
    
    public int getIdCarro(){
        return idCarro;
    }
    
    public void setIdCarro(int idCarro){
        this.idCarro = idCarro;
    }
    
    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public int getAno() {
        return ano;
    }

    public void setAno(int ano) {
        this.ano = ano;
    }

    public String getNome_carro() {
        return nome_carro;
    }

    public void setNome_carro(String nome_carro) {
        this.nome_carro = nome_carro;
    }

    public String getCor() {
        return cor;
    }

    public void setCor(String cor) {
        this.cor = cor;
    }

    public float getPreco() {
        return preco;
    }

    public void setPreco(float preco) {
        this.preco = preco;
    }
    
    public String getDono(){
        return dono;
    }
    
    public void setDono(String dono){
        this.dono = dono;
    }
    
    
}