//@dart=2.9

import 'package:app_patine/app/domain/entities/exercicio.dart';
import 'package:app_patine/app/view/lista_exercicios_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ListaExercicios extends StatelessWidget {
  final _back = ListaExerciciosBack();

  CircleAvatar imagemExercicio(String url) {
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
                  content: Text('Deseja realmente excluir esse exercício?'),
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
          title: Text('Lista de Exercícios'),
          actions: [
            IconButton(
                onPressed: () {
                  _back.irParaFormExercicio(context);
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
                  List<Exercicio> lista = futuro.data;
                  return ListView.builder(
                    itemCount: lista.length,
                    itemBuilder: (context, i) {
                      var exercicio = lista[i];
                      return ListTile(
                        leading: imagemExercicio(exercicio.urlImagem),
                        title: Text(exercicio.nome),
                        onTap: () {
                          _back.goToExerciseDetails(context, exercicio);
                        },
                        subtitle: Text(exercicio.descricao),
                        trailing: Container(
                          width: 100,
                          child: Row(
                            children: [
                              iconeBotaoEditar(() {
                                _back.irParaFormExercicio(context, exercicio);
                              }),
                              iconeBotaoExcluir(context, () {
                                _back.excluirExercicio(exercicio.id, context);
                              })
                              // IconButton(
                              //     onPressed: null, icon: Icon(Icons.thumb_up)),
                              // IconButton(
                              //     onPressed: null, icon: Icon(Icons.thumb_down))
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              });
        }));
  }
}
