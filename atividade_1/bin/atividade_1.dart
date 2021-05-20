import 'package:atividade_1/atividade_1.dart' as atividade_1;
import 'dart:io';

void main(List<String> arguments) {
  print('Digite seu nome: ');
  var nome = stdin.readLineSync();

  print('Digite sua idade: ');
  var idade = int.parse(stdin.readLineSync()!);

  print('Digite o nome do seu melhor amigo: ');
  var nomeAmigo = stdin.readLineSync();

  print('Digite a idade do seu amigo: ');
  var idadeAmigo = int.parse(stdin.readLineSync()!);

  if (idade > idadeAmigo) {
    print('Olá, ${nome}, você é mais velho que seu amigo ${nomeAmigo}.');
  } else if (idade == idadeAmigo) {
    print('Olá, ${nome}, você e seu amigo ${nomeAmigo} possuem a mesma idade.');
  } else {
    print('Olá, ${nome}, você é mais jovem que seu amigo ${nomeAmigo}.');
  }
}
