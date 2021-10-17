//@dart=2.9

import 'dart:convert';

import 'package:app_patine/app/domain/entities/exercicio.dart';
import 'package:app_patine/app/domain/interfaces/exercicio_dao.dart';
import 'package:http/http.dart' as http;

class ExercicioDAOMySQL implements ExercicioDAO {
  final uriREST = Uri.parse('http://192.168.56.1:8080/exercicio');

  @override
  Future<List<Exercicio>> find() async {
    var resposta = await http.get(uriREST);

    if (resposta.statusCode != 200) throw Exception('Erro ao obter dados');

    Iterable lista = json.decode(resposta.body);

    var listaExercicio = List<Exercicio>.from(lista.map((item) => Exercicio(
        id: item['id'],
        nome: item['nome'],
        descricao: item['descricao'],
        urlImagem: item['urlImagem'])));

    return listaExercicio;
  }

  @override
  remove(id) async {
    var uri = Uri.parse('http://192.168.56.1:8080/exercicio/$id');
    var resposta = await http.delete(uri);

    if (resposta.statusCode != 200) throw Exception('Erro ao deletar');
  }

  @override
  save(Exercicio exercicio) async {
    var headers = {'Content-Type': 'application/json'};

    var exercicioJson = jsonEncode({
      'id': exercicio.id,
      'nome': exercicio.nome,
      'descricao': exercicio.descricao,
      'urlImagem': exercicio.urlImagem
    });

    int statusCode = 0;

    if (exercicio.id == null) {
      //salvar
      var resposta =
          await http.post(uriREST, headers: headers, body: exercicioJson);
      statusCode = resposta.statusCode;
    } else {
      //alterar
      var resposta =
          await http.put(uriREST, headers: headers, body: exercicioJson);
      statusCode = resposta.statusCode;
    }

    if (statusCode != 200) throw Exception('Erro ao salvar');
  }
}
