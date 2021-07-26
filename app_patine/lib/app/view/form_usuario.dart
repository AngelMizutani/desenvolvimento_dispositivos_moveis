//@dart=2.9

import 'package:app_patine/app/view/user_form_back.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FormUsuario extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  Widget fieldName(UserFormBack back) {
    return TextFormField(
      validator: back.validateUserName,
      onSaved: (value) => back.user.name = value,
      initialValue: back.user.name,
      decoration: InputDecoration(labelText: 'Nome:'),
    );
  }

  Widget fieldCpf(UserFormBack back) {
    var mask = MaskTextInputFormatter(mask: '###.###.###-##');
    return TextFormField(
      inputFormatters: [mask],
      keyboardType: TextInputType.number,
      validator: back.validateCpf,
      onSaved: (value) => back.user.cpf = value,
      initialValue: back.user.cpf,
      decoration:
          InputDecoration(labelText: 'CPF: ', hintText: '000.000.000-00'),
    );
  }

  Widget fieldEmail(UserFormBack back) {
    return TextFormField(
      validator: back.validateEmail,
      onSaved: (value) => back.user.email = value,
      initialValue: back.user.email,
      decoration: InputDecoration(labelText: 'Email: '),
    );
  }

  Widget fieldLogin(UserFormBack back) {
    return TextFormField(
      validator: back.validateLogin,
      onSaved: (value) => back.user.login = value,
      initialValue: back.user.login,
      decoration: InputDecoration(labelText: 'Login: '),
    );
  }

  Widget fieldPassword(UserFormBack back) {
    return TextFormField(
      validator: back.validatePassword,
      onSaved: (value) => back.user.password = value,
      initialValue: back.user.password,
      decoration: InputDecoration(labelText: 'Senha: '),
    );
  }

  Widget fieldCategory(UserFormBack back) {
    return TextFormField(
      validator: back.validateCategory,
      onSaved: (value) => back.user.category = value,
      initialValue: back.user.category,
      decoration: InputDecoration(labelText: 'Tipo: '),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _back = UserFormBack(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar usuário'),
        actions: [
          IconButton(
              onPressed: () {
                _form.currentState.validate();
                _form.currentState.save();
                if (_back.isValid) {
                  _back.saveUser();
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
                fieldName(_back),
                fieldCpf(_back),
                fieldEmail(_back),
                fieldLogin(_back),
                fieldPassword(_back),
                fieldCategory(_back)
              ],
            )),
      ),
    );
  }
}
