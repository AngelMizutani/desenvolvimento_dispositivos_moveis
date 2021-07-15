//@dart=2.9

import 'package:app_patine/app/database/sqlite/scripts.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Connection {
  static Future<Database> get() async {
    Database _db;

    if (_db == null) {
      var path = join(await getDatabasesPath(), 'banco_patine');
      //deleteDatabase(path);
      _db = await openDatabase(path, version: 1, onCreate: (db, v) {
        db.execute(createTable);
        db.execute(insertTreinador1);
        db.execute(insertTreinador2);
        db.execute(insertAprendiz1);
        db.execute(insertAprendiz2);
        db.execute(createTableExercicios);
        db.execute(insertExercicio1);
        db.execute(insertExercicio2);
        db.execute(insertExercicio3);
      });
    }
    return _db;
  }
}
