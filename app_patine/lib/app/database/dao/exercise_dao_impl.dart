//@dart=2.9

import 'package:app_patine/app/database/sqlite/connection.dart';
import 'package:app_patine/app/domain/entities/exercise.dart';
import 'package:app_patine/app/domain/interfaces/exercise_dao.dart';
import 'package:sqflite/sqflite.dart';

class ExerciseDAOImpl implements ExerciseDAO {
  Database _db;

  @override
  Future<List<Exercise>> find() async {
    _db = await Connection.get();
    List<Map<String, dynamic>> result = await _db.query('exercises');
    List<Exercise> list = List.generate(result.length, (index) {
      var row = result[index];
      return Exercise(
          id: row['id'],
          name: row['name'],
          description: row['description'],
          instructorId: row['instructor_id']);
    });

    return list;
  }

  @override
  remove(int id) async {
    _db = await Connection.get();
    var sql = 'DELETE FROM exercises WHERE id = ?';
    _db.rawDelete(sql, [id]);
  }

  @override
  save(Exercise exercise) async {
    _db = await Connection.get();
    var sql;

    if (exercise.id == null) {
      sql =
          'INSERT INTO exercises (name, description, instructor_id) VALUES (?, ?, ?)';

      _db.rawInsert(
          sql, [exercise.name, exercise.description, exercise.instructorId]);
    } else {
      sql =
          'UPDATE exercises SET name = ?, description = ?, instructor_id = ? WHERE id = ?';
      _db.rawUpdate(sql, [
        exercise.name,
        exercise.description,
        exercise.instructorId,
        exercise.id
      ]);
    }
  }
}
