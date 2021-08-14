//@dart=2.9

import 'package:app_patine/app/view/exercicio_details.dart';
import 'package:app_patine/app/view/form_exercicio.dart';
import 'package:app_patine/app/view/form_usuario.dart';
import 'package:app_patine/app/view/lista_exercicios.dart';
import 'package:app_patine/app/view/lista_usuarios.dart';
import 'package:app_patine/app/view/usuario_details.dart';
import 'package:flutter/material.dart';

import 'view/ver_exercicio.dart';

class MyApp extends StatelessWidget {
  static const EXERCICIO = 'ver-exercicio';
  static const HOME = '/';
  static const LISTA_EXERCICIOS = 'lista-exercicios';
  static const LISTA_USUARIOS = 'lista-usuarios';
  static const FORM_USUARIO = 'form-usuario';
  static const FORM_EXERCICIO = 'form-exercicio';
  static const EXERCISE_DETAILS = 'exercicio-details';
  static const USER_DETAILS = 'usuario-details';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      routes: {
        HOME: (context) => ListaExercicios(),
        EXERCICIO: (context) => VerExercicio(),
        LISTA_EXERCICIOS: (context) => ListaExercicios(),
        LISTA_USUARIOS: (context) => ListaUsuarios(),
        FORM_USUARIO: (context) => FormUsuario(),
        FORM_EXERCICIO: (context) => FormExercicio(),
        EXERCISE_DETAILS: (context) => ExercicioDetails(),
        USER_DETAILS: (context) => UsuarioDetails()
      },
    );
  }
}
