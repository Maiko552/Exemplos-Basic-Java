package entities;

public class Triangle {
	
	//propriedade
	public double a;
	public double b;
	public double c;
	
	//métodos
	public double area() {
		double p = (a + b + c) / 2.0;
		return Math.sqrt(p * (p -a) * (p -b) * (p - c));
		
	}
	
}
