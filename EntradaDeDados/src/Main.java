import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		String x;
		// O valor que eu digitar caira no x (next para string)
		x = sc.next();
		System.out.println("Você Digitou: " + x);
		
		//nextInt para numero inteiro 
		int y;
		y = sc.nextInt();
		System.out.println("Você digitou: " + y);
		
		sc.close();

	}

}
