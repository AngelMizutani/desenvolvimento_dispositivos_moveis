//@dart=2.9
import 'package:app_patine/app/view/form_exercicio_back.dart';
import 'package:flutter/material.dart';

class FormExercicio extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  Widget campoNome(FormExercicioBack back) {
    return TextFormField(
      validator: back.validarNome,
      onSaved: (valor) => back.exercicio.nome = valor,
      initialValue: back.exercicio.nome,
      decoration: InputDecoration(labelText: 'Nome:'),
    );
  }

  Widget campoDescricao(FormExercicioBack back) {
    return TextFormField(
      validator: back.validarDescricao,
      onSaved: (valor) => back.exercicio.descricao = valor,
      initialValue: back.exercicio.descricao,
      decoration: InputDecoration(labelText: 'Descrição:'),
    );
  }

  Widget campoTreinadorId(FormExercicioBack back) {
    return TextFormField(
      keyboardType: TextInputType.number,
      validator: back.validarTreinador,
      onSaved: (valor) => back.exercicio.treinadorId = int.parse(valor),
      initialValue: back.exercicio.treinadorId.toString(),
      decoration: InputDecoration(labelText: 'Id Treinador:'),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _back = FormExercicioBack(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar exercício'),
        actions: [
          IconButton(
              onPressed: () {
                _form.currentState.validate();
                _form.currentState.save();
                if (_back.isValid) {
                  _back.salvarExercicio();
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
                campoDescricao(_back),
                campoTreinadorId(_back)
              ],
            )),
      ),
    );
  }
}
