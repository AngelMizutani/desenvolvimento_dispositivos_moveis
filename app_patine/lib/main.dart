import 'package:flutter/material.dart';

import 'app/my_app.dart';

/*void main() {
  runApp(MyApp());
}
*/
void main() {
  demorar();
  esperarMensagem();
  print('Olá1');
  print('Olá2');
  print('Olá3');
}

Future imprimirMensagem() {
  return Future.delayed(Duration(seconds: 3), () => print('Cheguei!'));
}

esperarMensagem() async {
  await imprimirMensagem();
  print('Esperando...');
}

Future demorar() {
  return Future.delayed(Duration(seconds: 5), () => print('Desculpe o atraso'));
}
