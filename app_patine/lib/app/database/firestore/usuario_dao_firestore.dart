//@dart=2.9

import 'package:app_patine/app/domain/entities/usuario.dart';
import 'package:app_patine/app/domain/interfaces/usuario_dao.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UsuarioDAOFirestore implements UsuarioDAO {
  CollectionReference usuarioCollection;

  UsuarioDAOFirestore() {
    usuarioCollection = FirebaseFirestore.instance.collection('usuario');
  }

  @override
  Future<List<Usuario>> find() async {
    var result = await usuarioCollection.get();
    return result.docs
        .map((doc) => Usuario(
            id: doc.reference.id.toString(),
            nome: doc['nome'],
            email: doc['email'],
            likes: doc['likes'],
            dislikes: doc['dislikes'],
            tipo: doc['tipo'],
            urlAvatar: doc['url_avatar']))
        .toList();
  }

  @override
  remove(id) {
    usuarioCollection.doc(id).delete();
  }

  //fazer a chamada de firestoreAuth
  @override
  save(Usuario usuario) {
//firebaseAuth;
//usuario.idAuth = firebaseAuth.uid;
//usuario.likes = 0;
//usuario.dislikes = 0;

    usuarioCollection.doc(usuario.id).set({
      'nome': usuario.nome,
      'email': usuario.email,
      'likes': usuario.likes,
      'dislikes': usuario.dislikes,
      'tipo': usuario.tipo,
      'url_avatar': usuario.urlAvatar
    });
  }
}
