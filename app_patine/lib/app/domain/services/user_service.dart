//@dart = 2.9

import 'package:app_patine/app/domain/entities/user.dart';
import 'package:app_patine/app/domain/exception/domain_layer_exception.dart';
import 'package:app_patine/app/domain/interfaces/user_dao.dart';
import 'package:get_it/get_it.dart';

class UserService {
  var _dao = GetIt.I.get<UserDAO>();

  save(User user) {
    validateName(user.name);
    validateCpf(user.cpf);
    validateEmail(user.email);
    validateLogin(user.login);
    validatePassword(user.password);
    validateCategory(user.category);
    _dao.save(user);
  }

  remove(int id) {
    _dao.remove(id);
  }

  Future<List<User>> find() {
    return _dao.find();
  }

  // o nome deve obrigatório e ter no mínimo 3 e no máximo 255 caracteres
  validateName(String name) {
    var min = 3;
    var max = 255;

    if (name == null) {
      throw new DomainLayerException('O nome é obrigatório');
    } else if (name.length < min) {
      throw new DomainLayerException(
          'O nome deve ter pelo menos $min caracteres');
    } else if (name.length > max) {
      throw new DomainLayerException(
          'O nome deve ter no máximo $max caracteres');
    }
  }

  //cpf deve ser obrigatorio e ter 14 caracteres no máximo
  validateCpf(String cpf) {
    if (cpf == null) {
      throw new DomainLayerException('CPF é obrigatório');
    }
    if (cpf.length > 14) {
      throw new DomainLayerException('CPF deve ter no máximo 14 caracteres');
    }
  }

  //email é obrigatorio e deve conter @
  validateEmail(String email) {
    if (email == null) {
      throw new DomainLayerException('O email é obrigatório');
    } else if (!email.contains('@')) {
      throw new DomainLayerException('Email deve conter @');
    }
  }

  // o login deve obrigatório e ter no mínimo 3 e no máximo 255 caracteres
  validateLogin(String login) {
    var min = 3;
    var max = 255;

    if (login == null) {
      throw new DomainLayerException('O login é obrigatório');
    } else if (login.length < min) {
      throw new DomainLayerException(
          'O login deve ter pelo menos $min caracteres');
    } else if (login.length > max) {
      throw new DomainLayerException(
          'O login deve ter no máximo $max caracteres');
    }
  }

  //a senha é obrigatória e deve conter no minimo 6 e no máximo 255 caracteres
  validatePassword(String password) {
    var min = 6;
    var max = 255;

    if (password == null) {
      throw new DomainLayerException('A senha é obrigatória');
    } else if (password.length < min) {
      throw new DomainLayerException(
          'A senha deve ter pelo menos $min caracteres');
    } else if (password.length > max) {
      throw new DomainLayerException(
          'A senha deve ter no máximo $max caracteres');
    }
  }

  //o tipo só pode ser T ou A
  validateCategory(String category) {
    if (category != 'T' && category != 'A') {
      throw new DomainLayerException('A categoria só pode ser T ou A');
    }
  }
}
