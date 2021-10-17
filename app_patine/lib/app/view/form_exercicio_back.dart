//@dart=2.9

import 'package:app_patine/app/domain/entities/exercicio.dart';
import 'package:app_patine/app/domain/services/exercicio_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class FormExercicioBack {
  Exercicio exercicio;
  var _service = GetIt.I.get<ExercicioService>();
  bool _nomeIsValid;
  bool _descricaoIsValid;
  //bool _treinadorIsValid;

  // bool get isValid => _nomeIsValid && _descricaoIsValid && _treinadorIsValid;
  bool get isValid => _nomeIsValid && _descricaoIsValid;

  //diferenciar entre novo exercicio e edição
  FormExercicioBack(BuildContext context) {
    var parametro = ModalRoute.of(context).settings.arguments;
    exercicio = (parametro == null) ? Exercicio() : parametro;
  }

  //salvar
  salvarExercicio(BuildContext context) async {
    await _service.save(exercicio);
    Navigator.of(context).pop();
  }

  //validações
  String validarNome(String nome) {
    try {
      _service.validarNome(nome);
      _nomeIsValid = true;
      return null;
    } catch (e) {
      _nomeIsValid = false;
      return e.toString();
    }
  }

  String validarDescricao(String descricao) {
    try {
      _service.validarDescricao(descricao);
      _descricaoIsValid = true;
      return null;
    } catch (e) {
      _descricaoIsValid = false;
      return e.toString();
    }
  }

  // String validarTreinador(String idTreinador) {
  //   try {
  //     _service.validarTreinador(int.parse(idTreinador));
  //     _treinadorIsValid = true;
  //     return null;
  //   } catch (e) {
  //     _treinadorIsValid = false;
  //     return e.toString();
  //   }
  // }
}
