//@dart=2.9

import 'package:app_patine/app/domain/entities/exercicio.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'form_exercicio_back.g.dart';

class FormExercicioBack = _FormExercicioBack with _$FormExercicioBack;

abstract class _FormExercicioBack with Store {
  Exercicio exercicio;

  //diferenciar entre novo exercicio e edição
  _FormExercicioBack(BuildContext context) {
    var parametro = ModalRoute.of(context).settings.arguments;
    exercicio = (parametro == null) ? Exercicio() : parametro;

    //salvar

    //validações
  }
}
