//@dart=2.9
import 'package:app_patine/app/domain/entities/usuario.dart';
import 'package:app_patine/app/view/lista_usuarios_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ListaUsuarios extends StatelessWidget {
  final _back = ListaUsuariosBack();

  Widget iconeBotaoEditar(Function onPressed) {
    return IconButton(
        onPressed: onPressed, icon: Icon(Icons.edit), color: Colors.yellow);
  }

  Widget iconeBotaoExcluir(BuildContext context, Function excluir) {
    return IconButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text('Confirmar exclusão'),
                  content: Text('Deseja realmente excluir esse usuário?'),
                  actions: [
                    TextButton(
                        onPressed: Navigator.of(context).pop,
                        child: Text('Não')),
                    TextButton(onPressed: excluir, child: Text('Sim'))
                  ],
                ));
      },
      icon: Icon(Icons.delete),
      color: Colors.red,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de Usuários'),
          actions: [
            IconButton(
                onPressed: () {
                  _back.irParaFormulario(context);
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
                        onTap: () {
                          _back.goToUserDetails(context, usuario);
                        },
                        subtitle: Text(
                            usuario.tipo == 'A' ? 'Aprendiz' : 'Treinador'),
                        trailing: Container(
                            width: 100,
                            child: Row(
                              children: [
                                iconeBotaoEditar(() {
                                  _back.irParaFormulario(context, usuario);
                                }),
                                iconeBotaoExcluir(context, () {
                                  _back.excluirUsuario(usuario.id);
                                  Navigator.of(context).pop();
                                })
                                /*
                                IconButton(
                                    onPressed: null,
                                    icon: Icon(Icons.thumb_up)),
                                IconButton(
                                    onPressed: null,
                                    icon: Icon(Icons.thumb_down))
                                    */
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
