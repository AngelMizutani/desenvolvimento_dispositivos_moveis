// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.9

part of 'lista_usuarios_back.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListaUsuariosBack on _ListaUsuariosBack, Store {
  final _$listaAtom = Atom(name: '_ListaUsuariosBack.lista');

  @override
  Future<List<Usuario>> get lista {
    _$listaAtom.reportRead();
    return super.lista;
  }

  @override
  set lista(Future<List<Usuario>> value) {
    _$listaAtom.reportWrite(value, super.lista, () {
      super.lista = value;
    });
  }

  final _$_ListaUsuariosBackActionController =
      ActionController(name: '_ListaUsuariosBack');

  @override
  dynamic atualizarListaUsuarios([dynamic value]) {
    final _$actionInfo = _$_ListaUsuariosBackActionController.startAction(
        name: '_ListaUsuariosBack.atualizarListaUsuarios');
    try {
      return super.atualizarListaUsuarios(value);
    } finally {
      _$_ListaUsuariosBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
lista: ${lista}
    ''';
  }
}
