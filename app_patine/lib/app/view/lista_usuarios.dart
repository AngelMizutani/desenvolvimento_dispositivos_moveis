//@dart=2.9
import 'package:app_patine/app/database/dao/usuario_dao_impl.dart';
import 'package:app_patine/app/domain/entities/usuario.dart';
import 'package:app_patine/app/my_app.dart';
import 'package:flutter/material.dart';

class ListaUsuarios extends StatelessWidget {
  Future<List<Usuario>> _listar() async {
    return UsuarioDAOImpl().find();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _listar(),
        builder: (context, futuro) {
          if (futuro.hasData) {
            List<Usuario> lista = futuro.data;
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
              body: ListView.builder(
                itemCount: lista.length,
                itemBuilder: (context, i) {
                  var usuario = lista[i];
                  return ListTile(
                    title: Text(usuario.nome),
                    subtitle:
                        Text(usuario.tipo == 'A' ? 'Aprendiz' : 'Treinador'),
                    trailing: Container(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: null, icon: Icon(Icons.thumb_up)),
                          IconButton(
                              onPressed: null, icon: Icon(Icons.thumb_down))
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return Scaffold();
          }
        });
  }
}
