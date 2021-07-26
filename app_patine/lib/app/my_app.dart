//@dart=2.9

import 'package:app_patine/app/view/exercicio_details.dart';
import 'package:app_patine/app/view/form_exercicio.dart';
import 'package:app_patine/app/view/form_usuario.dart';
import 'package:app_patine/app/view/lista_exercicios.dart';
import 'package:app_patine/app/view/user-list.dart';
import 'package:app_patine/app/view/usuario_details.dart';
import 'package:flutter/material.dart';

import 'view/ver_exercicio.dart';

class MyApp extends StatelessWidget {
  static const EXERCISE = 'view-exercise';
  static const HOME = '/';
  static const EXERCISE_LIST = 'exercise-list';
  static const USER_LIST = 'user-list';
  static const USER_FORM = 'user-form';
  static const EXERCISE_FORM = 'exercise-form';
  static const EXERCISE_DETAILS = 'exercise-details';
  static const USER_DETAILS = 'user-details';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      routes: {
        HOME: (context) => ListaUsuarios(),
        EXERCISE: (context) => VerExercicio(),
        EXERCISE_LIST: (context) => ListaExercicios(),
        USER_LIST: (context) => ListaUsuarios(),
        USER_FORM: (context) => FormUsuario(),
        EXERCISE_FORM: (context) => FormExercicio(),
        EXERCISE_DETAILS: (context) => ExercicioDetails(),
        USER_DETAILS: (context) => UsuarioDetails()
      },
    );
  }
}
