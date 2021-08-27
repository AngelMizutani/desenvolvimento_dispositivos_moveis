//@dart=2.9
import 'package:app_patine/app/domain/entities/usuario.dart';
import 'package:app_patine/app/my_app.dart';
import 'package:app_patine/app/view/tela_inicial_back.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TelaInicial extends StatelessWidget {
  Widget textoBoasVindas(Usuario usuario) {
    String tipo;
    usuario.tipo == 'A' ? tipo = 'Aprendiz' : tipo = 'Treinador';

    String nome = usuario.nome;

    return Text(
      'Olá $tipo $nome!',
      style: TextStyle(
          color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 24),
      textAlign: TextAlign.center,
    );
  }

  Widget botaoTreinadores(Function onPressed) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Text(
          'Treinadores',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ));
  }

  Widget botaoExercicios(Function onPressed) {
    return ElevatedButton(
        onPressed: onPressed,
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
                child: FutureBuilder(
                  future: _back.getDadosUsuario(user),
                  builder: (context, futuro) {
                    if (!futuro.hasData) {
                      return CircularProgressIndicator();
                    } else {
                      Usuario usuario = futuro.data;

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          textoBoasVindas(usuario),
                          botaoTreinadores(() {
                            Navigator.of(context).pushNamed(
                                MyApp.LISTA_USUARIOS,
                                arguments: usuario);
                          }),
                          botaoExercicios(() {
                            Navigator.of(context).pushNamed(
                                MyApp.LISTA_EXERCICIOS,
                                arguments: usuario);
                          })
                        ],
                      );
                    }
                  },
                ))));
  }
}
