//@dart=2.9

import 'package:app_patine/app/domain/entities/usuario.dart';
import 'package:app_patine/app/domain/services/auth_usuario_service.dart';
import 'package:app_patine/app/domain/services/usuario_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class FormUsuarioBack {
  Usuario usuario;
  var _service = GetIt.I.get<UsuarioService>();
  bool _nomeIsValid;
  bool _emailIsValid;
  bool _senhaIsValid;
  bool _tipoIsValid;

  bool get isValid =>
      _nomeIsValid && _emailIsValid && _senhaIsValid && _tipoIsValid;

  //diferenciar entre novo usuario ou edição de usuario
  FormUsuarioBack(BuildContext context) {
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

  String validarEmail(String email) {
    try {
      _service.validarEmail(email);
      AuthUsuarioService.validarEmail(email: email);
      _emailIsValid = true;
      return null;
    } catch (e) {
      _emailIsValid = false;
      return e.toString();
    }
  }

  String validarSenha(String senha) {
    try {
      AuthUsuarioService.validarSenha(senha: senha);
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
