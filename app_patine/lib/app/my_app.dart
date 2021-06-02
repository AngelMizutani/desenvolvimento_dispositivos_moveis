import 'package:app_patine/app/view/lista_exercicios.dart';
import 'package:flutter/material.dart';

import 'view/ver_exercicio.dart';

class MyApp extends StatelessWidget {
  static const EXERCICIO = 'ver-exercicio';
  static const HOME = '/';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      routes: {
        HOME: (context) => ListaExercicios(),
        EXERCICIO: (context) => VerExercicio(),
      },
    );
  }
}
