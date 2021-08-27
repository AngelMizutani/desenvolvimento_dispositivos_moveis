//@dart=2.9
import 'package:app_patine/app/domain/entities/usuario.dart';
import 'package:app_patine/app/view/usuario_details_back.dart';
import 'package:flutter/material.dart';

class UsuarioDetails extends StatelessWidget {
  showModalError(BuildContext context) {
    var alert = AlertDialog(
      title: Text('Alerta!'),
      content: Text('Não foi possível encontrar um APP compatível!'),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  @override
  Widget build(BuildContext context) {
    var _back = UsuarioDetailsBack(context);
    Usuario usuario = _back.usuario;

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      var width = constraints.biggest.width;
      var radius = width / 3;
      return Scaffold(
        body: ListView(
          padding: EdgeInsets.all(50),
          children: [
            (Uri.parse(usuario.urlAvatar).isAbsolute)
                ? CircleAvatar(
                    backgroundImage: NetworkImage(usuario.urlAvatar),
                    radius: radius,
                  )
                : CircleAvatar(
                    child: Image.asset('imagens/patins.png'),
                    radius: radius,
                  ),
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
                trailing: Container(
                  width: width / 4,
                  child: IconButton(
                    color: Colors.purple,
                    icon: Icon(Icons.email),
                    onPressed: () {
                      _back.launchEmail(
                          'mailto:${usuario.email}', showModalError);
                    },
                  ),
                ),
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
