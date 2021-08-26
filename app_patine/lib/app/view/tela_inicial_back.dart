//@dart=2.9

import 'package:app_patine/app/database/firestore/usuario_dao_firestore.dart';
import 'package:app_patine/app/domain/entities/usuario.dart';
import 'package:app_patine/app/domain/services/usuario_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class TelaInicialBack {
  BuildContext context;
  User user;
  Usuario usuario;
  var _service = GetIt.I.get<UsuarioService>();

  TelaInicialBack(this.context) {
    user = ModalRoute.of(context).settings.arguments;
    getDadosUsuario(user);
  }

  void getDadosUsuario(User user) async {
    usuario = await _service.getUsuario(user);
  }

  goBack() {
    Navigator.of(context).pop();
  }
}
