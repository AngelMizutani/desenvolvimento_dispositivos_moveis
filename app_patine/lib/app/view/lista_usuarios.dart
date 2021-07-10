//@dart=2.9
import 'package:app_patine/app/domain/entities/usuario.dart';
import 'package:app_patine/app/my_app.dart';
import 'package:app_patine/app/view/lista_usuarios_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ListaUsuarios extends StatelessWidget {
  final _back = ListaUsuariosBack();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de Usuários'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(MyApp.LISTA_EXERCICIOS);
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: Observer(builder: (context) {
          return FutureBuilder(
              future: _back.lista,
              builder: (context, futuro) {
                if (!futuro.hasData) {
                  return CircularProgressIndicator();
                } else {
                  List<Usuario> lista = futuro.data;
                  return ListView.builder(
                    itemCount: lista.length,
                    itemBuilder: (context, i) {
                      var usuario = lista[i];
                      return ListTile(
                        title: Text(usuario.nome),
                        subtitle: Text(
                            usuario.tipo == 'A' ? 'Aprendiz' : 'Treinador'),
                        trailing: Container(
                            width: 100,
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: null,
                                    icon: Icon(Icons.thumb_up)),
                                IconButton(
                                    onPressed: null,
                                    icon: Icon(Icons.thumb_down))
                              ],
                            )),
                      );
                    },
                  );
                }
              });
        }));
  }
}
