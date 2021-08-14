//@dart=2.9
import 'package:app_patine/app/domain/entities/exercicio.dart';
import 'package:app_patine/app/view/exercicio_details_back.dart';
import 'package:flutter/material.dart';

class ExercicioDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _back = ExercicioDetailsBack(context);
    Exercicio exercicio = _back.exercicio;

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      var width = constraints.biggest.width;
      var radius = width / 3;
      return Scaffold(
        body: ListView(
          padding: EdgeInsets.all(30),
          children: [
            (Uri.parse(exercicio.urlImagem).isAbsolute)
                ? CircleAvatar(
                    backgroundImage: NetworkImage(exercicio.urlImagem),
                    radius: radius,
                  )
                : CircleAvatar(
                    child: Image.asset('imagens/patins.png'),
                    radius: radius,
                  ),
            Center(
              child: Text(
                '${exercicio.nome}',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                '${exercicio.descricao}',
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back),
          onPressed: () {
            _back.goBack();
          },
        ),
      );
    });
  }
}
