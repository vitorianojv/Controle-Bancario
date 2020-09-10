import 'dart:io';


Banco() {
  String tipoBanco, banco;
  int agencia, numeroConta;
  
  while (tipoBanco != "104" && tipoBanco != "033" && tipoBanco != "077") {
    print("Informe o banco da sua conta: ");
    print("[104] = Caixa | [033] = Santander | [077] = Inter");
    tipoBanco = (stdin.readLineSync());
  }

  switch (tipoBanco) {
    case '104':
      banco = 'Caixa';
      break;
    case '033':
      banco = 'Santander';
      break;
    case '077':
      banco = 'Inter';
      break;
    default:
      stdout.write("Opcção Inválida! Digite novamente: ");
      tipoBanco = (stdin.readLineSync());
      break;
  }

  stdout.write("Informe o número da agência: ");
  agencia = int.parse(stdin.readLineSync());
  stdout.write("Informe o número da sua conta: ");
  numeroConta = int.parse(stdin.readLineSync());
  
  print("\nBanco: $banco");
  print("Agência: ${agencia}");
  print("Nº da Conta: ${numeroConta}");
}

