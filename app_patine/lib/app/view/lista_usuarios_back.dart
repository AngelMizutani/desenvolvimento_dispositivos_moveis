//@dart=2.9

import 'package:app_patine/app/domain/entities/usuario.dart';
import 'package:app_patine/app/domain/services/usuario_service.dart';
import 'package:app_patine/app/my_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'lista_usuarios_back.g.dart';

class ListaUsuariosBack = _ListaUsuariosBack with _$ListaUsuariosBack;

abstract class _ListaUsuariosBack with Store {
  BuildContext context;
  Usuario usuario;
  var _service = GetIt.I.get<UsuarioService>();

  //exibir lista de usuários
  @observable
  Future<List<Usuario>> lista;

  //atualizar lista de usuarios
  @action
  atualizarListaUsuarios([dynamic value]) {
    lista = _service.find();
  }

  _ListaUsuariosBack(this.context) {
    usuario = ModalRoute.of(context).settings.arguments;
    atualizarListaUsuarios();
  }

  //navegar até o formulario para salvar ou alterar usuario
  irParaFormulario(BuildContext context, [Usuario usuario]) {
    Navigator.of(context)
        .pushNamed(MyApp.FORM_USUARIO, arguments: usuario)
        .then(atualizarListaUsuarios);
  }

  goToUserDetails(BuildContext context, Usuario usuario) {
    Navigator.of(context).pushNamed(MyApp.USER_DETAILS, arguments: usuario);
  }

  //excluir usuarios
  excluirUsuario(dynamic id) {
    _service.remove(id);
    atualizarListaUsuarios();
  }

  aumentarLikes(Usuario usuario) {
    _service.aumentarLikes(usuario);
    atualizarListaUsuarios();
  }

  aumentarDislikes(Usuario usuario) {
    _service.aumentarDislikes(usuario);
    atualizarListaUsuarios();
  }
}
