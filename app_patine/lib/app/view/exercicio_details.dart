//@dart=2.9
import 'package:app_patine/app/domain/entities/exercise.dart';
import 'package:app_patine/app/view/exercise_details_back.dart';
import 'package:flutter/material.dart';

class ExercicioDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _back = ExercicioDetailsBack(context);
    Exercicio exercicio = _back.exercicio;

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Scaffold(
        body: ListView(
          children: [
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
