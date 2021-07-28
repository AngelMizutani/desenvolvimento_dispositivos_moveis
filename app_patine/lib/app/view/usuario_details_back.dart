//@dart=2.9

import 'package:app_patine/app/domain/entities/usuario.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class UsuarioDetailsBack {
  BuildContext context;
  Usuario usuario;

  UsuarioDetailsBack(this.context) {
    usuario = ModalRoute.of(context).settings.arguments;
  }

  goBack() {
    Navigator.of(context).pop();
  }

  launchEmail(String url, Function(BuildContext context) showModalError) async {
    await canLaunch(url) ? await launch(url) : showModalError(context);
  }
}
