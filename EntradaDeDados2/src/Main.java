import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		
		Scanner scan = new Scanner(System.in);
		
		int x;
		String s1, s2, s3;
		
		System.out.println("Digite um número: ");
		System.out.println("Digite seu nome: ");
		
		//Para ler a linha inteira precisa ser o nextLine
		//Quando usamos comando diferente de NEXTLINE e dá alguma quebra de linha, essa quebra fica pendente na entrada
		//O certo é fazer dois NeXTLINE para nao ocorrer isso
		
		x = scan.nextInt();
		scan.nextLine();
		s1 = scan.nextLine();
		s2 = scan.nextLine();
		s3 = scan.nextLine();
		
		System.out.println("Dados digitados: ");
		System.out.println(x);
		System.out.println(s1);
		System.out.println(s2);
		System.out.println(s3);
		
		scan.close();

	}

}
