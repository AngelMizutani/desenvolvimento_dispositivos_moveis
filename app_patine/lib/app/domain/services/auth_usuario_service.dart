//@dart=2.9

class AuthUsuarioService {
  static String validarEmail({String email}) {
    if (email == null) {
      return null;
    }

    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    if (email.isEmpty) {
      return 'Email é obrigatório';
    } else if (!emailRegExp.hasMatch(email)) {
      return 'Informe um email correto';
    }
    return null;
  }

  static String validarSenha({String senha}) {
    if (senha == null) {
      return null;
    }

    if (senha.isEmpty) {
      return 'A senha é obrigatória';
    } else if (senha.length < 6) {
      return 'A senha deve ter no mínimo 6 caracteres';
    }

    return null;
  }
}
