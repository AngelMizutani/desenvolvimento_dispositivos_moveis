//@dart=2.9

import 'package:flutter/material.dart';

class ListaTreinadores extends StatelessWidget {
  final nomes = ['Asha, Luara'];

  //ListaTreinadores({Key key, this.nomes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Treinadores',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lista de Treinadores'),
        ),
        body: ListView.builder(
          itemCount: nomes.length,
          itemBuilder: (context, index) {
            return Text(nomes[index]);
          },
        ),
      ),
    );
  }
}
