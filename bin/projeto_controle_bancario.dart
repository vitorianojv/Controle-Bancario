import 'dart:developer';
import 'dart:io';
import 'lib/banco.dart';
import 'lib/login.dart';
import 'lib/conta_bancaria.dart';
import 'lib/cpf.dart';

void main() {
  ContaBancaria cb = new ContaBancaria();

  String nome;
  String dataNasc;
  String senha, repSenha;
  String op, op2, op3;

  // // Cadastro do usuário
  print("\n----- Casdastre-se -----\n");
  stdout.write("Digite seu nome completo: ");
  nome = stdin.readLineSync();

  CPF();
  
  stdout.write("Digite sua data de nascimento: ");
  dataNasc = (stdin.readLineSync());

  stdout.write("Digite sua senha: ");
  senha = stdin.readLineSync();

  stdout.write("Repita a senha: ");
  repSenha = stdin.readLineSync();

   print("\x1B[2J\x1B[0;0H");

  print("\n----- Login -----\n");
  Login();

   print("\x1B[2J\x1B[0;0H");

  stdout.write("\nInforme o saldo de abertura: ");
  cb.saldoAbertura = double.parse(stdin.readLineSync());
  print("\x1B[2J\x1B[0;0H");
  // Escolha do Banco
  Banco();
  print("Saldo Atual: R\$${cb.saldoAbertura.toStringAsFixed(2).replaceAll('.', ',')}\n");
  print("Nome do correntista: $nome\n");

  cb.saldoAtual = cb.saldoAbertura;
  // // Escolha do procedimento
  print("\nEscolha a opção desejada - [D] = Depósito | [S] = Saque | [CE] = Cheque Especial");
  op = stdin.readLineSync();
  print("\x1B[2J\x1B[0;0H");
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
    print("\nSaldo Atual: R\$${cb.saldoAtual.toStringAsFixed(2).replaceAll('.', ',')}\n");
    print("\nDeseja fazer uma saque: - [S] = Sim | [N] = Não");
    op2 = stdin.readLineSync();
    print("\x1B[2J\x1B[0;0H");
    // Saque após depósito
    if (op2 == "S" || op2 == "s") {
      print("\ninforme o valor do saque: ");
      valor = double.parse(stdin.readLineSync());
      valor > 9000
          ? print("Valor maior que o saldo")
          : print(
              "\nSaldo Atual: R\$${cb.SacarAposDeposito(valor).toStringAsFixed(2).replaceAll('.', ',')}\n");
    } else {
      print("Operação finalizada!");
    }
    // Saque
  } else if (op == "S" || op == "s") {
    print("\ninforme o valor do saque: ");
    valor = double.parse(stdin.readLineSync());
    valor > cb.saldoAbertura
        ? print("Valor maior que o saldo")
        : print(
            "\nSaldo Atual: R\$${cb.Sacar(valor).toStringAsFixed(2).replaceAll('.', ',')}\n");
  }

  cb.saldoChequeEspecial = cb.limiteChequeEspecial;
  cb.limiteChequeEspecial = cb.ChequeEspecial(valor);

// Cheque Especial
  if (op == "CE" || op == "ce") {
    print(
        "\nSaldo Cheque Especial: R\$${cb.ChequeEspecial(valor).toStringAsFixed(2).replaceAll('.', ',')}\n");
    print(
        "Limite Cheque Especial: R\$${cb.limiteChequeEspecial.toStringAsFixed(2).replaceAll('.', ',')}\n");
    print("Deseja sacar? - [S] = Sim | [N] = Não");
    op3 = stdin.readLineSync();
    print("\x1B[2J\x1B[0;0H");
    if (op3 == "S" || op3 == "s") {
      print("Informe do saque: ");
      valor = double.parse(stdin.readLineSync());
      cb.SacarCheque(valor);
      print(
          "\nSaldo Cheque Especial: R\$${cb.SacarCheque(valor).toStringAsFixed(2).replaceAll('.', ',')}\n");
    } else if (op3 == "N" || op3 == "n") {
      print("Operação finalizada!");
    }
  }
}
