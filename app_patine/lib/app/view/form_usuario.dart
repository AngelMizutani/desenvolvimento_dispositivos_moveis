//@dart=2.9

import 'package:app_patine/app/view/form_usuario_back.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

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

  Widget campoCpf(FormUsuarioBack back) {
    var mascara = MaskTextInputFormatter(mask: '###.###.###-##');
    return TextFormField(
      inputFormatters: [mascara],
      keyboardType: TextInputType.number,
      validator: back.validarCpf,
      onSaved: (valor) => back.usuario.cpf = valor,
      initialValue: back.usuario.cpf,
      decoration:
          InputDecoration(labelText: 'CPF: ', hintText: '000.000.000-00'),
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

  Widget campoLogin(FormUsuarioBack back) {
    return TextFormField(
      validator: back.validarLogin,
      onSaved: (valor) => back.usuario.login = valor,
      initialValue: back.usuario.login,
      decoration: InputDecoration(labelText: 'Login: '),
    );
  }

  Widget campoSenha(FormUsuarioBack back) {
    return TextFormField(
      validator: back.validarSenha,
      onSaved: (valor) => back.usuario.senha = valor,
      initialValue: back.usuario.senha,
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
            child: Column(
              children: [
                campoNome(_back),
                campoCpf(_back),
                campoEmail(_back),
                campoLogin(_back),
                campoSenha(_back),
                campoTipo(_back)
              ],
            )),
      ),
    );
  }
}
