//@dart=2.9

import 'package:app_patine/app/domain/entities/exercise.dart';
import 'package:flutter/cupertino.dart';

class ExerciseDetailsBack {
  BuildContext context;
  Exercise exercise;

  ExerciseDetailsBack(this.context) {
    exercise = ModalRoute.of(context).settings.arguments;
  }

  goBack() {
    Navigator.of(context).pop();
  }
}
