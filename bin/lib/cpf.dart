import 'dart:io';

import '../projeto_controle_bancario.dart';

void main(List<String> args) {
  var cpfList = List(11);
  int d1, d1r, d2, d2r;
  int somad1, somad2;
  String cpf;

  print("Digite seu CPF: ");
  cpf = stdin.readLineSync();

  // Atribuição dos índices do cpf para lista
  cpfList[0] = cpf[0];
  cpfList[1] = cpf[1];
  cpfList[2] = cpf[2];
  cpfList[3] = cpf[3];
  cpfList[4] = cpf[4];
  cpfList[5] = cpf[5];
  cpfList[6] = cpf[6];
  cpfList[7] = cpf[7];
  cpfList[8] = cpf[8];
  cpfList[9] = cpf[9];
  cpfList[10] = cpf[10];

  // var res = List.from(cpfList);

  var cpfListd1 = List(9);

  // Multiplicação dos índices da lista do primeiro dígito
  cpfListd1[0] = int.parse(cpfList[0]) * 10;
  cpfListd1[1] = int.parse(cpfList[1]) * 9;
  cpfListd1[2] = int.parse(cpfList[2]) * 8;
  cpfListd1[3] = int.parse(cpfList[3]) * 7;
  cpfListd1[4] = int.parse(cpfList[4]) * 6;
  cpfListd1[5] = int.parse(cpfList[5]) * 5;
  cpfListd1[6] = int.parse(cpfList[6]) * 4;
  cpfListd1[7] = int.parse(cpfList[7]) * 3;
  cpfListd1[8] = int.parse(cpfList[8]) * 2;

  // Soma do resuldado da multiplicação dos índices da lista do primeiro dígito 
  somad1 = cpfListd1[0] +
      cpfListd1[1] +
      cpfListd1[2] +
      cpfListd1[3] +
      cpfListd1[4] +
      cpfListd1[5] +
      cpfListd1[6] +
      cpfListd1[7] +
      cpfListd1[8];

  var cpfListd2 = List(10);
  
  // Multiplicação dos índices da lista do segundo dígito
  cpfListd2[0] = int.parse(cpfList[0]) * 11;
  cpfListd2[1] = int.parse(cpfList[1]) * 10;
  cpfListd2[2] = int.parse(cpfList[2]) * 9;
  cpfListd2[3] = int.parse(cpfList[3]) * 8;
  cpfListd2[4] = int.parse(cpfList[4]) * 7;
  cpfListd2[5] = int.parse(cpfList[5]) * 6;
  cpfListd2[6] = int.parse(cpfList[6]) * 5;
  cpfListd2[7] = int.parse(cpfList[7]) * 4;
  cpfListd2[8] = int.parse(cpfList[8]) * 3;
  cpfListd2[9] = int.parse(cpfList[9]) * 2;

  
  // Soma do resuldado da multiplicação dos índices da lista do segundo dígito 
  somad2 = cpfListd2[0] +
      cpfListd2[1] +
      cpfListd2[2] +
      cpfListd2[3] +
      cpfListd2[4] +
      cpfListd2[5] +
      cpfListd2[6] +
      cpfListd2[7] +
      cpfListd2[8] +
      cpfListd2[9];

  // Verificador do primeiro dígito
  d1 = somad1 % 11;
  print("\n");
  if (d1 < 2) {
    d1r = 2;
  } else if (d1 >= 2) {
    d1r = 11 - d1;
  } else {
    print('Cpf Inválido!');
  }

  // Verificador do segundo dígito
  d2 = somad2 % 11;
  print("\n");
  if (d2 < 2) {
    d2r = 0;
  } else if (d2 >= 2) {
    d2r = 11 - d2;
  } else {
    print('Cpf Inválido!');
  }

  // BlackList
  if (cpf == "00000000000" ||
      cpf == "11111111111" ||
      cpf == "22222222222" ||
      cpf == "33333333333" ||
      cpf == "44444444444" ||
      cpf == "55555555555" ||
      cpf == "66666666666" ||
      cpf == "77777777777" ||
      cpf == "88888888888" ||
      cpf == "99999999999") {
    print("Cpf Inválido!");
  } else {
    if (cpf.length == 11 &&
        d1r == int.parse(cpf[9]) &&
        d2r == int.parse(cpf[10])) {
      print("Cpf Válido!");
    } else {
      print("Cpf Inválido");
    }
  }

  return print('CPF Válido!');
}
