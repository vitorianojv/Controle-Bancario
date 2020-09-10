import 'dart:io';

Login() {
  String cpf;
  String senha;

  stdout.write("Digite seu CPF: ");
  cpf = stdin.readLineSync();

  stdout.write("Digite sua senha: ");
  senha = stdin.readLineSync();
  print('');
}
