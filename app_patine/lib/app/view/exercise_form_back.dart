//@dart=2.9

import 'package:app_patine/app/domain/entities/exercise.dart';
import 'package:app_patine/app/domain/services/exercise_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class ExerciseFormBack {
  Exercise exercise;
  var _service = GetIt.I.get<ExerciseService>();
  bool _nameIsValid;
  bool _descriptionIsValid;
  bool _instructorIsValid;

  bool get isValid => _nameIsValid && _descriptionIsValid && _instructorIsValid;

  //diferenciar entre novo exercicio e edição
  ExerciseFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context).settings.arguments;
    exercise = (parameter == null) ? Exercise() : parameter;
  }

  //salvar
  saveExercise() async {
    await _service.save(exercise);
  }

  //validações
  String validateName(String name) {
    try {
      _service.validateName(name);
      _nameIsValid = true;
      return null;
    } catch (e) {
      _nameIsValid = false;
      return e.toString();
    }
  }

  String validateDescription(String description) {
    try {
      _service.validateDescription(description);
      _descriptionIsValid = true;
      return null;
    } catch (e) {
      _descriptionIsValid = false;
      return e.toString();
    }
  }

  String validateInstructor(String idInstructor) {
    try {
      _service.validateInstructor(int.parse(idInstructor));
      _instructorIsValid = true;
      return null;
    } catch (e) {
      _instructorIsValid = false;
      return e.toString();
    }
  }
}
