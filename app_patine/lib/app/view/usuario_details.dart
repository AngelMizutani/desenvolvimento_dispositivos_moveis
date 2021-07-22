//@dart=2.9
import 'package:app_patine/app/domain/entities/usuario.dart';
import 'package:app_patine/app/view/usuario_details_back.dart';
import 'package:flutter/material.dart';

class UsuarioDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _back = UsuarioDetailsBack(context);
    Usuario usuario = _back.usuario;

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Scaffold(
        body: ListView(
          children: [
            Center(
              child: Text(
                '${usuario.nome}',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('E-mail'),
                subtitle: Text('${usuario.email}'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Categoria'),
                subtitle: Text(usuario.tipo == 'T' ? 'Treinador' : 'Aprendiz'),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back),
          onPressed: () {
            _back.goBack();
          },
        ),
      );
    });
  }
}
