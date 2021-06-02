import 'package:app_patine/app/my_app.dart';
import 'package:flutter/material.dart';

class ListaExercicios extends StatelessWidget {
  const ListaExercicios({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Exercícios para Patinação'),
      ),
      body: ListView(
        children: [
          Text(
            'Limões',
            style: TextStyle(fontSize: 30),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(MyApp.EXERCICIO);
            },
            child: Text(
              'Ver',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            style: TextButton.styleFrom(backgroundColor: Colors.purpleAccent),
          )
        ],
      ),
    );
  }
}
