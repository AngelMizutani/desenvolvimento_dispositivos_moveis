//@dart=2.9

import 'package:app_patine/app/database/dao/exercicio_dao_impl.dart';
import 'package:app_patine/app/database/dao/usuario_dao_impl.dart';
import 'package:app_patine/app/domain/interfaces/exercicio_dao.dart';
import 'package:app_patine/app/domain/interfaces/usuario_dao.dart';
import 'package:get_it/get_it.dart';

setupInjection() {
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<ExercicioDAO>(ExercicioDAOImpl());
  getIt.registerSingleton<UsuarioDAO>(UsuarioDAOImpl());
}
