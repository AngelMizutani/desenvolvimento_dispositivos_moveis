//@dart=2.9

import 'package:app_patine/app/domain/entities/exercicio.dart';
import 'package:app_patine/app/domain/entities/usuario.dart';
import 'package:app_patine/app/domain/services/exercicio_service.dart';
import 'package:app_patine/app/my_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'lista_exercicios_back.g.dart';

class ListaExerciciosBack = _ListaExerciciosBack with _$ListaExerciciosBack;

abstract class _ListaExerciciosBack with Store {
  BuildContext context;
  Usuario usuario;
  var _service = GetIt.I.get<ExercicioService>();

  //exibir lista de exercicios
  @observable
  Future<List<Exercicio>> lista;

  //atualizar lista de exercicios
  @action
  atualizarListaExercicios([dynamic value]) {
    lista = _service.find();
  }

  _ListaExerciciosBack(this.context) {
    usuario = ModalRoute.of(context).settings.arguments;
    atualizarListaExercicios();
  }

  //navegar até o formulário para salvar ou alterar exercício
  irParaFormExercicio(BuildContext context, [Exercicio exercicio]) {
    Navigator.of(context)
        .pushNamed(MyApp.FORM_EXERCICIO, arguments: exercicio)
        .then(atualizarListaExercicios);
  }

  goToExerciseDetails(BuildContext context, Exercicio exercicio) {
    Navigator.of(context)
        .pushNamed(MyApp.EXERCISE_DETAILS, arguments: exercicio);
  }

  //excluir exercício
  excluirExercicio(dynamic id) {
    _service.remove(id);
    atualizarListaExercicios();
  }

  aumentarLikes(Exercicio exercicio) {
    _service.aumentarLikes(exercicio);
    atualizarListaExercicios();
  }

  aumentarDislikes(Exercicio exercicio) {
    _service.aumentarDislikes(exercicio);
    atualizarListaExercicios();
  }
}
