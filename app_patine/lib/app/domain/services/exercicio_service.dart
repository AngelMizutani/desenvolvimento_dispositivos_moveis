//@dart = 2.9

import 'package:app_patine/app/domain/entities/exercicio.dart';
import 'package:app_patine/app/domain/exception/domain_layer_exception.dart';
import 'package:app_patine/app/domain/interfaces/exercicio_dao.dart';
import 'package:get_it/get_it.dart';

class ExercicioService {
  var _dao = GetIt.I.get<ExercicioDAO>();

  save(Exercicio exercicio) {
    validarNome(exercicio.nome);
    validarDescricao(exercicio.descricao);
    validarTreinador(exercicio.treinadorId);
    _dao.save(exercicio);
  }

  remove(int id) {
    _dao.remove(id);
  }

  Future<List<Exercicio>> find() {
    return _dao.find();
  }

  //o nome deve ser obrigatorio, ter no mínimo 3 e no máximo 255 caracteres
  validarNome(String nome) {
    var min = 3;
    var max = 255;

    if (nome == null) {
      throw new DomainLayerException('O nome é obrigatório');
    } else if (nome.length < min) {
      throw new DomainLayerException(
          'O nome deve ter no mínimo $min caracteres');
    } else if (nome.length > max) {
      throw new DomainLayerException(
          'O nome deve ter no máximo $max caracteres');
    }
  }

  //a descrição é obrigatório, deve ter no mínimo 10 e no máximo 1000 caracteres
  validarDescricao(String descricao) {
    var min = 10;
    var max = 1000;

    if (descricao == null) {
      throw new DomainLayerException('A descrição é obrigatória');
    } else if (descricao.length < min) {
      throw new DomainLayerException(
          'A descrição deve ter no mínimo $min caracteres');
    } else if (descricao.length > max) {
      throw new DomainLayerException(
          'A descrição deve ter no máximo $max caracteres');
    }
  }

  //o treinador é obrigatório
  validarTreinador(int idTreinador) {
    if (idTreinador == null) {
      throw new DomainLayerException('O treinador é obrigatório');
    }
  }
}
