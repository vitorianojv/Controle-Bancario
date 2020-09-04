import 'dart:io';
import 'lib/conta_bancaria.dart';

void main(List<String> args) {
  ContaBancaria cb = new ContaBancaria();

  String op, op2, op3;
  String tipoBanco;

  print("Informe o número da sua conta: ");
  cb.numeroConta = int.parse(stdin.readLineSync());

  print("Informe o nome do correntista: ");
  cb.nomeCorrentista = (stdin.readLineSync());

  while (tipoBanco != "001" && tipoBanco != "232" && tipoBanco != "013") {
    print(
        "Informe o banco da sua conta: - [001] = Caixa | [232] = Santander | [013] = Inter ");
    tipoBanco = (stdin.readLineSync());

    if (tipoBanco == "001") {
      print("\nCAIXA ");
    } else if (tipoBanco == "232") {
      print("\nSANTANDER ");
    } else if (tipoBanco == "013") {
      print("\nInter ");
    } else {
      print("Opcção Inválida! Digite novamente: ");
      tipoBanco = (stdin.readLineSync());
    }
  }

  cb.saldoAbertura = 9000.00;
  cb.saldoChequeEspecial = 2250.00;

  print(
      "Conta: ${cb.numeroConta} \nCorrentista: ${cb.nomeCorrentista} \nSaldo: ${cb.saldoAbertura}");

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
  if (op == "D" || op == 'd') {
    print("Informe o valor do depósito: ");
    valor = double.parse(stdin.readLineSync());
    cb.Depositar(valor);
    print("\nSaldo Atual: ${cb.saldoAtual}\n");
    print("\nDeseja fazer uma saque: - [S] = Sim | [N] = Não");
    op2 = stdin.readLineSync();

    if (op2 == "S" || op2 == "s") {
      print("\ninforme o valor do saque: ");
      valor = double.parse(stdin.readLineSync());
      print("\nSaldo Atual: ${cb.Sacar(valor)}\n");
    } else {
      print("Operação finalizada!");
    }
  } else if (op == "S" || op == "s") {
    print("\ninforme o valor do saque: ");
    valor = double.parse(stdin.readLineSync());
    print("\nSaldo Atual: ${cb.Sacar(valor)}\n");
  }

  if (op == "CE" || op == "ce") {
    print("\nSaldo Cheque Especial: ${cb.saldoChequeEspecial}\n");
    print("Limite Cheque Especial: ${cb.limiteChequeEspecial}\n");
    print("Deseja sacar? - [S] = Sim | [N] = Não");
    op3 = stdin.readLineSync();
    if (op3 == "S" || op3 == "s") {
      print("Informe do saque: ");
      valor = double.parse(stdin.readLineSync());
      cb.SacarCheque(valor);
      print("\nSaldo Cheque Especial: ${cb.SacarCheque(valor)}\n");
    } else if (op3 == "N" || op3 == "n") {
      print("Operação finalizada!");
    }
  }
}
