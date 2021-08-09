//@dart=2.9

import 'package:app_patine/app/database/sqlite/connection.dart';
import 'package:app_patine/app/domain/entities/usuario.dart';
import 'package:app_patine/app/domain/interfaces/usuario_dao.dart';
import 'package:sqflite/sqflite.dart';

class UsuarioDAOImpl implements UsuarioDAO {
  Database _db;

  @override
  Future<List<Usuario>> find() async {
    _db = await Connection.get();
    List<Map<String, dynamic>> resultado = await _db.query('usuario');
    List<Usuario> lista = List.generate(resultado.length, (index) {
      var linha = resultado[index];
      return Usuario(
          id: linha['id'],
          nome: linha['nome'],
          cpf: linha['cpf'],
          email: linha['email'],
          login: linha['login'],
          senha: linha['senha'],
          tipo: linha['tipo']);
    });

    return lista;
  }

  @override
  remove(dynamic id) async {
    _db = await Connection.get();
    var sql = 'DELETE FROM usuario WHERE id = ?';
    _db.rawDelete(sql, [id]);
  }

  @override
  save(Usuario usuario) async {
    _db = await Connection.get();
    var sql;

    if (usuario.id == null) {
      sql =
          'INSERT INTO usuario (nome, cpf, email, login, senha, tipo) VALUES (?, ?, ?, ?, ?, ?)';
      _db.rawInsert(sql, [
        usuario.nome,
        usuario.cpf,
        usuario.email,
        usuario.login,
        usuario.senha,
        usuario.tipo
      ]);
    } else {
      sql =
          'UPDATE usuario SET nome = ?, cpf = ?, email = ?, login = ?, senha = ?, tipo = ? WHERE id = ?';
      _db.rawUpdate(sql, [
        usuario.nome,
        usuario.cpf,
        usuario.email,
        usuario.login,
        usuario.senha,
        usuario.tipo,
        usuario.id
      ]);
    }
  }
}
