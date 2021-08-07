//@dart=2.9
import 'package:app_patine/app/injection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'app/my_app.dart';

void main() async {
  setupInjection();
  runApp(MyApp());

  await Firebase.initializeApp();

  FirebaseFirestore.instance.collection('usuario').doc().set({
    'nome': 'Maria da Silva',
    'cpf': '123.456.789-00',
    'email': 'maria@email.com',
    'login': 'maria_silva',
    'senha': '123456',
    'tipo': 'T'
  });

  FirebaseFirestore.instance
      .collection('exercicio')
      .doc()
      .set({'nome': 'limões', 'descricao': 'desenhe circulos com os patins'});
}
