//@dart = 2.9

import 'package:app_patine/app/domain/entities/exercicio.dart';

abstract class ExercicioDAO {
  save(Exercicio exercicio);

  remove(int id);

  Future<List<Exercicio>> find();
}
