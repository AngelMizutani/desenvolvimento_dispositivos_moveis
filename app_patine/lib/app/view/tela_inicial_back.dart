//@dart=2.9

import 'package:app_patine/app/domain/entities/usuario.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class TelaInicialBack {
  BuildContext context;
  User user;

  //pegar o usuario da collection passando uid por parametro
// static Future<FirebaseUser> getUsuarioAtual() async {

//     FirebaseAuth auth = FirebaseAuth.instance;
//     return await auth.currentUser();
//   }

//   static Future<Usuario> getDadosUsuarioLogado() async {

//     FirebaseUser firebaseUser = await getUsuarioAtual();
//     String idUsuario = firebaseUser.uid;

//     Firestore db = Firestore.instance;

//     DocumentSnapshot snapshot = await db.collection("usuarios")
//       .document(idUsuario)
//       .get();

//     Map<String, dynamic> dados = snapshot.data;
//     String tipoUsuario = dados["tipoUsuario"];
//     String email = dados["email"];
//     String nome = dados["nome"];

//     Usuario usuario = Usuario();
//     usuario.idUsuario = idUsuario;
//     usuario.tipoUsuario = tipoUsuario;
//     usuario.email = email;
//     usuario.nome = nome;

//     return usuario;
//   }

  TelaInicialBack(this.context) {
    user = ModalRoute.of(context).settings.arguments;
  }

  goBack() {
    Navigator.of(context).pop();
  }
}
