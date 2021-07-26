//@dart=2.9

import 'package:app_patine/app/database/sqlite/connection.dart';
import 'package:app_patine/app/domain/entities/user.dart';
import 'package:app_patine/app/domain/interfaces/user_dao.dart';
import 'package:sqflite/sqflite.dart';

class UserDAOImpl implements UserDAO {
  Database _db;

  @override
  Future<List<User>> find() async {
    _db = await Connection.get();
    List<Map<String, dynamic>> result = await _db.query('users');
    List<User> list = List.generate(result.length, (index) {
      var row = result[index];
      return User(
          id: row['id'],
          name: row['name'],
          cpf: row['cpf'],
          email: row['email'],
          login: row['login'],
          password: row['password'],
          category: row['category']);
    });

    return list;
  }

  @override
  remove(int id) async {
    _db = await Connection.get();
    var sql = 'DELETE FROM user WHERE id = ?';
    _db.rawDelete(sql, [id]);
  }

  @override
  save(User user) async {
    _db = await Connection.get();
    var sql;

    if (user.id == null) {
      sql =
          'INSERT INTO users (name, cpf, email, login, password, category) VALUES (?, ?, ?, ?, ?, ?)';
      _db.rawInsert(sql, [
        user.name,
        user.cpf,
        user.email,
        user.login,
        user.password,
        user.category
      ]);
    } else {
      sql =
          'UPDATE users SET nome = ?, cpf = ?, email = ?, login = ?, senha = ?, tipo = ? WHERE id = ?';
      _db.rawUpdate(sql, [
        user.name,
        user.cpf,
        user.email,
        user.login,
        user.password,
        user.category,
        user.id
      ]);
    }
  }
}
