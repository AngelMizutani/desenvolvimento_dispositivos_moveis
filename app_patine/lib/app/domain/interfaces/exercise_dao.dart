//@dart = 2.9

import 'package:app_patine/app/domain/entities/exercise.dart';

abstract class ExerciseDAO {
  save(Exercise exercise);

  remove(int id);

  Future<List<Exercise>> find();
}
