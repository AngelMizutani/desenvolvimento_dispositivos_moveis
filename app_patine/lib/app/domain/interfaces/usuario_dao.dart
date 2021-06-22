//@dart=2.9

import 'package:app_patine/app/domain/entities/usuario.dart';

abstract class UsuarioDAO {
  save(Usuario usuario);

  remove(int id);

  Future<List<Usuario>> find();
}
