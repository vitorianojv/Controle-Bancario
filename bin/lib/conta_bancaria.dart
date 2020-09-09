class ContaBancaria {
  int numeroConta, agencia, operacao;
  String nomeCorrentista;
  double saldoAtual;
  double saldoAbertura;
  double saldoChequeEspecial;
  double limiteChequeEspecial;
  double saldoApos;

  double Depositar(double valor) {
    saldoAtual = saldoAbertura + valor;
    return saldoAtual;
  }

  double Sacar(double valor) {
    saldoAtual = saldoAbertura - valor;
    return saldoAtual;
  }

  double SacarAposDeposito(double valor) {
    saldoApos = saldoAtual - valor;
    return saldoApos;
  }

  double SacarCheque(double valor) {
    saldoChequeEspecial = limiteChequeEspecial - valor;
    return saldoChequeEspecial;
  }

  double ChequeEspecial(double valor) {
    saldoChequeEspecial = (saldoAbertura * 30) / 100;
    return saldoChequeEspecial;
  }
}
