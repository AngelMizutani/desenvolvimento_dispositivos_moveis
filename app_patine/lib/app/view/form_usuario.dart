//@dart=2.9

import 'package:app_patine/app/my_app.dart';
import 'package:app_patine/app/view/form_usuario_back.dart';
import 'package:flutter/material.dart';

/*
TO-DO:
- verificar como passar valor de idAuth da autenticação para o BD (String idAuth?) => user.uid
- nos scripts = setar likes e dislikes com valor inicial 0
- verificar no back a questão do urlAvatar
- se o usuario já estiver logado, não pode exibir os campos de email e senha (importar Firebase Auth)

*/

class FormUsuario extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  Widget campoNome(FormUsuarioBack back) {
    return TextFormField(
      validator: back.validarNomeUsuario,
      onSaved: (valor) => back.usuario.nome = valor,
      initialValue: back.usuario.nome,
      decoration: InputDecoration(labelText: 'Nome:'),
    );
  }

  Widget campoEmail(FormUsuarioBack back) {
    return TextFormField(
      validator: back.validarEmail,
      onSaved: (valor) => back.usuario.email = valor,
      initialValue: back.usuario.email,
      decoration: InputDecoration(labelText: 'Email: '),
    );
  }

  Widget campoSenha(FormUsuarioBack back) {
    return TextFormField(
      validator: back.validarSenha,
      onSaved: (valor) => back.usuario.senha = valor,
      decoration: InputDecoration(labelText: 'Senha: '),
    );
  }

  Widget campoTipo(FormUsuarioBack back) {
    return TextFormField(
      validator: back.validarTipo,
      onSaved: (valor) => back.usuario.tipo = valor,
      initialValue: back.usuario.tipo,
      decoration: InputDecoration(labelText: 'Tipo: '),
    );
  }

  Widget campoUrlAvatar(FormUsuarioBack back) {
    return TextFormField(
      onSaved: (valor) => back.usuario.urlAvatar = valor,
      decoration: InputDecoration(
          labelText: 'Endereço Avatar', hintText: 'http://www.site.com'),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _back = FormUsuarioBack(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar usuário'),
        actions: [
          IconButton(
              onPressed: () {
                _form.currentState.validate();
                _form.currentState.save();
                if (_back.isValid) {
                  _back.salvarUsuario();
                  Navigator.of(context).pop();
                }
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
            key: _form,
            child: SingleChildScrollView(
                child: Column(
              children: [
                campoNome(_back),
                campoEmail(_back),
                campoSenha(_back),
                campoTipo(_back),
                campoUrlAvatar(_back)
              ],
            ))),
      ),
    );
  }
}
