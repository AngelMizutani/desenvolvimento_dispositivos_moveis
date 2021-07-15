//@dart=2.9

import 'package:app_patine/app/domain/entities/usuario.dart';
import 'package:app_patine/app/domain/services/usuario_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'form_usuario_back.g.dart';

class FormUsuarioBack = _FormUsuarioBack with _$FormUsuarioBack;

abstract class _FormUsuarioBack with Store {
  Usuario usuario;
  var _service = GetIt.I.get<UsuarioService>();
  bool _nomeIsValid;
  bool _cpfIsValid;
  bool _emailIsValid;
  bool _loginIsValid;
  bool _senhaIsValid;
  bool _tipoIsValid;

  @action
  bool get isValid =>
      _nomeIsValid &&
      _cpfIsValid &&
      _emailIsValid &&
      _loginIsValid &&
      _senhaIsValid &&
      _tipoIsValid;

  //diferenciar entre novo usuario ou edição de usuario
  _FormUsuarioBack(BuildContext context) {
    var parametro = ModalRoute.of(context).settings.arguments;
    usuario = (parametro == null) ? Usuario() : parametro;
  }

  //salvar
  salvarUsuario() async {
    await _service.save(usuario);
  }

  //validações
  String validarNomeUsuario(String nome) {
    try {
      _service.validarNome(nome);
      _nomeIsValid = true;
      return null;
    } catch (e) {
      _nomeIsValid = false;
      return e.toString();
    }
  }

  String validarCpf(String cpf) {
    try {
      _service.validarCpf(cpf);
      _cpfIsValid = true;
      return null;
    } catch (e) {
      _cpfIsValid = false;
      return e.toString();
    }
  }

  String validarEmail(String email) {
    try {
      _service.validarEmail(email);
      _emailIsValid = true;
      return null;
    } catch (e) {
      _emailIsValid = false;
      return e.toString();
    }
  }

  String validarLogin(String login) {
    try {
      _service.validarLogin(login);
      _loginIsValid = true;
      return null;
    } catch (e) {
      _loginIsValid = false;
      return e.toString();
    }
  }

  String validarSenha(String senha) {
    try {
      _service.validarSenha(senha);
      _senhaIsValid = true;
      return null;
    } catch (e) {
      _senhaIsValid = false;
      return e.toString();
    }
  }

  String validarTipo(String tipo) {
    try {
      _service.validarTipo(tipo);
      _tipoIsValid = true;
      return null;
    } catch (e) {
      _tipoIsValid = false;
      return e.toString();
    }
  }
}
