//@dart=2.9

import 'package:app_patine/app/authentication/firebase_authentication.dart';
import 'package:app_patine/app/domain/entities/usuario.dart';
import 'package:app_patine/app/domain/interfaces/usuario_dao.dart';
import 'package:app_patine/app/my_app.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';

class UsuarioDAOFirestore implements UsuarioDAO {
  CollectionReference usuarioCollection;
  FirebaseAuth auth = FirebaseAuth.instance;

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

  @override
  save(Usuario usuario) {
    auth
        .createUserWithEmailAndPassword(
            email: usuario.email, password: usuario.senha)
        .then((UserCredential user) {
      usuarioCollection.doc(user.user.uid).set({
        'nome': usuario.nome,
        'email': usuario.email,
        'likes': usuario.likes,
        'dislikes': usuario.dislikes,
        'tipo': usuario.tipo,
        'url_avatar': usuario.urlAvatar
      });
    });
  }

  Future<Usuario> getDadosUsuarioLogado(User user) async {
    String idUsuario = user.uid;
    FirebaseFirestore db = FirebaseFirestore.instance;

    DocumentSnapshot snapshot =
        await db.collection("usuario").doc(idUsuario).get();

    Map<String, dynamic> dados = snapshot.data();

    String nome = dados['nome'];
    String email = dados["email"];
    int likes = dados["likes"];
    int dislikes = dados["dislikes"];
    String tipo = dados["tipo"];
    String urlAvatar = dados["url_avatar"];

    Usuario usuario = Usuario();
    usuario.id = idUsuario;
    usuario.nome = nome;
    usuario.email = email;
    usuario.likes = likes;
    usuario.dislikes = dislikes;
    usuario.tipo = tipo;
    usuario.urlAvatar = urlAvatar;

    return usuario;
  }
}
