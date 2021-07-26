//@dart=2.9

import 'package:app_patine/app/domain/entities/user.dart';

abstract class UserDAO {
  save(User user);

  remove(int id);

  Future<List<User>> find();
}
