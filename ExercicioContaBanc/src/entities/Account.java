package entities;

public class Account {
	
	//propriedades
	private int number;
	private String holder;
	private double balance;
	
	//construtor com 2 arg
	public Account(int number, String holder) {
		this.number = number;
		this.holder = holder;
	}
	
	//construtor com 3 arg
	public Account(int number, String holder, double initialDeposit) {
		this.number = number;
		this.holder = holder;
		deposit(initialDeposit);
	}
	
	//get and set
	//numero da conta nao pode ser alterado
	//o saldo da conta só pode ser alterado por meio de saque/deposito
	
	public int getNumber() {
		return number;
	}

	public String getHolder() {
		return holder;
	}

	public void setHolder(String holder) {
		this.holder = holder;
	}

	public double getBalance() {
		return balance;
	}
	
	//métodos
	public void deposit(double amount) {
		balance += amount;	
	}
	
	 public void withdraw(double amount) {
		 balance -= amount + 5.0;
	 }
	
	 public String toString() {
		 return "Account " 
				 + number
				 + ", Holder: "
				 + holder
				 + ", Balance: $"
				 + String.format("%.2f", balance);
	 }
	
	
}
