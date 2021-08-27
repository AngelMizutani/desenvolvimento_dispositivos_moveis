//@dart = 2.9

import 'package:app_patine/app/database/firestore/usuario_dao_firestore.dart';
import 'package:app_patine/app/domain/entities/usuario.dart';
import 'package:app_patine/app/domain/exception/domain_layer_exception.dart';
import 'package:app_patine/app/domain/interfaces/usuario_dao.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

class UsuarioService {
  var _dao = GetIt.I.get<UsuarioDAO>();
  var _daoFirestore = UsuarioDAOFirestore();

  save(Usuario usuario) {
    validarNome(usuario.nome);
    validarEmail(usuario.email);
    validarTipo(usuario.tipo);
    _dao.save(usuario);
  }

  aumentarLikes(Usuario usuario) {
    _daoFirestore.aumentarLikes(usuario);
  }

  aumentarDislikes(Usuario usuario) {
    _daoFirestore.aumentarDislikes(usuario);
  }

  remove(dynamic id) {
    _dao.remove(id);
  }

  Future<List<Usuario>> find() {
    return _dao.find();
  }

  Future<Usuario> getUsuario(User user) async {
    return _daoFirestore.getDadosUsuarioLogado(user);
  }

  // o nome deve obrigatório e ter no mínimo 3 e no máximo 255 caracteres
  validarNome(String nome) {
    var min = 3;
    var max = 255;

    if (nome == null) {
      throw new DomainLayerException('O nome é obrigatório');
    } else if (nome.length < min) {
      throw new DomainLayerException(
          'O nome deve ter pelo menos $min caracteres');
    } else if (nome.length > max) {
      throw new DomainLayerException(
          'O nome deve ter no máximo $max caracteres');
    }
  }

  //email é obrigatorio e deve conter @
  validarEmail(String email) {
    if (email == null) {
      throw new DomainLayerException('O email é obrigatório');
    } else if (!email.contains('@')) {
      throw new DomainLayerException('Email deve conter @');
    }
  }

  //o tipo só pode ser T ou A
  validarTipo(String tipo) {
    if (tipo != 'T' && tipo != 'A') {
      throw new DomainLayerException('O tipo só pode ser T ou A');
    }
  }
}
