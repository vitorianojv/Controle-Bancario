import 'dart:io';
import 'lib/conta_bancaria.dart';

// String cpfValidator() => 'lib/cpf.dart';

void main(List<String> args) {

  // Classe dos métodos (Sacar, Depositar e Cheque Especial)
  ContaBancaria cb = new ContaBancaria();

  String op, op2, op3;
  String tipoBanco, nome, senha, repSenha, banco;
  int cpf;
  String dataNasc;

  // Cadastro do usuário
  print("\n----- Casdastre-se -----\n");

  print("Digite seu nome completo: ");
  nome = stdin.readLineSync();

  print("Digite seu CPF: ");
  cpf = int.parse(stdin.readLineSync());

  print("Digite sua data de nascimento: ");
  dataNasc = (stdin.readLineSync());

  print("Digite sua senha: ");
  senha = stdin.readLineSync();

  print("Repita a senha ");
  repSenha = stdin.readLineSync();

  // Login do usuário
  print("\n----- Login -----\n");
  print("Entre na sua conta: ");
  print("Digite seu CPF: ");
  cpf = int.parse(stdin.readLineSync());
  print("Digite sua senha: ");
  senha = stdin.readLineSync();

  // Escolha do banco
  while (tipoBanco != "104" && tipoBanco != "033" && tipoBanco != "077") {
    print(
        "Informe o banco da sua conta: - [104] = Caixa | [033] = Santander | [077] = Inter ");

    tipoBanco = (stdin.readLineSync());

    if (tipoBanco == "104") {
      print("\nCAIXA ");
      banco = 'Caixa';
    } else if (tipoBanco == "033") {
      print("\nSANTANDER ");
      banco = 'Santander';
    } else if (tipoBanco == "077") {
      print("\nInter ");
      banco = 'Inter';
    } else {
      print("Opcção Inválida! Digite novamente: ");
      tipoBanco = (stdin.readLineSync());
    }
  }

  // Dados bancários
  print("Informe o número da agência: ");
  cb.agencia = int.parse(stdin.readLineSync());
  print("");
  print("Informe o número da operação: ");
  cb.operacao = int.parse(stdin.readLineSync());
  print("");
  print("Informe o número da sua conta: ");
  cb.numeroConta = int.parse(stdin.readLineSync());
  print("");
  print("Informe o saldo de abertura: ");
  cb.saldoAbertura = double.parse(stdin.readLineSync());
  print("");
  cb.saldoAtual = cb.saldoAbertura;

  //Impressão dos dados bancários
  print(
      "Banco: ${banco} \nAgência: ${cb.agencia}\nOperação: ${cb.operacao}\nConta: ${cb.numeroConta}\nNome: ${nome}\nSaldo de abertura: R\$${cb.saldoAbertura}");

  // Escolha do procedimento 
  print(
      "\nEscolha a opção desejada - [D] = Depósito | [S] = Saque | [CE] = Cheque Especial");

  op = stdin.readLineSync();
  cb.saldoAtual = cb.saldoAbertura;
  cb.limiteChequeEspecial = cb.saldoChequeEspecial;

  var valor;
  while (op != "S" &&
      op != "s" &&
      op != "D" &&
      op != "d" &&
      op != "CE" &&
      op != "ce") {
    print("Opção Inválida! Escolha novamente: ");
    op = stdin.readLineSync();
  }
  //Depósito
  if (op == "D" || op == 'd') {
    print("Informe o valor do depósito: ");
    valor = double.parse(stdin.readLineSync());
    cb.Depositar(valor);
    print("\nSaldo Atual: R\$${cb.saldoAtual}\n");
    print("\nDeseja fazer uma saque: - [S] = Sim | [N] = Não");
    op2 = stdin.readLineSync();
    // Saque após depósito
    if (op2 == "S" || op2 == "s") {
      print("\ninforme o valor do saque: ");
      valor = double.parse(stdin.readLineSync());
      valor > 9000
          ? print("Valor maior que o saldo")
          : print("\nSaldo Atual: R\$${cb.SacarAposDeposito(valor)}\n");
    } else {
      print("Operação finalizada!");
    }
    // Saque
  } else if (op == "S" || op == "s") {
      print("\ninforme o valor do saque: ");
      valor = double.parse(stdin.readLineSync());
      valor > cb.saldoAbertura
          ? print("Valor maior que o saldo")
          : print("\nSaldo Atual: R\$${cb.Sacar(valor)}\n");
  }
  
  cb.saldoChequeEspecial = cb.limiteChequeEspecial;
  cb.limiteChequeEspecial = cb.ChequeEspecial(valor);

  // Cheque Especial
  if (op == "CE" || op == "ce") {
    print("\nSaldo Cheque Especial: R\$${cb.ChequeEspecial(valor)}\n");
    print("Limite Cheque Especial: R\$${cb.limiteChequeEspecial}\n");
    print("Deseja sacar? - [S] = Sim | [N] = Não");
    op3 = stdin.readLineSync();
    if (op3 == "S" || op3 == "s") {
      print("Informe do saque: ");
      valor = double.parse(stdin.readLineSync());
      cb.SacarCheque(valor);
      print("\nSaldo Cheque Especial: R\$${cb.SacarCheque(valor)}\n");
    } else if (op3 == "N" || op3 == "n") {
      print("Operação finalizada!");
    }
  }
}
