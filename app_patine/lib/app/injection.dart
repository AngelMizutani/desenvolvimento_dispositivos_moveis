//@dart=2.9

import 'package:app_patine/app/database/dao/exercicio_dao_impl.dart';
import 'package:app_patine/app/database/dao/usuario_dao_impl.dart';
import 'package:app_patine/app/database/mysql/exercicio_dao_mysql.dart';
// import 'package:app_patine/app/database/firestore/exercicio_dao_firestore.dart';
// import 'package:app_patine/app/database/firestore/usuario_dao_firestore.dart';
import 'package:app_patine/app/domain/interfaces/exercicio_dao.dart';
import 'package:app_patine/app/domain/interfaces/usuario_dao.dart';
import 'package:app_patine/app/domain/services/exercicio_service.dart';
// import 'package:app_patine/app/domain/services/usuario_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

setupInjection() async {
  GetIt getIt = GetIt.I;

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // getIt.registerSingleton<ExercicioDAO>(ExercicioDAOImpl());
  // getIt.registerSingleton<UsuarioDAO>(UsuarioDAOImpl());
  // getIt.registerSingleton<ExercicioDAO>(ExercicioDAOFirestore());
  // getIt.registerSingleton<UsuarioDAO>(UsuarioDAOFirestore());
  getIt.registerSingleton<ExercicioDAO>(ExercicioDAOMySQL());
  getIt.registerSingleton<ExercicioService>(ExercicioService());
  //getIt.registerSingleton<UsuarioService>(UsuarioService());
}
