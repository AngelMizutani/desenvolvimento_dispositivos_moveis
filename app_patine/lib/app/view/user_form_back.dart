//@dart=2.9

import 'package:app_patine/app/domain/entities/user.dart';
import 'package:app_patine/app/domain/services/user_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class UserFormBack {
  User user;
  var _service = GetIt.I.get<UserService>();
  bool _nameIsValid;
  bool _cpfIsValid;
  bool _emailIsValid;
  bool _loginIsValid;
  bool _passwordIsValid;
  bool _categoryIsValid;

  bool get isValid =>
      _nameIsValid &&
      _cpfIsValid &&
      _emailIsValid &&
      _loginIsValid &&
      _passwordIsValid &&
      _categoryIsValid;

  //diferenciar entre novo usuario ou edição de usuario
  UserFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context).settings.arguments;
    user = (parameter == null) ? User() : parameter;
  }

  //salvar
  saveUser() async {
    await _service.save(user);
  }

  //validações
  String validateUserName(String name) {
    try {
      _service.validateName(name);
      _nameIsValid = true;
      return null;
    } catch (e) {
      _nameIsValid = false;
      return e.toString();
    }
  }

  String validateCpf(String cpf) {
    try {
      _service.validateCpf(cpf);
      _cpfIsValid = true;
      return null;
    } catch (e) {
      _cpfIsValid = false;
      return e.toString();
    }
  }

  String validateEmail(String email) {
    try {
      _service.validateEmail(email);
      _emailIsValid = true;
      return null;
    } catch (e) {
      _emailIsValid = false;
      return e.toString();
    }
  }

  String validateLogin(String login) {
    try {
      _service.validateLogin(login);
      _loginIsValid = true;
      return null;
    } catch (e) {
      _loginIsValid = false;
      return e.toString();
    }
  }

  String validatePassword(String password) {
    try {
      _service.validatePassword(password);
      _passwordIsValid = true;
      return null;
    } catch (e) {
      _passwordIsValid = false;
      return e.toString();
    }
  }

  String validateCategory(String category) {
    try {
      _service.validateCategory(category);
      _categoryIsValid = true;
      return null;
    } catch (e) {
      _categoryIsValid = false;
      return e.toString();
    }
  }
}
