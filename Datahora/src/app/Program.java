package app;

import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Program {

	public static void main(String[] args) {
		
		//https://docs.oracle.com/en/java/javase/18/docs/api/java.base/java/time/format/DateTimeFormatter.html
		DateTimeFormatter fmt1 = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		DateTimeFormatter fmt2 = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
		
		
		//Local date de agora
		LocalDate d01 = LocalDate.now();
		//com horas
		LocalDateTime d02 = LocalDateTime.now();
		//fuso horário de Londres GMT
		Instant d03 = Instant.now();
		
		LocalDate d04 = LocalDate.parse("2023-04-03");
		//padrao ISO 8601
		LocalDateTime d05 = LocalDateTime.parse("2023-04-03T18:25:45");
		//horarios de Londres Zulu time
		Instant d06 = Instant.parse("2023-04-03T18:29:00Z");
		//gmt -3 Brasil (menos 3 horas de londres)
		Instant d07 = Instant.parse("2023-04-03T18:29:00-03:00");
		
		//passando formato customizado porem imprime em formato ISO (yyyy-MM-dd)
		LocalDate d08 = LocalDate.parse("03/04/2023", fmt1);
		
		//Customizado como do brasil 
		LocalDateTime d09 = LocalDateTime.parse("03/04/2023 18:41", fmt2);
		
		
		System.out.println("d01 = " + d01.toString());
		System.out.println("d02 = " + d02.toString());
		System.out.println("d03 = " + d03.toString());
		System.out.println("d04 = " + d04.toString());
		System.out.println("d05 = " + d05.toString());
		System.out.println("d06 = " + d06.toString());
		System.out.println("d07 = " + d07.toString());
		System.out.println("d08 = " + d08.toString());
		System.out.println("d09 = " + d09.toString());
		
	}

}
