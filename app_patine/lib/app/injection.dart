//@dart=2.9

import 'package:app_patine/app/database/dao/exercise_dao_impl.dart';
import 'package:app_patine/app/database/dao/user_dao_impl.dart';
import 'package:app_patine/app/domain/interfaces/exercise_dao.dart';
import 'package:app_patine/app/domain/interfaces/user_dao.dart';
import 'package:app_patine/app/domain/services/exercise_service.dart';
import 'package:app_patine/app/domain/services/user_service.dart';
import 'package:get_it/get_it.dart';

setupInjection() {
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<ExerciseDAO>(ExerciseDAOImpl());
  getIt.registerSingleton<UserDAO>(UserDAOImpl());
  getIt.registerSingleton<ExerciseService>(ExerciseService());
  getIt.registerSingleton<UserService>(UserService());
}
