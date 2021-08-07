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

  var collection_usuario = FirebaseFirestore.instance.collection('usuario');

  collection_usuario.snapshots().listen((r) {
    print('*** Usuários ***');
    for (var doc in r.docs) {
      print(doc['nome']);
    }
  });

  var collection_exercicio = FirebaseFirestore.instance.collection('exercicio');

  collection_exercicio.snapshots().listen((r) {
    print('*** Exercícios ***');
    for (var doc in r.docs) {
      print('Nome: ${doc['nome']}');
      print('Descrição: ${doc['descricao']}');
    }
  });

  // FirebaseFirestore.instance.collection('usuario').doc().set({
  //   'nome': 'João da Silva',
  //   'cpf': '456.789.123-00',
  //   'email': 'joao@email.com',
  //   'login': 'joao_silva',
  //   'senha': '123456',
  //   'tipo': 'T'
  // });

  // FirebaseFirestore.instance.collection('exercicio').doc().set({
  //   'nome': 'freio delta',
  //   'descricao': 'faça um v invertido para diminuir a velocidade'
  // });
}
