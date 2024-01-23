package entities;

public class Product {
	
	//atributos
	private String name;
	private double price;
	private int quantidade;
	
	//Construtor
	public Product(String name, double price, int quantidade) {
		this.name = name;
		this.price = price;
		this.quantidade = quantidade;
	}
	
	//métodos get e set
	
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public int getQuantidade() {
		return quantidade;
	}
	
	//métodos
	public double totalValueInStock() {
		return price * quantidade;
	}
	
	public void addProducts(int quantidade) {
		this.quantidade += quantidade;
	}
	
	public void removeProducts(int quantidade) {
		this.quantidade -= quantidade;
	}
	
	public String toString() {
		return name
			+ ", $ "
			+ String.format("%.2f", price)
			+ " , "
			+ quantidade
			+ " units, Total: $"
			+ String.format("%.2f", totalValueInStock());
	}

}
