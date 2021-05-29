import 'package:atividade_3/atividade_3.dart' as atividade_3;

void main(List<String> arguments) {
  //darBomDia('Maria');

  /*
  var idade = calcularIdade(1982);
  print('Você tem $idade anos');
  */

  //imprimirAlerta();

  //print(imprimirBoasVindas());

  //imprimirNomeIdade(idade: 38, nome: 'Angélica');

  //imprimirPrevisaoTempo(tempo: 'sol', hora: 10);

  //imprimirCompromissosSemana(diaSemana: 'terça', compromisso: 'dentista');

  // 6 - exemplos de funções anonimas

  calcularSoma(() {
    print(2 + 3);
  });

  exibirMensagem(() => print('Feliz aniversário!!'));

  enviarLembrete(() => print('Ir ao mercado urgente!'));
}

//1 - Função com parametro e sem retorno
void darBomDia(String nome) {
  //essa função tem o objetivo de dar bom dia ao usuário
  print('Bom dia, $nome! Tenha um ótimo dia!');
}

// 2 - Função com parametro e com retorno
int calcularIdade(int anoNascimento) {
  //essa função calcula a idade de acordo com o ano informado
  return (2021 - anoNascimento);
}

//3 - Função sem parametro e sem retorno
void imprimirAlerta() {
  //essa função imprime um aviso de alerta na tela
  print('ALERTA! ALERTA! ALERTA!');
}

//4 - Função sem parametro e com retorno
String imprimirBoasVindas() {
  //essa função imprime uma mensagem de boas vindas
  return 'Bem-Vindo!';
}

//5 - Três funçoes com parametros nomeados
void imprimirNomeIdade({required String nome, required int idade}) {
  //essa função imprime o nome e a idade
  print('Olá $nome! Você tem $idade anos');
}

void imprimirPrevisaoTempo({required String tempo, required int hora}) {
  // essa função imprime mensagens sobre o tempo
  if (hora >= 6 && hora < 12) {
    print('Bom dia!');
  } else if (hora >= 12 && hora < 18) {
    print('Boa tarde!');
  } else {
    print('Boa noite!');
  }

  print('Hoje vai ter $tempo.');
}

void imprimirCompromissosSemana(
    {required String diaSemana, required String compromisso}) {
  //essa função exibe o compromisso no dia da semana
  print('Você tem $compromisso agendado para $diaSemana.');
}

// 6 - tres exemplos de funções anonimas
void calcularSoma(Function function) {
  //essa funçao calcula a soma
  function();
  print('Soma realizada');
}

void exibirMensagem(Function function) {
  // essa função exibe uma mensagem
  function();
  print('Mensagem enviada!');
}

void enviarLembrete(Function function) {
  //essa função exibe um lembrete
  function();
  print('Lembrete enviado');
}
