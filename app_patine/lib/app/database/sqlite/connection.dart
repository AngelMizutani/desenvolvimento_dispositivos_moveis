//@dart=2.9

import 'package:app_patine/app/database/sqlite/scripts.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Connection {
  static Future<Database> get() async {
    Database _db;

    if (_db == null) {
      var path = join(await getDatabasesPath(), 'patine_database');
      //deleteDatabase(path);
      _db = await openDatabase(path, version: 1, onCreate: (db, v) {
        db.execute(createTable);
        db.execute(insertInstructor1);
        db.execute(insertInstructor2);
        db.execute(insertApprentice1);
        db.execute(insertApprentice2);
        db.execute(createTableExercises);
        db.execute(insertExercise1);
        db.execute(insertExercise2);
        db.execute(insertExercise3);
      });
    }
    return _db;
  }
}
