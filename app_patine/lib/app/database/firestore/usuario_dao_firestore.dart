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
            cpf: doc['cpf'],
            email: doc['email'],
            login: doc['login'],
            senha: doc['senha'],
            tipo: doc['tipo']))
        .toList();
  }

  @override
  remove(id) {
    usuarioCollection.doc(id).delete();
  }

  @override
  save(Usuario usuario) {
    usuarioCollection.doc(usuario.id).set({
      'nome': usuario.nome,
      'cpf': usuario.cpf,
      'email': usuario.email,
      'login': usuario.login,
      'senha': usuario.senha,
      'tipo': usuario.tipo
    });
  }
}
