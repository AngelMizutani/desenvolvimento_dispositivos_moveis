//@dart=2.9

import 'package:app_patine/app/domain/entities/exercicio.dart';
import 'package:flutter/cupertino.dart';

class ExercicioDetailsBack {
  BuildContext context;
  Exercicio exercicio;

  ExercicioDetailsBack(this.context) {
    exercicio = ModalRoute.of(context).settings.arguments;
  }

  goBack() {
    Navigator.of(context).pop();
  }
}
