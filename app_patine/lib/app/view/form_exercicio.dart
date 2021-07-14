import 'package:app_patine/app/view/form_exercicio_back.dart';
import 'package:flutter/material.dart';

class FormExercicio extends StatelessWidget {
  Widget campoNome(FormExercicioBack back) {
    return TextFormField(
      initialValue: back.exercicio.nome,
      decoration: InputDecoration(labelText: 'Nome:'),
    );
  }

  Widget campoDescricao(FormExercicioBack back) {
    return TextFormField(
      initialValue: back.exercicio.descricao,
      decoration: InputDecoration(labelText: 'Descrição:'),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _back = FormExercicioBack(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar exercício'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
            child: Column(
          children: [campoNome(_back), campoDescricao(_back)],
        )),
      ),
    );
  }
}
