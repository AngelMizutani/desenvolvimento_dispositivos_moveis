//@dart=2.9

import 'package:app_patine/app/database/sqlite/connection.dart';
import 'package:app_patine/app/domain/entities/exercicio.dart';
import 'package:app_patine/app/domain/interfaces/exercicio_dao.dart';
import 'package:sqflite/sqflite.dart';

class ExercicioDAOImpl implements ExercicioDAO {
  Database _db;

  @override
  Future<List<Exercicio>> find() async {
    _db = await Connection.get();
    List<Map<String, dynamic>> resultado = await _db.query('exercicios');
    List<Exercicio> lista = List.generate(resultado.length, (index) {
      var linha = resultado[index];
      return Exercicio(
          id: linha['id'],
          nome: linha['nome'],
          descricao: linha['descricao'],
          urlImagem: linha['url_imagem'],
          likes: linha['likes'],
          dislikes: linha['dislikes']
          //treinadorId: linha['treinador_id']
          );
    });

    return lista;
  }

  @override
  remove(dynamic id) async {
    _db = await Connection.get();
    var sql = 'DELETE FROM exercicios WHERE id = ?';
    _db.rawDelete(sql, [id]);
  }

  @override
  save(Exercicio exercicio) async {
    _db = await Connection.get();
    var sql;

    if (exercicio.id == null) {
      sql =
          'INSERT INTO exercicios (nome, descricao, url_imagem, likes, dislikes) VALUES (?, ?, ?, 0, 0)';

      _db.rawInsert(sql, [
        exercicio.nome,
        exercicio.descricao,
        exercicio.urlImagem,
        exercicio.likes,
        exercicio.dislikes
      ]);
    } else {
      sql =
          'UPDATE exercicios SET nome = ?, descricao = ?, url_imagem= ?, likes = ?, dislikes = ? WHERE id = ?';
      _db.rawUpdate(sql, [
        exercicio.nome,
        exercicio.descricao,
        exercicio.urlImagem,
        exercicio.likes,
        exercicio.dislikes,
        //exercicio.treinadorId,
        exercicio.id
      ]);
    }
  }
}
