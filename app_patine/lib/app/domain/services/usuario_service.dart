//@dart = 2.9

import 'package:app_patine/app/domain/entities/usuario.dart';
import 'package:app_patine/app/domain/exception/domain_layer_exception.dart';
import 'package:app_patine/app/domain/interfaces/usuario_dao.dart';
import 'package:get_it/get_it.dart';

class UsuarioService {
  var _dao = GetIt.I.get<UsuarioDAO>();

  save(Usuario usuario) {
    validarNome(usuario.nome);
    validarCpf(usuario.cpf);
    validarEmail(usuario.email);
    validarLogin(usuario.login);
    validarSenha(usuario.senha);
    validarTipo(usuario.tipo);
    _dao.save(usuario);
  }

  remove(dynamic id) {
    _dao.remove(id);
  }

  Future<List<Usuario>> find() {
    return _dao.find();
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

  //cpf deve ser obrigatorio e ter 14 caracteres no máximo
  validarCpf(String cpf) {
    if (cpf == null) {
      throw new DomainLayerException('CPF é obrigatório');
    }
    if (cpf.length > 14) {
      throw new DomainLayerException('CPF deve ter no máximo 14 caracteres');
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

  // o login deve obrigatório e ter no mínimo 3 e no máximo 255 caracteres
  validarLogin(String login) {
    var min = 3;
    var max = 255;

    if (login == null) {
      throw new DomainLayerException('O login é obrigatório');
    } else if (login.length < min) {
      throw new DomainLayerException(
          'O login deve ter pelo menos $min caracteres');
    } else if (login.length > max) {
      throw new DomainLayerException(
          'O login deve ter no máximo $max caracteres');
    }
  }

  //a senha é obrigatória e deve conter no minimo 6 e no máximo 255 caracteres
  validarSenha(String senha) {
    var min = 6;
    var max = 255;

    if (senha == null) {
      throw new DomainLayerException('A senha é obrigatória');
    } else if (senha.length < min) {
      throw new DomainLayerException(
          'A senha deve ter pelo menos $min caracteres');
    } else if (senha.length > max) {
      throw new DomainLayerException(
          'A senha deve ter no máximo $max caracteres');
    }
  }

  //o tipo só pode ser T ou A
  validarTipo(String tipo) {
    if (tipo != 'T' && tipo != 'A') {
      throw new DomainLayerException('O tipo só pode ser T ou A');
    }
  }
}
