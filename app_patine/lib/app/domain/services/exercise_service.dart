//@dart = 2.9

import 'package:app_patine/app/domain/entities/exercise.dart';
import 'package:app_patine/app/domain/exception/domain_layer_exception.dart';
import 'package:app_patine/app/domain/interfaces/exercise_dao.dart';
import 'package:get_it/get_it.dart';

class ExerciseService {
  var _dao = GetIt.I.get<ExerciseDAO>();

  save(Exercise exercise) {
    validateName(exercise.name);
    validateDescription(exercise.description);
    validateInstructor(exercise.instructorId);
    _dao.save(exercise);
  }

  remove(int id) {
    _dao.remove(id);
  }

  Future<List<Exercise>> find() {
    return _dao.find();
  }

  //o nome deve ser obrigatorio, ter no mínimo 3 e no máximo 255 caracteres
  validateName(String name) {
    var min = 3;
    var max = 255;

    if (name == null) {
      throw new DomainLayerException('O nome é obrigatório');
    } else if (name.length < min) {
      throw new DomainLayerException(
          'O nome deve ter no mínimo $min caracteres');
    } else if (name.length > max) {
      throw new DomainLayerException(
          'O nome deve ter no máximo $max caracteres');
    }
  }

  //a descrição é obrigatório, deve ter no mínimo 10 e no máximo 1000 caracteres
  validateDescription(String description) {
    var min = 10;
    var max = 1000;

    if (description == null) {
      throw new DomainLayerException('A descrição é obrigatória');
    } else if (description.length < min) {
      throw new DomainLayerException(
          'A descrição deve ter no mínimo $min caracteres');
    } else if (description.length > max) {
      throw new DomainLayerException(
          'A descrição deve ter no máximo $max caracteres');
    }
  }

  //o treinador é obrigatório
  validateInstructor(int idInstructor) {
    if (idInstructor == null) {
      throw new DomainLayerException('O treinador é obrigatório');
    }
  }
}
