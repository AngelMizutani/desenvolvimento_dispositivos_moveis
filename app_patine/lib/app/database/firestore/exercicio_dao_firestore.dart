//@dart=2.9

import 'package:app_patine/app/domain/entities/exercicio.dart';
import 'package:app_patine/app/domain/interfaces/exercicio_dao.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ExercicioDAOFirestore implements ExercicioDAO {
  CollectionReference exercicioCollection;

  ExercicioDAOFirestore() {
    exercicioCollection = FirebaseFirestore.instance.collection('exercicio');
  }

  @override
  Future<List<Exercicio>> find() async {
    var result = await exercicioCollection.get();
    return result.docs
        .map((doc) => Exercicio(
            id: doc.reference.id.toString(),
            nome: doc['nome'],
            descricao: doc['descricao'],
            urlImagem: doc['urlImagem'],
            likes: doc['likes'],
            dislikes: doc['dislikes']
            // treinadorId: doc['treinador_id']
            ))
        .toList();
  }

  @override
  remove(id) {
    exercicioCollection.doc(id).delete();
  }

  @override
  save(Exercicio exercicio) {
    exercicioCollection.doc(exercicio.id).set({
      'nome': exercicio.nome,
      'descricao': exercicio.descricao,
      'urlImagem': exercicio.urlImagem,
      'likes': exercicio.likes,
      'dislikes': exercicio.dislikes
      // 'treinadorId': exercicio.treinadorId
    });
  }
}
