package application;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class Program {

	public static void main(String[] args) {
		
		//tipo da lista ctrl + shft + o para importar
		//usar wrapper class sempre
		List<String> list = new ArrayList<>();
		
		list.add("Maria"); // 0
		list.add("Alex");  // 1
		list.add("Jonathan");
		list.add("Maikon");
		list.add("José");
		list.add(2, "Fernando");
		
		System.out.println(list.size());
		
		
		for (String x : list) {
			System.out.println(x);
		}
		
		//remove
		System.out.println("-------------------");
		//remove sem condiçao
		list.remove("José");
		//condição
		list.removeIf(x -> x.charAt(0) == 'M');
		
		for (String x : list) {
			System.out.println(x);
		}
		
		//encontrar posição de elemento
		System.out.println("-------------------");
		System.out.println("Index of Jonathan: " + list.indexOf("Jonathan"));
		
		//filtrar lista
		System.out.println("-------------------");
		// 1. converter para stream
		// 2. filtração do que eu quero
		// 3. e depois voltar para lista
		List<String> result =list.stream().filter(x -> x.charAt(0) == 'A').collect(Collectors.toList());
		
		for (String x : result) {
			System.out.println(x);
		}
		
		//encontrar o primeiro da lista
		System.out.println("-------------------");
		// findFirst irá pegar o primeiro da stream/filtragem se caso o elemento não existir retorna nulo
		String name = list.stream().filter(x -> x.charAt(0) == 'J').findFirst().orElse(null);
		System.out.println(name);
	}

}
