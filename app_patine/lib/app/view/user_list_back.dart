//@dart=2.9

import 'package:app_patine/app/domain/entities/user.dart';
import 'package:app_patine/app/domain/services/user_service.dart';
import 'package:app_patine/app/my_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'user_list_back.g.dart';
//flutter packages pub run build_runner watch

class UserListBack = _UserListBack with _$UserListBack;

abstract class _UserListBack with Store {
  var _service = GetIt.I.get<UserService>();

  //exibir lista de usuários
  @observable
  Future<List<User>> list;

  //atualizar lista de usuarios
  @action
  updateUserList([dynamic value]) {
    list = _service.find();
  }

  _UserListBack() {
    updateUserList();
  }

  //navegar até o formulario para salvar ou alterar usuario
  goToForm(BuildContext context, [User user]) {
    Navigator.of(context)
        .pushNamed(MyApp.USER_FORM, arguments: user)
        .then(updateUserList);
  }

  goToUserDetails(BuildContext context, User user) {
    Navigator.of(context).pushNamed(MyApp.USER_DETAILS, arguments: user);
  }

  //excluir usuarios
  removeUser(int id) {
    _service.remove(id);
    updateUserList();
  }
}
