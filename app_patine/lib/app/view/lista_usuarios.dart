//@dart=2.9
import 'package:app_patine/app/domain/entities/usuario.dart';
import 'package:app_patine/app/view/lista_usuarios_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ListaUsuarios extends StatelessWidget {
  CircleAvatar imagemUsuario(String url) {
    return (Uri.parse(url).isAbsolute)
        ? CircleAvatar(backgroundImage: NetworkImage(url))
        : CircleAvatar(child: Image.asset('imagens/patins.png'));
  }

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

  Widget exibirContainer(
      Usuario usuario, ListaUsuariosBack back, Usuario treinador) {
    if (usuario.tipo == "A") {
      return Container(
          width: 120,
          child: Row(
            children: [
              // iconeBotaoEditar(() {
              //   _back.irParaFormulario(context, treinador);
              // }),
              // iconeBotaoExcluir(context, () {
              //   _back.excluirUsuario(treinador.id);
              //   Navigator.of(context).pop();
              // })
              Row(children: [
                IconButton(
                    onPressed: () => back.aumentarLikes(treinador),
                    icon: Icon(Icons.thumb_up)),
                Text(treinador.likes.toString()),
              ]),
              Row(
                children: [
                  IconButton(
                      onPressed: () => back.aumentarDislikes(treinador),
                      icon: Icon(Icons.thumb_down)),
                  Text(treinador.dislikes.toString())
                ],
              )
            ],
          ));
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var _back = ListaUsuariosBack(context);
    Usuario usuario = _back.usuario;

    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de Treinadores'),
          actions: [
            // IconButton(
            //     onPressed: () {
            //       _back.irParaFormulario(context);
            //     },
            //     icon: Icon(Icons.add)),
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
                      var treinador = lista[i];
                      //exibe apenas os treinadores
                      if (treinador.tipo == 'T') {
                        return ListTile(
                            leading: imagemUsuario(treinador.urlAvatar),
                            title: Text(treinador.nome),
                            onTap: () {
                              _back.goToUserDetails(context, treinador);
                            },
                            subtitle: Text(treinador.tipo == 'A'
                                ? 'Aprendiz'
                                : 'Treinador'),
                            trailing:
                                exibirContainer(usuario, _back, treinador));
                      }
                      return null;
                    },
                  );
                }
              });
        }));
  }
}
