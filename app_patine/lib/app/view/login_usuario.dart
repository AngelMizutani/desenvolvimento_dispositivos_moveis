//@dart=2.9

import 'package:app_patine/app/authentication/firebase_authentication.dart';
import 'package:app_patine/app/domain/services/auth_usuario_service.dart';
import 'package:app_patine/app/my_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoginUsuario extends StatefulWidget {
  @override
  _LoginUsuarioState createState() => _LoginUsuarioState();
}

class _LoginUsuarioState extends State<LoginUsuario> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  final FocusNode _focusEmail = FocusNode();
  final FocusNode _focusSenha = FocusNode();

  Future _iniciarFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    User user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.of(context).pushNamed(MyApp.INICIO, arguments: user);
    }

    return firebaseApp;
  }

  Widget campoEmail() {
    return TextFormField(
      controller: _emailController,
      focusNode: _focusEmail,
      validator: (valor) => AuthUsuarioService.validarEmail(email: valor),
      decoration: InputDecoration(labelText: 'Email'),
    );
  }

  Widget campoSenha() {
    return TextFormField(
      obscureText: true,
      controller: _senhaController,
      focusNode: _focusSenha,
      validator: (valor) => AuthUsuarioService.validarSenha(senha: valor),
      decoration: InputDecoration(labelText: 'Senha'),
    );
  }

  Widget botaoEntrar() {
    return ElevatedButton(
      onPressed: () async {
        if (_formKey.currentState.validate()) {
          User user = await FirebaseAuthentication.signInUsingEmailPassword(
              email: _emailController.text, password: _senhaController.text);

          if (user != null) {
            Navigator.of(context).pushNamed(MyApp.INICIO, arguments: user);
          }
        }
      },
      child: Text(
        'Entrar',
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }

  Widget botaoRegistrar() {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushNamed(MyApp.FORM_USUARIO);
      },
      child: Text(
        'Registrar',
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bem-vindo ao Patine!'),
      ),
      body: FutureBuilder(
        future: _iniciarFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          campoEmail(),
                          campoSenha(),
                          botaoEntrar(),
                          botaoRegistrar()
                        ],
                      ),
                    ),
                  ],
                ));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
