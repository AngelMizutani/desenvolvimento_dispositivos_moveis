//@dart=2.9

import 'package:app_patine/app/domain/entities/exercise.dart';
import 'package:app_patine/app/domain/services/exercise_service.dart';
import 'package:app_patine/app/my_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'exercise_list_back.g.dart';

class ExerciseListBack = _ExerciseListBack with _$ExerciseListBack;

abstract class _ExerciseListBack with Store {
  var _service = GetIt.I.get<ExerciseService>();

  //exibir lista de exercicios
  @observable
  Future<List<Exercise>> list;

  //atualizar lista de exercicios
  @action
  updateExerciseList([dynamic value]) {
    list = _service.find();
  }

  _ExerciseListBack() {
    updateExerciseList()();
  }

  //navegar até o formulário para salvar ou alterar exercício
  goToExerciseForm(BuildContext context, [Exercise exercise]) {
    Navigator.of(context)
        .pushNamed(MyApp.EXERCISE_FORM, arguments: exercise)
        .then(updateExerciseList);
  }

  goToExerciseDetails(BuildContext context, Exercise exercise) {
    Navigator.of(context)
        .pushNamed(MyApp.EXERCISE_DETAILS, arguments: exercise);
  }

  //excluir exercício
  removeExercise(int id) {
    _service.remove(id);
    updateExerciseList();
  }
}
