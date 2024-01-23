package application;

import java.util.Locale;
import java.util.Scanner;

import entities.Product;

public class Program {

	public static void main(String[] args) {
		
		Locale.setDefault(Locale.US);
		Scanner sc = new Scanner(System.in);
		
		
		//entrada de dados
		System.out.println("Enter product data: ");
		System.out.print("Name: ");
		String name = sc.nextLine();
		
		System.out.print("Price: ");
		double price = sc.nextDouble();
		
		System.out.print("Quantity in stock: ");
		int quantidade = sc.nextInt();
		
		//instancia
		Product produto = new Product(name, price, quantidade);
		
		System.out.println("\nProduct data: " + produto);
		
		//atualização de quantidade de produto 
		System.out.print("\nEnter the number of products to be added in stock: ");
		quantidade = sc.nextInt();
		produto.addProducts(quantidade);
		 
		System.out.println("\nUpdated data: " + produto);
		
		//remoção de produtos em estoque
		System.out.print("\nEnter the number of products to be removed from stock: ");
		quantidade = sc.nextInt();
		produto.removeProducts(quantidade);
		
		System.out.print("\nUpdate data: " + produto);
		
		
		
		
		
		
		
		
		sc.close();
	}

}
