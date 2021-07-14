//@dart=2.9

import 'package:app_patine/app/domain/entities/usuario.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'form_usuario_back.g.dart';

class FormUsuarioBack = _FormUsuarioBack with _$FormUsuarioBack;

abstract class _FormUsuarioBack with Store {
  Usuario usuario;

  //diferenciar entre novo usuario ou edição de usuario
  _FormUsuarioBack(BuildContext context) {
    var parametro = ModalRoute.of(context).settings.arguments;
    usuario = (parametro == null) ? Usuario() : parametro;

    //salvar

    //validações
  }
}
