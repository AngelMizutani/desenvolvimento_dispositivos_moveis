//@dart=2.9

import 'package:app_patine/app/database/dao/exercicio_dao_impl.dart';
import 'package:app_patine/app/domain/entities/exercicio.dart';
import 'package:flutter/material.dart';

class ListaExercicios extends StatelessWidget {
  Future<List<Exercicio>> _listar() async {
    return ExercicioDAOImpl().find();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _listar(),
      builder: (context, futuro) {
        if (futuro.hasData) {
          List<Exercicio> lista = futuro.data;
          return Scaffold(
            appBar: AppBar(
              title: Text('Lista de Exercícios'),
            ),
            body: ListView.builder(
              itemCount: lista.length,
              itemBuilder: (context, i) {
                var exercicio = lista[i];
                return ListTile(
                  title: Text(exercicio.nome),
                  subtitle: Text(exercicio.descricao),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(onPressed: null, icon: Icon(Icons.thumb_up)),
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
      },
    );
  }
}
