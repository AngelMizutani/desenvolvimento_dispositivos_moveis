import 'package:app_patine/app/my_app.dart';
import 'package:app_patine/app/view/tela_inicial_back.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TelaInicial extends StatelessWidget {
  Widget textoBoasVindas(String usuario) {
    return Text(
      'Olá Usuario $usuario!',
      style: TextStyle(
          color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 24),
      textAlign: TextAlign.center,
    );
  }

  Widget botaoTreinadores() {
    return ElevatedButton(
        onPressed: () {},
        child: Text(
          'Treinadores',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ));
  }

  Widget botaoExercicios() {
    return ElevatedButton(
        onPressed: () {},
        child: Text(
          'Exercícios',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ));
  }

  @override
  Widget build(BuildContext context) {
    var _back = TelaInicialBack(context);
    User user = _back.user;

    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushNamed(MyApp.LOGIN);
                },
                icon: Icon(Icons.exit_to_app))
          ],
        ),
        body: Center(
            child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textoBoasVindas(user.uid.toString()),
              botaoTreinadores(),
              botaoExercicios()
            ],
          ),
        )));
  }
}
