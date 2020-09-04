class ContaBancaria {
  int numeroConta;
  String nomeCorrentista;
  double saldoAtual;
  double saldoAbertura;
  double saldoChequeEspecial;
  double limiteChequeEspecial;

  double Depositar(double valor) {
    saldoAtual = saldoAbertura + valor;
    return saldoAtual;
  }

  double Sacar(double valor) {
    saldoAtual = saldoAbertura - valor;
    return saldoAtual;
  }

  double SacarCheque(double valor) {
    saldoChequeEspecial = limiteChequeEspecial - valor;
    return saldoChequeEspecial;
  }
}
