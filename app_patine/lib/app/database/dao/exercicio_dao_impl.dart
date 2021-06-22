//@dart=2.9

import 'package:app_patine/app/database/sqlite/connection.dart';
import 'package:app_patine/app/domain/entities/exercicio.dart';
import 'package:app_patine/app/domain/interfaces/exercicio_dao.dart';
import 'package:sqflite/sqflite.dart';

class ExercicioDAOImpl implements ExercicioDAO {
  Database _db;

  @override
  Future<List<Exercicio>> find() async {
    _db = await Connection.getExercicios();
    List<Map<String, dynamic>> resultado = await _db.query('exercicios');
    List<Exercicio> lista = List.generate(resultado.length, (index) {
      var linha = resultado[index];
      return Exercicio(
          id: linha['id'],
          nome: linha['nome'],
          descricao: linha['descricao'],
          treinadorId: linha['treinador_id']);
    });

    return lista;
  }

  @override
  remove(int id) async {
    _db = await Connection.getExercicios();
    var sql = 'DELETE FROM exercicios WHERE id = ?';
    _db.rawDelete(sql, [id]);
  }

  @override
  save(Exercicio exercicio) async {
    _db = await Connection.getExercicios();
    var sql;

    if (exercicio.id == null) {
      sql =
          'INSERT INTO exercicios (nome, descricao, treinador_id) VALUES (?, ?, ?)';

      _db.rawInsert(
          sql, [exercicio.nome, exercicio.descricao, exercicio.treinadorId]);
    } else {
      sql =
          'UPDATE INTO exercicios SET nome = ?, descricao = ?, treinador_id = ?';
      _db.rawUpdate(
          sql, [exercicio.nome, exercicio.descricao, exercicio.treinadorId]);
    }
  }
}
