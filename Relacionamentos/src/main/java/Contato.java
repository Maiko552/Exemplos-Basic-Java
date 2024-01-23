public class Contato {

    private String nome;
    private String numero;

    public Contato(String nome, String numero) {

    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    @Override
    public String toString() {
        //Nome: <nome>/tNumero: <numero>
        String informacao = String.format("Nome: %s/tnumero: %s", nome, numero);
        return super.toString();
    }
}
